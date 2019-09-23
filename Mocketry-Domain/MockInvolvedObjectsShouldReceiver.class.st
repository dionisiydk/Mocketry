"
I am a special kind of should expression receiver representing the group of objects involved in interaction during test. The group is defined by state spec and I perform validation of all involved objects satisfying it.

I am used to implement following should expression: 

	Any inTest should receive someMessage.
	(Instance of: Array) inTest should include: #someItem.

I validate every object registered in interaction history of MockCurrentBehavior. It is all mock objects and any real objects registered using #stub message.

I ensure that at least one object was involved and if it is not true I return special validation result representing this fact.

Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<SpecOfObjectState>
"
Class {
	#name : #MockInvolvedObjectsShouldReceiver,
	#superclass : #SpecOfShouldReceiverRoot,
	#category : #'Mocketry-Domain'
}

{ #category : #converting }
MockInvolvedObjectsShouldReceiver >> asFutureStateShouldReceiver [
	^self 
]

{ #category : #validation }
MockInvolvedObjectsShouldReceiver >> createSpecOfValidationSubject [
	^SpecOfObjectHolder requiredHolder: self
]

{ #category : #testing }
MockInvolvedObjectsShouldReceiver >> includes: anObject [
	^self validationSubject includes: anObject
]

{ #category : #accessing }
MockInvolvedObjectsShouldReceiver >> objectsSpec [
	^ value
]

{ #category : #validation }
MockInvolvedObjectsShouldReceiver >> validate [
	| spec |
	spec := Has emptyItems not.
	spec failureDescription: 'No object involved in test which ' , self objectsSpec description.
	^ spec validate: self validationSubject
]

{ #category : #validation }
MockInvolvedObjectsShouldReceiver >> validateWith: aSpecOfObjectState [
	| result |
	result := self validate.
	result isSuccess ifFalse: [ ^result ].
	
	self validationSubject do: [:each | 
			result := aSpecOfObjectState validate: each.
			result isFailure ifTrue: [ ^result ]].
	^result
]

{ #category : #accessing }
MockInvolvedObjectsShouldReceiver >> validationSubject [
	| all |
	all := MockCurrentBehaviour value interactionHistory involvedObjects.
	^all select: [ :each | self objectsSpec matches: each ]
]
