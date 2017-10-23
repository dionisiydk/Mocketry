tests
testWillStubRealResult

	| actual rect |
	rect := 0@0 corner: 2@4.
	rect stub center willStubRealResult.
	
	actual := rect center.
	actual hasGHMutation should be: true.
	actual should equal: 1@2.
	
	(Instance of: Point) stub angle willReturn: #constAngle.
	actual angle should be: #constAngle