# Algorithms & Data Structures

This repository was created after I found myself in the need of data structure knowledge for my graduation class. It helped me practing what I already knew and even learning different aspects of all the programming languages I am most excited for.

## Contribution

I mainly push code here for later reference, but you can also fork and create pull requests for anything you deem worthy of. Any feedback is much appreciated. You can find me [here](https://twitter.com/darqueos) (DMs are open).

## Playground

You should be able to run any file directly from the command line. Follow the instructions for each programming language below.

### Python

> The entry language to most Computer Sciences courses, I find Python to be the most readable language. I value it for its relevance in data science and machine learning.

At the time of writing, `3.6.2` was the latest version. Although other versions may be compatible, you're better suited installing this one.

```bash
$ python -V
Python 3.6.2
```

Run any Python file with the command:

```bash
$ python <file>.py
```

### JavaScript

> A scripting language that has become the most popular tool for frontend development and since the release of Node.js, the backend too.

You should be able to run any file from most browser's console or from the command line:

```bash
$ node -v
v8.6.0

$ node <file>.js
```

### Swift

> After showing close to 30 years of dominance as the programming language for macOS, Apple unveiled an entire new language to the world. It would not only become the default language for developing apps across its devices, but I was open-sourced.

Swift files can be run on macOS and Ubuntu command line:

```bash
$ swift -v
Apple Swift version 4.0

$ swift <file>.swift
```

### Kotlin

> Kotlin got under the spotlights after Google conceiving it a main class citizen language status for developing Android apps. From the company that created InteliJ IDE, this is a multi-purpose language, able to transpile code to JavaScript, run on the JVM or even run on it own.

Running Kotlin directly from the command line is a bit tricky, since you have to compile it to Java first:

```bash
$ kotlinc -version
info: kotlinc-jvm 1.1.51 (JRE 1.8.0_144-b01)

$ kotlinc <file>.kt -include-runtime -d <file>.jar
```

This will generate a `.jar` file, which you can execute by typing:

```bash
$ java -jar <file>.jar
```

### Go

> This Google creation caught the developer attention in the recent years after numerous impressive results in benchmarks. A really concise language, with its own linting built-in. As a practial example of application written on Go, you can check out Docker.

Go is a weird language. Weird as in *very different from your typical OOP language*. All Go code here is basically useless, and function more as a boilerplate or a template than some code you can copy, paste and go. At the time of writing, Go latest stable version is `1.9`. It has [no generics implementation](https://github.com/golang/go/issues/15292), which data structure code make heavy use of.

Although you can't directly run files from a command line, you can try using any online Go REPL.
