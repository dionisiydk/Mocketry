initialization
initialize
	super initialize.
	registeredObjects := OrderedCollection new.
	globalStubs := OrderedCollection new.
	expectedMessages := OrderedCollection new.
	occurredMessages := OrderedCollection new.
	messageArgCaptures := Dictionary new.
	self replayMocks.