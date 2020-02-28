Class {
	#name : #IdentifierNameSplitter,
	#superclass : #Object,
	#instVars : [
		'abbreviationsRegex1',
		'abbreviationsRegex2',
		'abbreviationsRegex3',
		'camelCaseRegex',
		'nonAlphanumericRegex',
		'numbersRegex'
	],
	#classInstVars : [
		'instance'
	],
	#category : #IdentifierNameSplitter
}

{ #category : #accessing }
IdentifierNameSplitter class >> instance [ 
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
IdentifierNameSplitter >> initialize [
	"Creation of regular expression objects is very slow. So instead of creating new regex every time the method is called, we initialize them all together when the splitter is created"
	super initialize.
	
	abbreviationsRegex1 := '[A-Z][A-Z]+\>' asRegex.
	abbreviationsRegex2 := '[A-Z][A-Z]+' asRegex.
	abbreviationsRegex3 := ' |[^ ]+' asRegex.
	camelCaseRegex := '[A-Z][a-z]+|\<[a-z]+' asRegex.
	nonAlphanumericRegex := '[A-Za-z0-9]+|[\W_]+' asRegex.
	numbersRegex := '\d+|\D+' asRegex.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter >> separateAbbreviationsIn: aString [
	| str suffix words |
	str := aString.

   suffix := abbreviationsRegex1 matchesIn: str collect: #value.
	suffix := suffix isEmpty ifTrue: [''] ifFalse: [suffix anyOne].
	str := str copyFrom: 1 to: (str size - suffix size).

	str := abbreviationsRegex2 copy: str translatingMatchesUsing: [ :s | ' ', (s copyWithoutIndex: s size), ' ', s last asString. ].

	words := abbreviationsRegex3 matchesIn: str collect: #value.

	words := words copyWithout: ' '.
	suffix isEmpty ifFalse: [ words := words, { suffix } ].
	^ words
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter >> separateCamelCaseIn: aString [
	^ camelCaseRegex matchesIn: aString collect: #value.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter >> separateNonAlphanumericIn: aString [
   ^ nonAlphanumericRegex matchesIn: aString collect: #value.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter >> separateNumbersIn: aString [
	^ numbersRegex matchesIn: aString collect: #value.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter >> splitIdentifierName: aString [
	| words |
	words := OrderedCollection with: aString.
	
	words := words flatCollect: [ :eachWord |
		self separateNonAlphanumericIn: eachWord ].
	
	words := words flatCollect: [ :eachWord |
		self separateNumbersIn: eachWord ].
	
	words := words flatCollect: [ :eachWord |
		self separateAbbreviationsIn: eachWord ].
	
	words := words flatCollect: [ :eachWord |
		eachWord
			detect: #isLowercase
			ifFound: [ self separateCamelCaseIn: eachWord ]
			ifNone: [ { eachWord } ] ].
	
	^ words
]
