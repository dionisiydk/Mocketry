tests
testDoesNotExpectMessageByObject

	| actual unexpectedMessage |
	unexpectedMessage := MockOccurredMessage receiver: Any selector: #area.

	actual := (0@0 corner: 2@3) stubDoesNotExpect: unexpectedMessage.
	
	actual should equal: 6