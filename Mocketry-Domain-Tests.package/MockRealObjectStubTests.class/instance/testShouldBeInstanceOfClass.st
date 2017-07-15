tests
testShouldBeInstanceOfClass

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should beInstanceOf: Rectangle