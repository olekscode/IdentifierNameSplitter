Class {
	#name : #IdentifierNameSplitterTest,
	#superclass : #TestCase,
	#category : #'IdentifierNameSplitter-Tests'
}

{ #category : #tests }
IdentifierNameSplitterTest >> testSeparateAbbreviationsIn [
	| string expected actual |
	string := 'HTMLHelloWorldAST'.
	expected := OrderedCollection withAll: #(HTML HelloWorld AST).
	actual := IdentifierNameSplitter separateAbbreviationsIn: string.
	self assert: actual equals: expected.
]

{ #category : #tests }
IdentifierNameSplitterTest >> testSeparateCamelCaseIn [
	| string expected actual |
	string := 'loremIpsumHelloWorld'.
	expected := OrderedCollection withAll: #(lorem Ipsum Hello World).
	actual := IdentifierNameSplitter separateCamelCaseIn: string.
	self assert: actual equals: expected.
]

{ #category : #tests }
IdentifierNameSplitterTest >> testSeparateNonAlphanumericIn [
	| string expected actual |
	string := 'Xy_HelloWorld:10>>42x++'.
	expected := OrderedCollection withAll: #(Xy _ HelloWorld : '10' >> '42x' ++).
	actual := IdentifierNameSplitter separateNonAlphanumericIn: string.
	self assert: actual equals: expected.
]

{ #category : #tests }
IdentifierNameSplitterTest >> testSeparateNumbersIn [
	| string expected actual |
	string := 'HTML42HelloWorld5instanceAST'.
	expected := OrderedCollection withAll: #(HTML '42' HelloWorld '5' instanceAST).
	actual := IdentifierNameSplitter separateNumbersIn: string.
	self assert: actual equals: expected.
]

{ #category : #tests }
IdentifierNameSplitterTest >> testSplitIdentifierName [
	| string expected actual |
	string := 'a_bc>>xy42HTMLEditor:AST++'.
	expected := OrderedCollection withAll: #(a _ bc >> xy '42' HTML Editor : AST ++).
	actual := IdentifierNameSplitter splitIdentifierName: string.
	self assert: actual equals: expected.
]
