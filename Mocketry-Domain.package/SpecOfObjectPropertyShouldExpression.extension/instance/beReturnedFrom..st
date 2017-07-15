*Mocketry-Domain
beReturnedFrom: aBlockWithMessageSpec

	| should |
	should := receiver value should.
	should withNegation: withNegation.
	
	^should beReturnedFrom: aBlockWithMessageSpec 