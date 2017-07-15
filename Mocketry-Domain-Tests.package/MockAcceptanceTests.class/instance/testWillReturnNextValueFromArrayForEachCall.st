tests
testWillReturnNextValueFromArrayForEachCall

	mock stub someMessage willReturnValueFrom: #(result1 result2).
	
	mock someMessage should be: #result1.
	mock someMessage should be: #result2.
	
	mock someMessage should beInstanceOf: MockForMessageReturn