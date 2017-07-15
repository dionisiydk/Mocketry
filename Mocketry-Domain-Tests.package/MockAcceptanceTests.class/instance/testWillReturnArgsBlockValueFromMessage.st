tests
testWillReturnArgsBlockValueFromMessage

	| actual |
	(mock stub someMessage: 2 and: 3) will: [:a1 :a2 | a1 + a2].
	
	actual := mock someMessage: 2 and: 3.
	
	actual should be: 5