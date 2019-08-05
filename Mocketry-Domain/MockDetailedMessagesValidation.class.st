"
I am special operation on SpecOfExpectedMessage which is used to modify given spec by my DSL api and validate it immediatelly.

So for example after sending me message once I will change usage spec of expected message and immediatelly validate occurred message by it. 

I am used during received message validation: 
	mock should receive someMessage once
	 
Look at my superclass comment and methods
"
Class {
	#name : #MockDetailedMessagesValidation,
	#superclass : #MockOperationWithMessageSpec,
	#instVars : [
		'shouldExpression'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockDetailedMessagesValidation class >> for: aShouldExpression on: anExpectedMessageSpec [
	^(self on: anExpectedMessageSpec)
		shouldExpression: aShouldExpression 
]

{ #category : #execution }
MockDetailedMessagesValidation >> execute [
	
	^shouldExpression evaluateWith: spec forMockBehaviour: MockCurrentBehaviour value
]

{ #category : #'extra validation' }
MockDetailedMessagesValidation >> inProcessWhich [

	| result lastMessage |
	result := self execute.
	lastMessage := result occurredMessages last.
	
	^(MockOccurredMessageProcessProperty of: lastMessage) where
]

{ #category : #accessing }
MockDetailedMessagesValidation >> shouldExpression [
	^ shouldExpression
]

{ #category : #accessing }
MockDetailedMessagesValidation >> shouldExpression: anObject [
	shouldExpression := anObject
]

{ #category : #'extra validation' }
MockDetailedMessagesValidation >> which [

	| result lastMessage |
	result := self execute.
	lastMessage := result occurredMessages last.
	
	^(MockOccurredResultProperty of: lastMessage) where
]
