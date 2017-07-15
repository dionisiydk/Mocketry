pages
stubGroupOfMessageSends
	^ HelpTopic 
		title: 'Stub group of message sends'
		contents:
'There is way to stub multiple message sends at once:

	mock := Mock new.
	rect := 0@0 corner: 2@3.
	rect stub.
	
	[ mock someMessage willReturn: 10.
	rect width willReturn: 1000 ] should expect.

	mock someMessage should be: 10.
	rect area should be: 3000.

Inside "should expect" block you don''t need to send extra #stub message to objects'