tests
testWillCallOriginalMethodFromMessageOfRealObjectStub

	| actual rect executed |
	rect := 0@0 corner: 2@3.
	
	rect stub area will: [executed := true]; willCallOriginalMethod.
	
	actual := rect area.
	actual should be: 6.
	executed should be: true