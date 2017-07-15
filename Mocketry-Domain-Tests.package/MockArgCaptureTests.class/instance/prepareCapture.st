helpers
prepareCapture
	| arg message |
	
	message := MockOccurredMessage receiver: #receiver selector: #asString.
	4 timesRepeat: [MockCurrentBehaviour value replayMessageSend: message].
	
	arg := MockArgCapture named: 'testArg'.
	arg messageSpec: (SpecOfMessageSend from: message).
	^arg