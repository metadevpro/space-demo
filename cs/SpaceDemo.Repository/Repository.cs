using System.Diagnostics;
using Languages;
using LionWeb.Core;
using LionWeb.Core.M1;
using LionWeb.Core.M3;
using LionWeb.Protocol.Delta.Repository;
using LionWeb.WebSocket;

namespace SpaceDemo.Repository;

public class Repository
{
    public static void Main(string[] args)
    {
        Trace.Listeners.Add(new ConsoleTraceListener());

        Log($"server args: {string.Join(", ", args)}");

        var port = args.Length > 0
            ? int.Parse(args[0])
            : 40000;

        LionWebVersions lionWebVersion = LionWebVersions.v2023_1;
        List<Language> languages =
        [
            PowerBudgetLanguage.Instance, FindingLanguage.Instance,
            lionWebVersion.BuiltIns, lionWebVersion.LionCore
        ];

        var webSocketServer = new WebSocketServer(lionWebVersion)
        {
            Languages = languages
        };

        webSocketServer.StartServer("localhost", port);

        var serverForest = new Forest();

        var lionWebServer = new LionWebRepository(lionWebVersion, languages, "server",
            serverForest, webSocketServer.Connector);
        lionWebServer.CommunicationError += (_, exception) => Log(exception.ToString()); 

        Console.ReadLine();
        webSocketServer.Stop();
    }

    private static void Log(string message, bool header = false) =>
        Console.WriteLine(header
            ? $"{ILionWebRepository.HeaderColor_Start}{message}{ILionWebRepository.HeaderColor_End}"
            : message);
}