Class {
	#name : #SplitIdentifierNamesTest,
	#superclass : #TestCase,
	#category : #'IdentifierNameSplitter-Tests'
}

{ #category : #tests }
SplitIdentifierNamesTest >> testClassNameOneWord [
	| name expected actual |
	name := 'Example'.
	expected := OrderedCollection withAll: #(Example).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testClassNameTwoWords [
	| name expected actual |
	name := 'ExampleDraw'.
	expected := OrderedCollection withAll: #(Example Draw).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testClassNameTwoWordsPrefix [
	| name expected actual |
	name := 'RTExampleDraw'.
	expected := OrderedCollection withAll: #(RT Example Draw).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testClassNameTwoWordsPrefixDigits [
	| name expected actual |
	name := 'RTExampleDraw123'.
	expected := OrderedCollection withAll: #(RT Example Draw '123').
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testClassNameTwoWordsPrefixDigitsLowercase [
	| name expected actual |
	name := 'RTExampleDraw123hello'.
	expected := OrderedCollection withAll: #(RT Example Draw '123' hello).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameOneWordNoArgs [
	| name expected actual |
	name := 'example'.
	expected := OrderedCollection withAll: #(example).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameOneWordOneArg [
	| name expected actual |
	name := 'example:'.
	expected := OrderedCollection withAll: #(example :).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameOneWordOneDigitNoArgs [
	| name expected actual |
	name := 'example1'.
	expected := OrderedCollection withAll: #(example '1').
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameOneWordOneDigitOneArg [
	| name expected actual |
	name := 'example1:'.
	expected := OrderedCollection withAll: #(example '1' :).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameOneWordTwoDigitsNoArgs [
	| name expected actual |
	name := 'example12'.
	expected := OrderedCollection withAll: #(example '12').
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameOneWordTwoDigitsOneArg [
	| name expected actual |
	name := 'example12:'.
	expected := OrderedCollection withAll: #(example '12' :).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameTwoWordsNoArgs [
	| name expected actual |
	name := 'exampleDraw'.
	expected := OrderedCollection withAll: #(example Draw).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameTwoWordsOneArg [
	| name expected actual |
	name := 'exampleDraw:'.
	expected := OrderedCollection withAll: #(example Draw :).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameTwoWordsTwoArgs [
	| name expected actual |
	name := 'example:draw:'.
	expected := OrderedCollection withAll: #(example : draw :).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testMethodNameTwoWordsTwoDigitsLowercaseNoArgs [
	| name expected actual |
	name := 'exampleDraw123hello'.
	expected := OrderedCollection withAll: #(example Draw '123' hello).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testOperator [
	| name expected actual |
	name := '+'.
	expected := OrderedCollection withAll: #(+).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testOperatorInTheMiddle [
	| name expected actual |
	name := 'Hello>>world'.
	expected := OrderedCollection withAll: #(Hello >> world).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]

{ #category : #tests }
SplitIdentifierNamesTest >> testOperatorTwoSymbols [
	| name expected actual |
	name := '>>'.
	expected := OrderedCollection withAll: #(>>).
	actual := name splitIdentifierName.
	self assert: actual equals: expected.
]
