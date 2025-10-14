# C# implementation of Space DSL

Requirements to run:

* C# 8

* LionWeb-CSharp _unreleased branch_ `websocket` of the `lionweb-csharp` repository.
  That means that you'll have to publish the packages in that repository to your local NuGet repository, or link packages directly through the file system.


## Generate languages

Run in `SpaceDemo.Languages`:

```shell
$ dotnet LionWebGenerator --config <space-DSL Git root>/cs/SpaceDemo.Languages/generate-languages.config.json
```


## Start repository and C# clients

Run in this exact order:

1. in `SpaceDemo.Repository`:
  ```shell
  $ dotnet run [port; default=40000]
  ```
  This starts the _empty_ repository – with ID "`myRepo`" – on the specified port.

2. in `SpaceDemo.Loader`:
  ```shell
  $ dotnet run <space-DSL Git root>/chunks/
  ```
  This _watches_ the `chunks/` dir., and (re-)loads any file which name matches `*.instance.json`, adding the corresponding partitions to the repository.

3. in `SpaceDemo.Validator`:
  ```shell
  $ dotnet run
  ```
  This listens to model changes and validates all partitions.

