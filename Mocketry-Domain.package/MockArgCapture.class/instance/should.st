specs
should 

	| expression |
	self validateSingleValue.
	
	expression := self fromFirstCall should.
	expression receiverOwner: self.
	^expression