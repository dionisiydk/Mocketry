Class {
	#name : #SpecOfExpectedMessageSequenceTests,
	#superclass : #TestCase,
	#category : #'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfExpectedMessageSequenceTests >> testFailedValidationWhenMessageWasNotOccured [
	
	| spec messages result |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
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
SpecOfExpectedMessageSequenceTests >> testFailedValidationWhenWrongOrder [
	
	| spec messages result |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector2).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver selector: #selector3.
		MockOccurredMessage receiver: #receiver selector: #selector2.
	}.
	
	result := spec validate: messages.
	
	result should be isFailure.
	result where description should equal: '#receiver received selector3 in wrong time'
]

{ #category : #tests }
SpecOfExpectedMessageSequenceTests >> testMatches [
	
	| spec messages |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should be matches: messages
]

{ #category : #tests }
SpecOfExpectedMessageSequenceTests >> testMatchesWhenSomeMessageExpectedTwice [
	
	| spec messages |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	spec expectedMessages first usage minCount: 2.
		
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should be matches: messages
]

{ #category : #tests }
SpecOfExpectedMessageSequenceTests >> testNotMatchesWhenMessagesAreOccuredInWrongOrder [
	
	| spec messages |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).		
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should not be matches: messages
]

{ #category : #tests }
SpecOfExpectedMessageSequenceTests >> testNotMatchesWhenSomeMessageWasNotOccured [
	
	| spec messages |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2	}.
	
	spec should not be matches: messages
]

{ #category : #tests }
SpecOfExpectedMessageSequenceTests >> testSucceedValidation [
	
	| spec messages result |
	spec := SpecOfExpectedMessageSequence new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	result := spec validate: messages.
	
	result should be isSuccess
]
