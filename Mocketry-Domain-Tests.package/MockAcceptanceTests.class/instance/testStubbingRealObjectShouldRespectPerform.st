tests
testStubbingRealObjectShouldRespectPerform

	| rect actual |
	rect := 0@0 corner: 2@3.
	rect stub width willReturn: 100.
	rect width should equal: 100.

	actual := rect perform: #width. 
	actual should equal: 100