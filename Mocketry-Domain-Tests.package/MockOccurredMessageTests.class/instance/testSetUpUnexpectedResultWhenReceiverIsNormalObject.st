tests
testSetUpUnexpectedResultWhenReceiverIsNormalObject

	| message actual |
	message := MockOccurredMessage receiver: (0@0 corner: 2@3) selector: #area.
	
	actual := message setUpUnexpectedResult.
	
	actual should equal: 6.
	message where result should beInstanceOf: MockOccurredValueReturn.
	message where result value should be: 6