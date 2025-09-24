# TypeScript implementation of space DSL

This (sub-)project contains two packages:

* `build`: Takes care of generating required code into the `editor` package.

  **Note** that it currently defines ta space DSL's `Language` instance (=LionCore/M3) itself, but soon, we'll probably pick up one that's exported from MPS.

  Run the generator as follows, from anywhere within this (sub-)project:

  ```shell
  $ npm run generate
  ```

* `editor`: An implementation of a Web app with which to edit a model according to the space DSL.

  Start the Web app in development mode as follows, from anywhere within this (sub-)project:

  ```shell
  $ npm start
  ```

  **Note** that it currently *doesn't* use the `lionweb-server` as backend...*yet*.

