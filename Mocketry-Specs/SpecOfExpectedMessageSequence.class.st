"
I specify ordered group of expected message specs. (as conjunction).
I am valid for group of messages only if they occurred in exact order which defined by my contents.

My contents are SpecOfExpectedMessage
"
Class {
	#name : #SpecOfExpectedMessageSequence,
	#superclass : #SpecOfMultipleMessages,
	#category : #'Mocketry-Specs'
}

{ #category : #validation }
SpecOfExpectedMessageSequence >> basicMatches: occurredMessages [

	| uncheckedMessages result |
	
	uncheckedMessages := OrderedCollection withAll: occurredMessages.

	expectedMessages do: [ :eachSpec |	
		result := eachSpec validate: uncheckedMessages.
		
		result isFailure ifTrue: [ ^false].
		uncheckedMessages := uncheckedMessages copyAfter: result requiredOccurredMessages last.
	].
	
	^true
]

{ #category : #validation }
SpecOfExpectedMessageSequence >> validate: occurredMessages [

	| uncheckedMessages result allOccurred validMessages |
	allOccurred := super validate: occurredMessages.
	allOccurred isFailure ifTrue: [^allOccurred].
	
	uncheckedMessages := OrderedCollection withAll: occurredMessages.
	validMessages := OrderedCollection new.

	expectedMessages do: [ :eachSpec |
	
		result := eachSpec validate: uncheckedMessages.
		
		result isFailure ifTrue: [ ^SpecOfWrongMessagesOrder of: occurredMessages spec: self validMessages: validMessages wrongMessage: eachSpec].
		result requiredOccurredMessages ifNotEmpty: [:required |
			validMessages addAll: required.
			uncheckedMessages := uncheckedMessages copyAfter: required last].
	].
	
	^SpecOfValidationResult success
]
