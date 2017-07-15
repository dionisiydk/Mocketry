tests
testNotEqualToAnotherMessageWithSameParameters

	| message anotherMessage |
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	anotherMessage := MockOccurredMessage receiver: #receiver selector: #selector.
	
	(message = anotherMessage) should be: false description: 'Occurred messages cant be equal!'