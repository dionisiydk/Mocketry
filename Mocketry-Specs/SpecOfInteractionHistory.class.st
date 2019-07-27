Class {
	#name : #SpecOfInteractionHistory,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'expectedBehaviourSpec'
	],
	#category : #'Mocketry-Specs'
}

{ #category : #validation }
SpecOfInteractionHistory >> basicMatches: anInteractionHistory [
	| concreteObjectInteraction |
	concreteObjectInteraction := expectedBehaviourSpec 
		asInteractionSpecBetweenAll: anInteractionHistory involvedObjects.
	
	^concreteObjectInteraction matches: anInteractionHistory occuredMessages
]

{ #category : #accessing }
SpecOfInteractionHistory >> expectedBehaviourSpec [
	^ expectedBehaviourSpec
]

{ #category : #accessing }
SpecOfInteractionHistory >> expectedBehaviourSpec: anObject [
	expectedBehaviourSpec := anObject
]

{ #category : #validation }
SpecOfInteractionHistory >> validate: anInteractionHistory [
	| concreteObjectInteraction |
	concreteObjectInteraction := expectedBehaviourSpec 
		asInteractionSpecBetweenAll: anInteractionHistory involvedObjects.
	
	^concreteObjectInteraction validate: anInteractionHistory occurredMessages
]
