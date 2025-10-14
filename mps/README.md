# MPS implementation of Space DSL

Uses 
* Gradle v9.0
* MPS 2021.3.5
* LionWeb-MPS 0.2.12

## Setup

In directory `<git-root>/mps`, run

```sh
./gradlew setup
```

# Generate from command-line

In directory `<git-root>/mps`, run

```sh
./gradlew generateMps runCommandLineTool -Pargs=". -mspace-demo.home=. -ic -lc"
```

Or, for convenience,

```sh
./export.sh
```