tests
testStubbingRealObjectShouldReturnRealClass

	| object actual |
	object := 0@0.
	object stub.

	actual := object class.
	actual should be: Point