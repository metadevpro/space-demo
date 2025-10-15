# Implementation of Space DSL

This repository contains the implementations – in MPS, C#, and TypeScript – of an example “**Space DSL**”.
This DSL and its implementations are going to be demoed during the [LangDev CON2025](https://langdevcon.org) conference — specifically during the [“LionWeb’s delta protocol: incremental model changes”](https://langdevcon.org/2025/abstracts#20) talk.
The specific purpose is to show that and how the [delta protocol](https://github.com/LionWeb-io/specification/blob/main/delta/delta-api.adoc) works.
The playbook for the demo is described in [`playbook.md`](./playbook.md).

The implementations in C#, MPS, and TypeScript can be found in the subdirectories `cs/`, `mps/`, `ts/`, respectively.
Each of these subdirectories has a `README.md` that explains how to run that respective implementation.

The `chunks/` directory contains two serialization chunks:

* [`space.languages.json`](./chunks/space.languages.json): the serialization of the *Space* and *Findings* languages
* [`voyager1.instance.json`](./chunks/voyager1.instance.json): the serialization of an instance of the Space DSL

Both chunks are exported from MPS: see its respective [`README.md`](./mps/README.md).

