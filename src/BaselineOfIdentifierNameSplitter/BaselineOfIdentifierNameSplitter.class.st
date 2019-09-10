Class {
	#name : #BaselineOfIdentifierNameSplitter,
	#superclass : #BaselineOf,
	#category : #BaselineOfIdentifierNameSplitter
}

{ #category : #baselines }
BaselineOfIdentifierNameSplitter >> baselineOf: spec [
	<baseline>
	spec for: #common do: [ 
		"Packages"
		spec
			package: 'IdentifierNameSplitter';
			package: 'IdentifierNameSplitter-Tests' with: [ spec requires: #(IdentifierNameSplitter) ] ]
]
