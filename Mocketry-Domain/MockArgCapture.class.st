"
I represent of captured argument from series of occurred message sends.

I should be retrived by direct message to suitable class Arg:
	Arg argName 
 
I supposed to be used as argument spec in expectations. When expectation is executed I capture given message argument for future verification. I allow tests to be looked like: 

	mock stub someMessageWith: Arg argName.
	
 	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue
 
I capture all argument values from multiple message sends. 
To retrieve values of concrete call use:

	Arg argName fromFirstCall should be: #first.	
	Arg argName fromLastCall should be: #last.
	(Arg argName fromCall: 2) should be: #second.

Internal Representation and Key Implementation Points.

    Instance Variables
	messageSpec:		<SpecOfMessageSend>
	name:		<String>
	values:		<OrderedCollection>
"
Class {
	#name : #MockArgCapture,
	#superclass : #Object,
	#instVars : [
		'name',
		'messageSpec',
		'values'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockArgCapture class >> named: aString [ 
	^self new 
		name: aString
]

{ #category : #converting }
MockArgCapture >> asShouldExpressionReceiver [ 
	self ensureMessageSpec.
	
	^MockSingleCallArgReceiver from: self
]

{ #category : #specs }
MockArgCapture >> asSimpleValue [
	^self
]

{ #category : #specs }
MockArgCapture >> asSpecOfArg: argumentNumber of: aMessageSendSpec [

	messageSpec := aMessageSendSpec.
	
	^SpecOfMessageArgument number: argumentNumber requiredValue: self
]

{ #category : #specs }
MockArgCapture >> asStateSpec [
	^self
]

{ #category : #validation }
MockArgCapture >> basicMatches: anObject [
	^true
]

{ #category : #'capturing arguments' }
MockArgCapture >> captureValue: anObject [

	anObject isAllowAutoStub ifTrue: [ anObject stub ].
	
	values add: anObject
]

{ #category : #initialization }
MockArgCapture >> ensureMessageSpec [
	messageSpec ifNil: [ self error: 'Capture is not initialized with messageSpec!' ].
]

{ #category : #accessing }
MockArgCapture >> fromAllCalls [
	
	^MockAllValuesArgReceiver from: self
]

{ #category : #accessing }
MockArgCapture >> fromCall: callNumber [
	
	^MockConcreteCallArgReceiver from: self callNumber: callNumber
]

{ #category : #accessing }
MockArgCapture >> fromFirstCall [
	^self fromCall: 1
]

{ #category : #accessing }
MockArgCapture >> fromLastCall [
	^MockLastCallArgReceiver from: self
]

{ #category : #initialization }
MockArgCapture >> initialize [
	super initialize.
	
	values := OrderedCollection new
]

{ #category : #specs }
MockArgCapture >> isSimpleValue [
	^true
]

{ #category : #accessing }
MockArgCapture >> messageSpec [
	^ messageSpec
]

{ #category : #accessing }
MockArgCapture >> messageSpec: anObject [
	messageSpec := anObject
]

{ #category : #accessing }
MockArgCapture >> name [
	^ name
]

{ #category : #accessing }
MockArgCapture >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MockArgCapture >> numberOfCalls [
	^values size
]

{ #category : #printing }
MockArgCapture >> printOn: aStream [
	super printOn: aStream.
	
	aStream << $( << name << $)
]

{ #category : #printing }
MockArgCapture >> stringForSpecTitle [ 

	^name printString
]

{ #category : #validation }
MockArgCapture >> validate: anObject [
	
	^SpecOfValidationResult success
]

{ #category : #validation }
MockArgCapture >> validateNumberOfCalls: callsNumber [
	| expectedMessageSpec result history |
	self ensureMessageSpec.
	
	expectedMessageSpec := SpecOfExpectedMessage new.
	expectedMessageSpec messageSend: messageSpec.
	expectedMessageSpec usage minCount: callsNumber.
	
	history := MockCurrentBehaviour value interactionHistory.
	result := expectedMessageSpec validate: history occurredMessages.
	result isSuccess ifTrue: [ 
		values ifEmpty: [ self error: 'No argument was captured but message was sent!' ].
		values size < callsNumber ifTrue: [ 
			self error: 'Arguments was captured ', values size asString
							, ' times but should be ', callsNumber ]].
	^result
]

{ #category : #validation }
MockArgCapture >> validateSingleValue [ 

	| result |
	result := self validateNumberOfCalls: 1.
	
	result isSuccess ifTrue: [ 
		values asSet size > 1
			ifTrue: [ self error: 'Multiple args were captured! Choose concrete by #fromCall:' ]].
		
	^result
]

{ #category : #accessing }
MockArgCapture >> valueFromCall: callNumber [
	
	^values at: callNumber
]

{ #category : #accessing }
MockArgCapture >> valueFromLastCall [
	
	^values last
]

{ #category : #accessing }
MockArgCapture >> values [
	^ values
]

{ #category : #accessing }
MockArgCapture >> values: anObject [
	values := anObject
]
