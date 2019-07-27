"
I specify group of expected message specs. (as conjunction)
I don't care on messages sends order

My contents are SpecOfExpectedMessage
"
Class {
	#name : #SpecOfMultipleMessages,
	#superclass : #SpecOfOccurredMessages,
	#instVars : [
		'expectedMessages'
	],
	#category : #'Mocketry-Specs'
}

{ #category : #accessing }
SpecOfMultipleMessages >> addExpectedMessage: aSpecOfExpectedMessage [
	
	expectedMessages add: aSpecOfExpectedMessage 
]

{ #category : #accessing }
SpecOfMultipleMessages >> addExpectedMessages: newExpectedMessages [
	
	expectedMessages addAll: newExpectedMessages
]

{ #category : #converting }
SpecOfMultipleMessages >> asInteractionSpecBetweenAll: expectedReceivers [

	| result interactionSpec |
	result := self class new.
	
	expectedMessages do: [ :each | 

		interactionSpec := each asInteractionSpecBetweenAll: expectedReceivers.
		interactionSpec populateMultipleMessagesSpec: result		
	 ].

	^result
]

{ #category : #testing }
SpecOfMultipleMessages >> basicMatches: occurredMessages [

	^expectedMessages allSatisfy: [ :each | 
		each matches: occurredMessages ]
]

{ #category : #copying }
SpecOfMultipleMessages >> copy [
	| copy |
	copy := super copy.
	copy expectedMessages: (expectedMessages collect: [ :each | each copy]).
	^copy
]

{ #category : #accessing }
SpecOfMultipleMessages >> expectedMessages [
	^ expectedMessages
]

{ #category : #accessing }
SpecOfMultipleMessages >> expectedMessages: anObject [
	expectedMessages := anObject
]

{ #category : #initialization }
SpecOfMultipleMessages >> initialize [
	super initialize.
	
	expectedMessages := OrderedCollection new
]

{ #category : #accessing }
SpecOfMultipleMessages >> invertChildren [

	expectedMessages do: [ :each | each invert ]
]

{ #category : #testing }
SpecOfMultipleMessages >> isEmpty [
	^expectedMessages isEmpty
]

{ #category : #accessing }
SpecOfMultipleMessages >> populateMultipleMessagesSpec: aMultipleMessagesSpec [

	aMultipleMessagesSpec addExpectedMessages: expectedMessages
]

{ #category : #validation }
SpecOfMultipleMessages >> validate: occurredMessages [

	| uncheckedMessages failedSpecs result |
	uncheckedMessages := OrderedCollection withAll: occurredMessages.
	failedSpecs := OrderedCollection new.
	
	expectedMessages do: [ :each |
		
		result := each validate: uncheckedMessages.
		result isSuccess 
			ifTrue: [ uncheckedMessages removeAll: result requiredOccurredMessages ]
			ifFalse: [ failedSpecs add: each ]].
		
	failedSpecs ifEmpty: [ ^SpecOfMessagesValidationSuccess occurredMessages: (occurredMessages copyWithoutAll: uncheckedMessages) ].
		
	^failedSpecs first validate: uncheckedMessages
]
