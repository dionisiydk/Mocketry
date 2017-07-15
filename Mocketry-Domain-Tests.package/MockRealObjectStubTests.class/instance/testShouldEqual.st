tests
testShouldEqual

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should equal: rect.
	rect should equal: (0@0 corner: 2@3)