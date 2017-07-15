pages
mockCreation
	^ HelpTopic 
		title: 'Mock creation'
		contents:
'To create mock just use #new
	yourMock := Mock new.
	
Mocketry not requires any special context variables for this.

Also Mocketry implements auto naming logic to retrive variable names from test context. Inside test yourMock will be shown as "a Mock(yourMock)" (in debugger). 

But if you need special name you can specify it:
	Mock named: ''yourMock''
	
You can look at it livelly in MockTests.

Also there is way to get multiple mocks at once:
	[ :mockA :mockB | your code here ] runWithMocks
'