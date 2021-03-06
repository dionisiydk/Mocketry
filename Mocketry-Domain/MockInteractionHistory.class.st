"
I represent the history of object interaction.
I keep all involved objects and messages which were sent to them.

I am used by MockBehavior to accumulate message sends between objects.
But you can create my instance on given list of messages using: 

	MockInteractionHistory withAll: {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
	}.

Following API is used to register objects and messages: 

- recordObject:
- recordMessage:
	
Internal Representation and Key Implementation Points.

    Instance Variables
	involvedObjects:		<OrderedCollection<Object>>
	occurredMessages:		<OrderedCollection<MockOccurredMessage>>
"
Class {
	#name : #MockInteractionHistory,
	#superclass : #Object,
	#instVars : [
		'involvedObjects',
		'occurredMessages'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockInteractionHistory class >> withAll: occurredMessages [
	^self new 
		occurredMessages: occurredMessages;
		collectInvolvedObjects;
		yourself
]

{ #category : #initialization }
MockInteractionHistory >> collectInvolvedObjects [

	involvedObjects := occurredMessages collect: [ :each | each receiver ] as: IdentitySet
]

{ #category : #accessing }
MockInteractionHistory >> firstMessage [
	^occurredMessages first
]

{ #category : #initialization }
MockInteractionHistory >> initialize [ 	

	involvedObjects := OrderedCollection new.
	occurredMessages := OrderedCollection new.
]

{ #category : #accessing }
MockInteractionHistory >> involvedObjects [
	^ involvedObjects
]

{ #category : #accessing }
MockInteractionHistory >> involvedObjects: anObject [
	involvedObjects := anObject
]

{ #category : #accessing }
MockInteractionHistory >> lastMessage [
	^occurredMessages last
]

{ #category : #accessing }
MockInteractionHistory >> occurredMessages [
	^ occurredMessages
]

{ #category : #accessing }
MockInteractionHistory >> occurredMessages: anObject [
	occurredMessages := anObject
]

{ #category : #controlling }
MockInteractionHistory >> recordMessage: anOccurredMessage [

	occurredMessages add: anOccurredMessage 
]

{ #category : #controlling }
MockInteractionHistory >> recordObject: anObject [

	involvedObjects add: anObject
]
