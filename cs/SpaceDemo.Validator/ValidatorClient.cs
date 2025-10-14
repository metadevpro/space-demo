using System.Diagnostics;
using Languages;
using LionWeb.Core;
using LionWeb.Core.M1;
using LionWeb.Core.M3;
using LionWeb.Core.Notification;
using LionWeb.Core.Notification.Pipe;
using LionWeb.Protocol.Delta.Client;
using LionWeb.WebSocket;

namespace SpaceDemo.Validator;

class ValidatorClient
{
    public static async Task Main(string[] args)
    {
        Trace.Listeners.Add(new ConsoleTraceListener());

        string name = "Validator";
        string serverIp = "localhost";
        int serverPort = 40000;
        var repositoryId = "myRepo";

        LionWebVersions lionWebVersion = LionWebVersions.v2023_1;
        List<Language> languages = [
            PowerBudgetLanguage.Instance, FindingLanguage.Instance,
            lionWebVersion.BuiltIns, lionWebVersion.LionCore];

        Log($"Starting client {name} to connect to {serverIp}:{serverPort}@{repositoryId}");

        var webSocketClient = new WebSocketClient(name, lionWebVersion);
        
        var forest = new Forest();
        forest.GetNotificationSender()!.ConnectTo(new ValidationTrigger());

        var lionWeb = new LionWebClient(lionWebVersion, languages, $"client_{name}", forest, webSocketClient.Connector);
        lionWeb.CommunicationError += (_, exception) => Log(exception.ToString()); 

        await webSocketClient.ConnectToServer(serverIp, serverPort);
        await lionWeb.SignOn("myRepo");
        await lionWeb.SubscribeToChangingPartitions(true, true, true);

        Console.ReadLine();

        await lionWeb.SignOff();
    }
    
    private class ValidationTrigger : INotificationReceiver
    {
        private readonly Validator _validator = new();
        
        public void Receive(INotificationSender correspondingSender, INotification notification)
        {
            foreach (var powerModule in notification.AffectedNodes.Select(n => n.GetPartition()).OfType<PowerModule>())
            {
                Task.Run(() =>
                {
                    Log($"Validating {powerModule.Name}({powerModule.GetId()})");
                    _validator.Validate(powerModule);
                });
            }
        }
    }
 
    private static void Log(string message, bool header = false) =>
        Console.WriteLine(header
            ? $"{ILionWebClient.HeaderColor_Start}{message}{ILionWebClient.HeaderColor_End}"
            : message);   
}