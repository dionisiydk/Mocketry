operations
addExpectation: aMockExpectedMessage asPartOfGroup: expectationsGroup
	"Expectations can be defined as separated group of messages. 
	In that case they should be added in same order as they defined in group.
	When group is empty we think it is first expectation for given group and we add it in order to override previously defined expectations. This trick is used to allo lenient/strict validation of spec defined by expectations"

	expectationsGroup 
		ifEmpty: [ self addExpectation: aMockExpectedMessage]
		ifNotEmpty: [ expectedMessages add: aMockExpectedMessage after: expectationsGroup last]