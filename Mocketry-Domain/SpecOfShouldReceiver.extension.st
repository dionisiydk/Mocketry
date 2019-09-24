Extension { #name : #SpecOfShouldReceiver }

{ #category : #'*Mocketry-Domain' }
SpecOfShouldReceiver >> currentMockBehaviour [
	^self validationSubject currentMockBehaviour
]
