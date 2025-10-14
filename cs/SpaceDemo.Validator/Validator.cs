// Copyright 2024 TRUMPF Laser GmbH
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-FileCopyrightText: 2024 TRUMPF Laser GmbH
// SPDX-License-Identifier: Apache-2.0

using Languages;
using LionWeb.Core;
using LionWeb.Core.M1;
using LionWeb.Core.Utilities;
using LionWeb.Protocol.Delta.Client;

namespace SpaceDemo.Validator;

public class Validator
{
    private const int PeakPowerExceeded = 1;
    private const int ContinuousPowerExceeded = 2;

    private int _nextNodeId = 0;

    public bool Validate(PowerModule powerModule)
    {
        var result = true;

        result &= Check(powerModule);

        foreach (var content in powerModule.Contents)
        {
            result &= Check(content);
        }

        return result;
    }

    private bool Check(PowerModule powerModule)
    {
        return true;
    }

    private bool Check(IPowerModuleContent content) => content switch
    {
        PowerSource c => Check(c),
        PowerConsumer c => Check(c),
        _ => throw new ArgumentException($"Unknown {nameof(IPowerModuleContent)}: {content}")
    };

    private bool Check(PowerSource source)
    {
        if (source.GetPartition() is not PowerModule module)
            return true;

        var result = true;

        var connectedConsumers = module
            .Contents
            .OfType<PowerConsumer>()
            .Where(c => c.ProvidedFrom.Any(p => p == source))
            .ToList();

        var totalPeak = connectedConsumers.Sum(c => c.Peak);
        if (totalPeak > source.Peak)
        {
            PutFinding(source, new Finding(NodeId())
            {
                Code = PeakPowerExceeded,
                Severity = Severity.warning,
                Message = $"Total peak of consumers ({totalPeak}) exceeds source peak"
            });
            result = false;
        }
        else
        {
            RemoveFinding(source, PeakPowerExceeded);
        }

        var totalContinuous = connectedConsumers.Sum(c => c.Continuous);
        if (totalContinuous > source.Continuous)
        {
            PutFinding(source, new Finding(NodeId())
            {
                Code = ContinuousPowerExceeded,
                Severity = Severity.error,
                Message =
                    $"Total continuous power draw of consumers ({totalContinuous}) exceeds source continuous power draw"
            });
            result = false;
        }
        else
        {
            RemoveFinding(source, ContinuousPowerExceeded);
        }

        return result;
    }

    private bool Check(PowerConsumer consumer)
    {
        return true;
    }

    private string NodeId() =>
        $"ValidatorFinding{++_nextNodeId}";

    private void PutFinding(INode node, Finding finding)
    {
        if (node.GetAnnotations().OfType<Finding>().Any(f =>
                new Comparer([(IReadableNode)finding], [f]).AreEqual()))
            return;

        Log($"Adding finding {finding.Code} to {node.GetId()}");
        node.AddAnnotations([finding]);
    }

    private void RemoveFinding(INode node, int code)
    {
        var annotations = node.GetAnnotations().OfType<Finding>().Where(f => f.Code == code).ToList();
        if (annotations.Count == 0)
            return;

        Log($"Removing finding {code} from {node.GetId()}");
        node.RemoveAnnotations(annotations);
    }

    private static void Log(string message, bool header = false) =>
        Console.WriteLine(header
            ? $"{ILionWebClient.HeaderColor_Start}{message}{ILionWebClient.HeaderColor_End}"
            : message);
}