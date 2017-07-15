converting
asInteractionSpecBetweenAll: expectedReceivers
	| result copy |
	self isAboutConcreteReceiver ifTrue: [ ^ self ].
	
	result := SpecOfObjectsInteraction new.
	expectedReceivers	do: [ :eachReceiver | 
			(messageSend receiver matches: eachReceiver) ifTrue: [ 
				copy := self copy.
				copy receiver: eachReceiver.
				result addExpectedMessage: copy ] 
	].			
	result isEmpty ifTrue: [ ^ self ].
	^ result