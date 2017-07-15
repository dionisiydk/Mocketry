accessing
fromCall: callNumber
	
	self validateNumberOfCalls: callNumber.
	
	^values at: callNumber