accessing
extractResultFrom: aBlock

	| returnedValue |
	returnedValue := aBlock on: Exception - Halt do: [ :err | 
		result := MockOccurredExceptionSignal exception: err.
		err pass ].
	
	result := returnedValue asOccurredMessageResult.
	^returnedValue