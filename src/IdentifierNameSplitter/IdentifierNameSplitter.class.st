Class {
	#name : #IdentifierNameSplitter,
	#superclass : #Object,
	#category : #IdentifierNameSplitter
}

{ #category : #'as yet unclassified' }
IdentifierNameSplitter class >> separateAbbreviationsIn: aString [
	| str regex suffix words |
	str := aString.

	regex := '[A-Z][A-Z]+\>' asRegex.
   suffix := regex matchesIn: str collect: #value.
	suffix := suffix isEmpty ifTrue: [''] ifFalse: [suffix anyOne].
	str := str copyFrom: 1 to: (str size - suffix size).

	regex := '[A-Z][A-Z]+' asRegex.
	str := regex copy: str translatingMatchesUsing: [ :s | ' ', (s copyWithoutIndex: s size), ' ', s last asString. ].

	regex := ' |[^ ]+' asRegex.
	words := regex matchesIn: str collect: #value.

	words := words copyWithout: ' '.
	suffix isEmpty ifFalse: [ words := words, { suffix } ].
	^ words
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter class >> separateCamelCaseIn: aString [
	| regex |
	regex := '[A-Z][a-z]+|\<[a-z]+' asRegex.
	^ regex matchesIn: aString collect: #value.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter class >> separateNonAlphanumericIn: aString [
	| regex |
	regex := '[A-Za-z0-9]+|[\W_]+' asRegex.
   ^ regex matchesIn: aString collect: #value.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter class >> separateNumbersIn: aString [
	| regex |
	regex := '\d+|\D+' asRegex.
	^ regex matchesIn: aString collect: #value.
]

{ #category : #'as yet unclassified' }
IdentifierNameSplitter class >> splitIdentifierName: aString [
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
