"
I specify expectation for expected behavior like expected message send or sequence of messages. Concrete type of expectation is represented by difference kind of subclasses of SpecOfOccurredMessages.

So my instances are created on top of occurred message specification: 

		SpecOfInteractionHistory with: (
			SpecOfExpectedMessage receiver: #receiver selector: #testMessage)

I validate an instance of MockInteractionHistory which represent the occurred messages and involved objects. 
Comparing to the spec which I wrap I do extra logic to provide more precise result of validation to detect every involved object which break expectation.

For example expected message can be specifyed as: 

	spec := SpecOfExpectedMessage from: (MockOccurredMessage 
					receiver: (Kind of: Rectangle) selector: #area).
	
In that case failed validation will produce very abstract result: 

	messages := { MockOccurredMessage receiver: (0@0 corner: 1@1) selector: #area2 }.
	(spec validate: messages) description ""==>(be a kind of Rectangle) never received area""

The result just shows that some of involved objects do not match expectation. 
In contrast I will tell what exact objects were bad:

	((SpecOfInteractionHistory with: spec) validate: (MockInteractionHistory withAll: messages)) 
			description ""==> 0@0 corner: 1@1 never received area""

During validation I convert given general spec to the list of corresponding specs for every involved objects in given interaction history: 

	expectedBehaviorSpec asObjectInteractionSpecBetweenAll: aHistory involvedObjects. 

So the actual validation is performed over converted specification.
And in case of this example I will validate following spec: 

	SpecOfExpectedMessage from: (MockOccurredMessage receiver: (0@0 corner: 1@1) selector: #area).
	  
Internal Representation and Key Implementation Points.

    Instance Variables
	expectedBehaviourSpec:		<SpecOfOccurredMessages>
"
Class {
	#name : #SpecOfInteractionHistory,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'expectedBehaviourSpec'
	],
	#category : #'Mocketry-Specs'
}

{ #category : #error }
SpecOfInteractionHistory class >> with: anOccurredMessagesSpec [
	^self new 
		expectedBehaviourSpec: anOccurredMessagesSpec 
]

{ #category : #validation }
SpecOfInteractionHistory >> basicMatches: anInteractionHistory [
	| concreteObjectInteraction |
	concreteObjectInteraction := expectedBehaviourSpec 
		asInteractionSpecBetweenAll: anInteractionHistory involvedObjects.
	
	^concreteObjectInteraction matches: anInteractionHistory occurredMessages
]

{ #category : #accessing }
SpecOfInteractionHistory >> expectedBehaviourSpec [
	^ expectedBehaviourSpec
]

{ #category : #accessing }
SpecOfInteractionHistory >> expectedBehaviourSpec: anObject [
	expectedBehaviourSpec := anObject
]

{ #category : #accessing }
SpecOfInteractionHistory >> invertChildren [
	super invertChildren.
	expectedBehaviourSpec invert
]

{ #category : #validation }
SpecOfInteractionHistory >> validate: anInteractionHistory [
	| concreteObjectInteraction |
	concreteObjectInteraction := expectedBehaviourSpec 
		asInteractionSpecBetweenAll: anInteractionHistory involvedObjects.
	
	^concreteObjectInteraction validate: anInteractionHistory occurredMessages
]
