Class {
	#name : #SpecOfMultipleMessagesTests,
	#superclass : #TestCase,
	#category : #'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMultipleMessagesTests >> testFailedValidationWhenSenderWasWrong [
	
	| spec messages result |
	spec := SpecOfMultipleMessages new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver3 selector: #selector2.
	}.
	
	result := spec validate: messages.
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector3'
]

{ #category : #tests }
SpecOfMultipleMessagesTests >> testMatches [
	
	| spec messages |
	spec := SpecOfMultipleMessages new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should be matches: messages
]

{ #category : #tests }
SpecOfMultipleMessagesTests >> testMatchesWhenSomeMessageExpectedTwiceTime [
	
	| spec messages |
	spec := SpecOfMultipleMessages new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver2 selector: #selector2).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	spec expectedMessages last usage minCount: 2.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver selector: #selector
	}.
	
	spec should be matches: messages
]

{ #category : #tests }
SpecOfMultipleMessagesTests >> testNotMatches [
	
	| spec messages |
	spec := SpecOfMultipleMessages new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2	}.
	
	spec should not be matches: messages
]

{ #category : #tests }
SpecOfMultipleMessagesTests >> testSucceedValidation [
	
	| spec messages result |
	spec := SpecOfMultipleMessages new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	result := spec validate: messages.
	
	result should be isSuccess.
	result should beInstanceOf: SpecOfMessagesValidationSuccess.
	result where occurredMessages should equal: {messages first. messages last}
]
