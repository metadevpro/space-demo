using System.Collections.Concurrent;
using System.Diagnostics;
using Languages;
using LionWeb.Core;
using LionWeb.Core.M1;
using LionWeb.Core.M2;
using LionWeb.Core.M3;
using LionWeb.Core.Serialization;
using LionWeb.Core.Utilities;
using LionWeb.Protocol.Delta.Client;
using LionWeb.WebSocket;

namespace SpaceDemo.Loader;

class Loader
{
    private static readonly LionWebVersions lionWebVersion = LionWebVersions.v2023_1;

    private static readonly List<Language> languages =
    [
        PowerBudgetLanguage.Instance, FindingLanguage.Instance,
        lionWebVersion.BuiltIns, lionWebVersion.LionCore
    ];

    private static readonly Forest forest = new Forest();

    private static readonly BlockingCollection<string> filesToProcess = [];

    static async Task Main(string[] args)
    {
        Trace.Listeners.Add(new ConsoleTraceListener());

        string name = "Loader";
        string serverIp = "localhost";
        int serverPort = 40000;
        var repositoryId = "myRepo";

        Log($"Starting client {name} to connect to {serverIp}:{serverPort}@{repositoryId}");

        var webSocketClient = new WebSocketClient(name, lionWebVersion);

        var lionWeb = new LionWebClient(lionWebVersion, languages, $"client_{name}", forest, webSocketClient.Connector);
        lionWeb.CommunicationError += (_, exception) => Log(exception.ToString());

        await webSocketClient.ConnectToServer(serverIp, serverPort);
        await lionWeb.SignOn("myRepo");

        var path = args[0];
        Log($"Watching {path}");

        var watcher = new FileSystemWatcher(path);

        watcher.NotifyFilter = NotifyFilters.LastWrite
                               | NotifyFilters.FileName
                               | NotifyFilters.DirectoryName;

        var filter = "*.instance.json";
        watcher.Filter = filter;

        watcher.Changed += OnChanged;

        var dir = new DirectoryInfo(path);
        if (dir.Exists)
        {
            foreach (var file in dir.EnumerateFiles(filter))
            {
                filesToProcess.Add(file.FullName);
            }
        }

        watcher.EnableRaisingEvents = true;

        try
        {
            while (!filesToProcess.IsCompleted)
            {
                var filePath = filesToProcess.Take(); //blocking dequeue

                if (File.Exists(filePath))
                    LoadFile(filePath);
            }
        }
        finally
        {
            await lionWeb.SignOff();
        }
    }

    private static void OnChanged(object source, FileSystemEventArgs e)
    {
        Log($"Queueing {e.ChangeType} file {e.FullPath}");

        filesToProcess.Add(e.FullPath);
    }

    private static void LoadFile(string fullPath)
    {
        Log($"Loading file {fullPath}");

        var deserializer = new DeserializerBuilder()
            .WithLionWebVersion(lionWebVersion)
            .WithLanguages(languages)
            .WithHandler(new PreferExistingNodesHandler())
            .Build();

        deserializer.RegisterDependentNodes(forest.Descendants());

        try
        {
            using var stream = File.Open(fullPath, FileMode.Open, FileAccess.Read, FileShare.None);

            var roots = JsonUtils.ReadNodesFromStream(stream, deserializer);

            foreach (var partition in roots.OfType<IPartitionInstance>())
            {
                if (forest.TryGetPartition(partition.GetId(), out var existing))
                {
                    Log($"Merging partition {partition.GetId()}");
                    Merge((INode)partition, (INode)existing);
                }
                else
                {
                    Log($"Storing partition {partition.GetId()}");
                    forest.AddPartitions([partition]);
                }
            }
        }
        catch (Exception ex)
        {
            Log(ex.ToString());
        }
    }

    private static void Merge(INode newNode, INode existing)
    {
        var comparer = new Comparer(new List<INode> { newNode }, new List<INode> { existing });
        var differences = comparer.Compare().Where(d => d is not IContainerDifference).ToList();

        Log($"differences: {differences.Count}");

        foreach (var difference in differences)
        {
            switch (difference)
            {
                case UnsetFeatureLeftDifference { Right: IWritableNode r } d:
                    r.Set(d.Feature, null);
                    break;

                case UnsetFeatureRightDifference { Right: IWritableNode r } d:
                    r.Set(d.Feature, d.Left.Get(d.Feature));
                    break;

                case PropertyValueDifference { Right: IWritableNode r } d:
                    r.Set(d.Property, d.LeftValue);
                    break;

                case InternalTargetDifference { RightOwner: IWritableNode r } d:
                    r.Set(d.Reference,
                        d.Reference.Multiple ? new List<IReadableNode> { d.RightTarget } : d.RightTarget);
                    break;

                case RightSurplusNodeDifference { RightOwner: IWritableNode r, Node: IWritableNode n } d:
                    if (d.Link is null)
                    {
                        r.RemoveAnnotations([n]);
                    }else if (d.Link.Multiple)
                    {
                        var currentValue = d.Link.AsNodes<IReadableNode>(r.Get(d.Link)).ToList();
                        currentValue.Remove(n);
                        r.Set(d.Link, currentValue);
                    }
                    else
                    {
                        r.Set(d.Link, null);
                    }

                    break;

                case LeftSurplusNodeDifference { RightOwner: IWritableNode r, Node: IWritableNode n } d:
                    n.DetachFromParent();
                    if (d.Link is null)
                    {
                        r.AddAnnotations([n]);
                    }
                    else if (d.Link.Multiple)
                    {
                        var currentValue = d.Link.AsNodes<IReadableNode>(r.Get(d.Link)).ToList();
                        currentValue.Add(n);
                        r.Set(d.Link, currentValue);
                    }
                    else
                    {
                        r.Set(d.Link, n);
                    }

                    break;

                default:
                    Log($"unhandled: {difference.GetType()}");
                    break;
            }
        }
    }

    private static void Log(string message, bool header = false) =>
        Console.WriteLine(header
            ? $"{ILionWebClient.HeaderColor_Start}{message}{ILionWebClient.HeaderColor_End}"
            : message);
}

internal class PreferExistingNodesHandler : DeserializerExceptionHandler
{
    public override string? DuplicateNodeId(ICompressedId nodeId, IReadableNode existingNode, IReadableNode node)
    {
        return existingNode.GetId();
    }

    public override bool SkipDeserializingDependentNode(ICompressedId id)
    {
        return false;
    }
}