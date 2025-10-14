using Languages;
using LionWeb.Core;
using LionWeb.Core.Utilities;

namespace SpaceDemo.Tests;

[TestClass]
public class ValidatorClientTests
{
    [TestMethod]
    public void PeakPowerExceeded()
    {
        var source = new PowerSource("ps")
        {
            Peak = 100
        };

        var powerModule = new PowerModule("pm")
        {
            Contents =
            [
                source,
                new PowerConsumer("c0")
                {
                    Peak = 50,
                    ProvidedFrom = [source]
                },
                new PowerConsumer("c1")
                {
                    Peak = 60,
                    ProvidedFrom = [source]
                },
            ]
        };

        var valid = new Validator.Validator().Validate(powerModule);
        Assert.IsFalse(valid);
        Assert.HasCount(1, source.GetAnnotations());
        AssertEquals(new Finding("f")
        {
            Code = 1,
            Severity = Severity.warning,
            Message = "Total peak of consumers (110) exceeds source peak"
        }, source.GetAnnotations().First());
    }

    [TestMethod]
    public void PeakPowerFixed()
    {
        var source = new PowerSource("ps")
        {
            Peak = 100
        };

        var finding = new Finding("f")
        {
            Code = 1,
            Severity = Severity.warning,
            Message = "Total peak of consumers (110) exceeds source peak"
        };
        source.AddAnnotations([finding]);
        
        var powerModule = new PowerModule("pm")
        {
            Contents =
            [
                source,
                new PowerConsumer("c0")
                {
                    Peak = 50,
                    ProvidedFrom = [source]
                },
                new PowerConsumer("c1")
                {
                    Peak = 30,
                    ProvidedFrom = [source]
                },
            ]
        };

        var valid = new Validator.Validator().Validate(powerModule);
        Assert.IsTrue(valid);
        Assert.IsEmpty(source.GetAnnotations());
    }

    private static void AssertEquals(IReadableNode expected, IReadableNode actual)
    {
        var differences = new Comparer([expected], [actual]).Compare().ToList();
        Assert.IsEmpty(differences,
            differences.DescribeAll(new ComparerOutputConfig()
                { LeftDescription = "expected", RightDescription = "actual" }));
    }
}