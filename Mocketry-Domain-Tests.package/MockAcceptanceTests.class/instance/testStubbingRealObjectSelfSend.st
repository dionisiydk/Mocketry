tests
testStubbingRealObjectSelfSend

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub width willReturn: 1000.

	rect area should be: 3000