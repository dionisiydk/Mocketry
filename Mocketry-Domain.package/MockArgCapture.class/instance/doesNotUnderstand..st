delegation messages
doesNotUnderstand: aMessage
	
	self validateSingleValue.
	
	^aMessage sendTo: self fromFirstCall