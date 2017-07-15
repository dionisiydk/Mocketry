tests
testExtractingReturnedValueResultFromBlock

	| message actual |
	message := MockOccurredMessage new.
	
	actual := message extractResultFrom: [ #result ].
	
	message where result should beInstanceOf: MockOccurredValueReturn.
	message where result value should be: #result.
	actual should be: #result