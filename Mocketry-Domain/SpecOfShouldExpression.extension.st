Extension { #name : #SpecOfShouldExpression }

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> beDone [
	| interactionSpec |
	interactionSpec := SpecOfMultipleMessages new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: receiver value.
	
	^self evaluateWith: interactionSpec forMockBehaviour: MockCurrentBehaviour value
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> beDoneInOrder [

	| interactionSpec |
	interactionSpec := SpecOfExpectedMessageSequence new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: receiver value.
	
	^self evaluateWith: interactionSpec forMockBehaviour: MockCurrentBehaviour value
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> beReturnedFrom: aBlockWithMessageSpec [

	| interactionSpec expectedSender senderSpec |
	interactionSpec := SpecOfMultipleMessages new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: aBlockWithMessageSpec.
		
	expectedSender := interactionSpec expectedMessages last.
	senderSpec := SpecOfExpectedObjectSender 
		for: self createSpecOfValidationSubject returnedFrom: expectedSender.
	
	^self evaluateWith: senderSpec forMockBehaviour: MockCurrentBehaviour value
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> evaluateWith: anOccurredMessagesSpec forMockBehaviour: aMockBehaviour [

	receiver := SpecOfShouldReceiverRoot from: aMockBehaviour interactionHistory.
	^self evaluateWith: (SpecOfInteractionHistory with: anOccurredMessagesSpec)
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> expect [
	
	| teacher |
	teacher := MockTeacher default.
	MockCurrentBehaviour useMockRole: teacher while: receiver value.
	^teacher
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> lenient [
	
	^MockExpectationsValidator for: self by: SpecOfMultipleMessages new
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> receive [

	^receiver currentMockBehaviour 
		createHelperMockAs: (MockValidator forExpression: self)
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> strictly [
	
	^MockExpectationsValidator for: self by: SpecOfExpectedMessageSequence new
]
