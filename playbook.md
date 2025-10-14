# Playbook for LionWeb Space Demo at LangDev 2025

## Preparation

1. Open Console with tab "GenMps" in `space-demo/mps`
   * Run `./gradlew generateMps`
   * Type `./gradlew runCommandLineTool -Pargs=". -mspace-demo.home=. -ic -lc"`
1. Open another Console tab "GenCs" in `space/demo/cs/SpaceDemo.Languages`
   * Run `dotnet tool restore`
   * Type `dotnet LionWebGenerator --config generate-languages.config.json`
1. Open another Console tab "GenTs" in `space-demo/ts/packages/build`
   * Type `npm run generate` 
1. Open another Console tab "RunTs" in `space-demo/ts/`
   * Run `npm i`
   * Change to `space-demo/ts/packages/editor`
   * Type `npm run dev` 
1. Open MPS 2021.3 with project `space-demo/mps`
   * Build everything
1. Open Rider with project `space-demo/cs`
1. Open Console window "Repo" in `space-demo/cs/SpaceDemo.Repository`
   * Use red color scheme
   * Type `dotnet run`
1. Open Console window "Loader" in `space-demo/cs/SpaceDemo.Loader`
   * Use blue color scheme
   * Type `dotnet run ./../chunks`
1. Open Console window "Validator" in `space-demo/cs/SpaceDemo.Validator`
   * Use green scheme
   * Type `dotnet run`
1. Open Web browser A http://localhost:1234/ 
1. Open Web browser B http://localhost:1234/
1. Arrange web browser A, web browser B, console "Loader", console "Validator" in a 2x2 grid  

## Language level

1. Show slide Languages (M2)
   * Mention console colors
   * Black console: Generation / support

1. Show PowerBudget language in MPS
   * Standard MPS

1. Show Finding language in MPS
   * Node annotation

1. Show Export SpaceDemo Languages in MPS
   * Export config with export file
   * Lists both languages

1. Show MPS command-line generation
   * Show "runCommandLineTool" arrow in slide
   * Switch to "GenMps" console
   * Run `./gradlew runCommandLineTool -Pargs=". -mspace-demo.home=. -ic -lc"`
   * Point out generated files in `space-demo/chunks`

1. Show C# code generation
   * Show "LionWebGenerator" arrow in slide
   * Switch to "GenCs" console
   * Run `dotnet LionWebGenerator --config generate-languages.config.json`
   * Show `Languages.PowerBudget.g.cs` in Rider, use `PowerSource` as example.  
     Show outline.

1. Show TS code generation
   * Show "class-core-generator" arrow in slide
   * Switch to "GenTs" console
   * Run `npm run generate`
   * Show `PowerBudget.g.ts` in Rider.

## Instance level

1. Show slide Instances (M1)
   * Mention console colors

1. Start Repository
   * Switch to "Repo" console
   * Run `dotnet run`
 
1. Start Loader
   * Switch to "Loader" console
   * Run `dotnet run ./../chunks`

1. Start Validator
   * Switch to "Validator" console
   * Run `dotnet run`

1. Start Web server
   * Switch to "RunTs" console
   * Run `npm run dev`

1. Show all clients
   * web browser A
   * web browser B
   * console "Loader"
   * console "Validator"  

1. Export instance
   * Show "Power module Voyager1" in MPS
   * Show "Export Voyager1" in MPS
   * Export instance

1. Show all clients updated
   * Loader found changed file
   * Both web browsers updated
   * Validator worked

1. Change power source peak value to 1000
   * Show warning disappears in both browsers
   * Value updates on other browser

1. Change power source peak value to 200
   * Show warning appears
   * Value updates on other browser
