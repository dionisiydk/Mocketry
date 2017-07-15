tests
testPrintingWhenArgumentIsMock

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith: arguments: {Mock named: 'testMock'}.
	
	message printString should equal: '#receiver messageWith: a Mock(testMock)'