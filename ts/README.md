# TypeScript implementation of space DSL

This (sub-)project contains two packages:

* `build`: Takes care of generating required code into the `editor` package.

  Run the generator as follows, from inside the `build` package:

  ```shell
  $ npm run generate
  ```

* `editor`: An implementation of a Web app with which to edit a model according to the space DSL.

  Start the Web app in development mode as follows, from inside the `editor` package:

  ```shell
  $ npm run dev
  ```

  Start the Web app in “production” mode as follows, from inside the `editor` package:

  ```shell
  $ npm run prod
  ```

* `echo-ws-server`: A simple WebSocket server that just echoes everything it receives to the console.

