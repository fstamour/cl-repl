> This is a fork of koji-kojiro/cl-repl

# Main differences with the original

* This is more of a library. It makes sure you can save a lisp image and load
it without issues.
* no "magic" commands, just functions with %special syntax
* no rowsell integration - it doesn't assume you use roswell
* no config file - use your implementation's if you need to
* no integration with python/perl/ruby - add it yourself if need to
* no debugger or inspector - they weren't complete
* no splash "screen" - it used to print an ascii art banner and version.
* doesn't flush (clear) the screen unless the user ask for it

# More about commands

In the original cl-repl, the commands are functions that returns code to
execute. For example, the magic command `%run` used to run a lisp file
in the current environment was implemented by reading a file as s-expression
and simply returning them. In this fork, that magic command is simply not
implemented because one can simply use `cl:load`.

---

# CL-REPL
[![Build Status](https://travis-ci.org/fstamour/cl-repl.svg?branch=master)](https://travis-ci.org/fstamour/cl-repl)
[![License](http://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://github.com/fstamour/cl-repl/blob/master/LICENSE)
[![GitHub tag](https://img.shields.io/github/tag/fstamour/cl-repl.svg?style=flat)](https://github.com/fstamour/cl-repl/releases)

# Overview
This project aims to provide a beginner-friendly REPL for Common Lisp with rich
functionalities, such as IPython for Python.

What this project tries to achieve are listed here.

- [x] powerful line editting with gnu readline.
- [x] tab-completion of symbols.
- [x] simple installation instruction.
- [x] code editting with text editor.
- [x] syntax highlighting of input texts.
- [ ] implementation independence. (only SBCL supported)

# Installation

Before installation, please ensure that gnu readline is installed.
If you use OSX, you might need to execute following command.

```
$ brew link --force readline
```

Also, ensure that your terminal support 256 colors.

# Usage

```
(ql:quickload :cl-repl)
(cl-repl:main)
```


Some useful commands are ready to use. To list available commands:

```
CL-USER> %help
```

## Syntax highlighting

If you want to disable it, run the following

```
(disable-syntax)
```

## execute shell
If the line starts with `!`, excute it as shell command, e.g. `!ls -a`.

## %edit
Line editting in repl is sometimes painful. CL-REPL allows yot to edit code
with your favorite text editor.

```
CL-REPL> %edit <filename>
```

CL-REPL invokes a text editor specified by `$EDITOR`.
After editting code, save and close it. Then repl will start to evaluate it.
If `<filename>` is not supplied, a temporary file will be created and deleted
after evaluation.

We've made sure the following editors work properly.

- vi & vim
- GNU Emacs
- joe's own editor
- Lem

# Contributing
Don't hesitate to open issues or to send PRs.
Any suggestions are always welcomed.

# Testing

./run-expect-tests.sh

# Author
[TANI Kojiro](https://github.com/koji-kojiro) (kojiro0531@gmail.com)
[Francis St-Amour](https://github.com/fstamour)

# License
CL-REPL is distributed under [GPLv3](./LICENSE).

