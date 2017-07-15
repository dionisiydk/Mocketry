tests
testStubbingRealObjectTwice

	| rect firstMutation secondMutation |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: #area.
	firstMutation := rect ghMutation.
	
	rect stub origin willReturn: #origin.
	secondMutation := rect ghMutation.

	firstMutation should be: secondMutation.
	rect area should be: #area.
	rect origin should be: #origin