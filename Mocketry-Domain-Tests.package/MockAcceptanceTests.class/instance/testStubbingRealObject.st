tests
testStubbingRealObject

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: 100.

	rect area should be: 100.
	rect origin should equal: 0@0