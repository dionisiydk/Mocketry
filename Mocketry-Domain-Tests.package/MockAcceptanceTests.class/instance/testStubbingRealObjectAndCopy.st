tests
testStubbingRealObjectAndCopy

	| rect copy |
	rect := 0@0 corner: 2@3.
	rect stub.

	copy := rect copy.
	copy should beInstanceOf: Rectangle.
	copy corner should equal: rect corner.
	copy origin should equal: rect origin