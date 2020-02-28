Extension { #name : #String }

{ #category : #'*IdentifierNameSplitter' }
String >> splitIdentifierName [
	^ IdentifierNameSplitter instance splitIdentifierName: self
]
