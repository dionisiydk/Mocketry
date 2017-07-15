tests
testCapturingArgumentWillStubIt

	| rect |
	mock stub someMessageWith: Arg rectangle.

	rect := 0@0 corner: 2@3.
	mock someMessageWith: rect.
	rect area.
	
	Arg rectangle should be: rect.
	Arg rectangle should receive width.
	Arg rectangle where corner x should be: 2