pages
expectedActions
	^ HelpTopic 
		title: 'Expected actions'
		contents:
'There is different kind of expected actions:

	mock := Mock new.	
	mock stub someMessage willReturn: #result.
	mock someMessage should be: #result.

	mock stub someMessage willRaise: ZeroDivide new.
	[mock someMessage] should raise: ZeroDivide.
	
	(mock stub someMessageWith: #arg) will: [#result].
	(mock someMessageWith: #arg) should be: #result.
	
	(mock stub someMessageWith: #arg1 and: #arg2) will: [:arg1 :arg2 | arg1, arg2].
	(mock someMessageWith: #arg1 and: #arg2) should equal: ''arg1arg2''.
	
	mock stub someMessage willReturnValueFrom: #(result1 result2).
	mock someMessage should be: #result1.
	mock someMessage should be: #result2'