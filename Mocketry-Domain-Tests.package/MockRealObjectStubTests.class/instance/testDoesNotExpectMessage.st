tests
testDoesNotExpectMessage

	| actual unexpectedMessage rect |
	unexpectedMessage := MockOccurredMessage receiver: Any selector: #area.

	rect := 0@0 corner: 2@3.
	rect stub area willReturn: 1000.
		
	actual := rect stubDoesNotExpect: unexpectedMessage.
	
	actual should equal: 6