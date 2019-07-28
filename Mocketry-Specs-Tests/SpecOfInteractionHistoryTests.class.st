Class {
	#name : #SpecOfInteractionHistoryTests,
	#superclass : #TestCase,
	#category : #'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfInteractionHistoryTests >> testFailedValidation [
	
	|  result spec history |
	
	spec := SpecOfInteractionHistory with: ( 
		SpecOfExpectedMessage from: (MockOccurredMessage 
			receiver: (Kind of: Symbol) selector: #selector3)).
			
	history := MockInteractionHistory withAll: {
		MockOccurredMessage receiver: #receiver selector: #selector}.
	
	result := spec validate: history.
	
	result should not be isSuccess.
	result where description should equal: '#receiver never received selector3'
]

{ #category : #tests }
SpecOfInteractionHistoryTests >> testMatches [
	
	| spec history |
	
	spec := SpecOfInteractionHistory with: ( 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3)).
			
	history := MockInteractionHistory withAll: {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	self assert: (spec matches: history)
]

{ #category : #tests }
SpecOfInteractionHistoryTests >> testSucceedValidation [
	
	|  result spec history |
	
	spec := SpecOfInteractionHistory with: ( 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3)).
			
	history := MockInteractionHistory withAll: {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	result := spec validate: history.
	
	result should be isSuccess.
	result should beInstanceOf: SpecOfMessagesValidationSuccess.
	result where occurredMessages should equal: {history lastMessage}
]

{ #category : #tests }
SpecOfInteractionHistoryTests >> testSucceedValidationWithNegation [
	
	|  result spec history |
	
	spec := SpecOfInteractionHistory with: ( 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3)).
	spec := spec not.
			
	history := MockInteractionHistory withAll: {
		MockOccurredMessage receiver: #receiver selector: #selector}.
	
	result := spec validate: history.
	
	result should be isSuccess
]
