#!/bin/sh

./gradlew generateMps runCommandLineTool -Pargs=". -mspace-demo.home=. -ic -lc"
