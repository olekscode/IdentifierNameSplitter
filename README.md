# Identifier Name Splitter for Pharo

[![Build Status](https://travis-ci.org/olekscode/IdentifierNameSplitter.svg?branch=master)](https://travis-ci.org/olekscode/IdentifierNameSplitter)
[![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/identifiernamesplitter)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/IdentifierNameSplitter/badge.svg?branch=master)](https://coveralls.io/github/olekscode/IdentifierNameSplitter?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/IdentifierNameSplitter/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A tool for splitting identifier names into separate words, numbers, and symbols. For example, `aName_AST42:` gets separated into 'a', 'Name', '_', 'AST', '42', and ':'.

## Installation
To install `IdentifierNameSplitter`, go to the Playground (`Ctrl+OW`) in your Pharo image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```smalltalk
Metacello new
  baseline: 'IdentifierNameSplitter';
  repository: 'github://olekscode/IdentifierNameSplitter/src';
  load.
```

## How to use?

```Smalltalk
'HelloWorld' splitIdentifierName.
"#(Hello World)"

'adaptToCollection:andSend:' splitIdentifierName.
"#(adapt To Collection : and Send :)"

'example42' splitIdentifierName.
"#(example '42')"

'parseHTTPRequest:' splitIdentifierName.
"#(parse HTTP Request :)"

'a_bc>>xy42HTMLEditor:AST++' splitIdentifierName.
"#(a _ bc >> xy '42' HTML Editor : AST ++)"
```
