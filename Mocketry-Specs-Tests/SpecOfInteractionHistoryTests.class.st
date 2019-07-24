Class {
	#name : #SpecOfInteractionHistoryTests,
	#superclass : #TestCase,
	#category : #'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfInteractionHistoryTests >> testSucceedValidation [
	
	|  result spec history |
	
	spec := SpecOfInteractionHistory new.
	spec expectedBehaviourSpec: ( 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3)).
			
	history := MockInteractionHistory withAll: {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	result := spec validate: history.
	
	result should be isSuccess.
	result should beInstanceOf: SpecOfMessagesValidationSuccess.
	result where occurredMessages should equal: {history firstMessage. history lastMessage}
]
