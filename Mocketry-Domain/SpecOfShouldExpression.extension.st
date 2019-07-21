Extension { #name : #SpecOfShouldExpression }

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> beDone [

	| interactionSpec |
	interactionSpec := SpecOfObjectsInteraction new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: self validationSubject.
	
	MockCurrentBehaviour validateOccurredMessagesBy: interactionSpec.
	
	^interactionSpec
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> beDoneInOrder [

	| interactionSpec |
	interactionSpec := SpecOfOrderedObjectsInteraction new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: self validationSubject.
	
	MockCurrentBehaviour validateOccurredMessagesBy: interactionSpec
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> beReturnedFrom: aBlockWithMessageSpec [

	| interactionSpec expectedSender senderSpec |
	interactionSpec := SpecOfObjectsInteraction new.
	
	MockCurrentBehaviour 
		useMockRole: (MockInteractionSpecBuilder for: interactionSpec) 
		while: aBlockWithMessageSpec.
		
	expectedSender := interactionSpec expectedMessages last.
	senderSpec := SpecOfExpectedObjectSender for: self validationSubject returnedFrom: expectedSender.
	senderSpec denial: withNegation.
	
	MockCurrentBehaviour validateOccurredMessagesBy: senderSpec
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> expect [
	
	| teacher |
	teacher := MockTeacher default.
	MockCurrentBehaviour useMockRole: teacher while: self validationSubject.
	^teacher
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> got [
	self deprecated: 'use #receive instead'.
	
	^self receive
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> lenient [
	
	^MockExpectationsValidator for: self validationSubject by: SpecOfObjectsInteraction new
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> receive [

	^self validationSubject currentMockBehaviour 
		createMockToValidate: self validationSubject withNegation: withNegation 
]

{ #category : #'*Mocketry-Domain' }
SpecOfShouldExpression >> strictly [
	
	^MockExpectationsValidator for: self validationSubject by: SpecOfOrderedObjectsInteraction new
]
