tests
testUnexpectedMessageDefinedOnObject

	| actual |	
	actual := mock -> #value.
	
	actual should beInstanceOf: Association.
	actual key should be: mock.
	actual value should be: #value