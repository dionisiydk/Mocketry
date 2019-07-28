"
I am special helper mock role which intercepts all messages to validate occurred behaviour with my object. 
During intercepting I build SpecOfExpectedMessage which I use to validate occurred behaviour. I put my object as receiver in these spec.

I am used during single message validation: 
	mock should receive someMessage once
	
Internal Representation and Key Implementation Points.

    Instance Variables
	withNegation:		<Boolean>
"
Class {
	#name : #MockValidator,
	#superclass : #MockHelperRole,
	#instVars : [
		'shouldExpression'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockValidator class >> forExpression: aShouldExpression [
	^(self for: aShouldExpression validationSubject)
		shouldExpression: aShouldExpression
]

{ #category : #processing }
MockValidator >> anyMessage [

	"This method for documenting purpose. Look at processing method. You will see that this particular selector is substituted by Any. It make possible to validate that there was any message to particular object (or any object):
		mock should receive anyMessage.
		Any should receive anyMessage"
]

{ #category : #processing }
MockValidator >> processTransformedMessageSend: anOccurredMessage by: aMockBehaviour [

	| spec |	
	spec := SpecOfExpectedMessage from: anOccurredMessage.
	
	shouldExpression evaluateWith: spec forMockBehaviour: aMockBehaviour.
	
	^MockDetailedMessagesValidation on: spec
]

{ #category : #accessing }
MockValidator >> shouldExpression [
	^ shouldExpression
]

{ #category : #accessing }
MockValidator >> shouldExpression: anObject [
	shouldExpression := anObject
]
