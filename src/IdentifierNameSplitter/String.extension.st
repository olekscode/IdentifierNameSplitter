Extension { #name : #String }

{ #category : #'*IdentifierNameSplitter' }
String >> splitIdentifierName [
	^ IdentifierNameSplitter splitIdentifierName: self
]
