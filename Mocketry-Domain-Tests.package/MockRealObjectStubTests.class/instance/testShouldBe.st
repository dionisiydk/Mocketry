tests
testShouldBe

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should be: rect.
	rect should not be: #wrongRect