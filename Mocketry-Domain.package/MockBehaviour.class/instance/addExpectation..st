operations
addExpectation: aMockExpectedMessage
	"last added expectation should override previously defined. 
	For this new expectation is added to start of expectedMessages list. 
	It makes lookup of expectations easy (look at method #replayMessageSend:)"

	expectedMessages addFirst: aMockExpectedMessage 