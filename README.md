# Identifier Name Splitter for Pharo

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
'HelloWorld' splitIdentifierName. "#(Hello World)"
'adaptToCollection:andSend:' splitIdentifierName. "#(adapt To Collection : and Send :)"
'example42' splitIdentifierName. "#(example '42')"
'parseHTTPRequest:' splitIdentifierName. "#(parse HTTP Request :)"
'a_bc>>xy42HTMLEditor:AST++' splitIdentifierName. "#(a _ bc >> xy '42' HTML Editor : AST ++)"
```
