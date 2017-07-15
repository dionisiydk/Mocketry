tests
testWhichPropertyShouldExpression

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect where origin should equal: 0@0