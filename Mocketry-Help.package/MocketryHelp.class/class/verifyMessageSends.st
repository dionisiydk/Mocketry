pages
verifyMessageSends
	^ HelpTopic 
		title: 'Verify messages sends'
		contents:
'With Mocketry you can check that particular object received some message. Use "should receive" expression for this:

	mock := Mock new.
	mock someMessage.
	
	mock should receive someMessage.
	mock should not receive anotherMessage
	
You can verify message to any objects. It is not only about mocks:

	rect := 0@0 corner: 2@3.
	rect stub "it should be here to enable message interception"
	rect area 
	
	rect should receive width. "area = width * height"
	
And you can do this with globals too:

	DateAndTime stub.
	
	DateAndTime midnight.
	
	DateAndTime should receive now. "inside midnight #now is called"
	
But you should be carefull with globals. Look at page #stubMessageSends.

Also with Mocketry you can verify that message was sent to set of objects. 
For example you can verify that message was sent to ANY object:

	mock := Mock new.
	rect := 0@0 corner: 2@3.
	rect stub. 
	
	mock width.
	rect area.
	
	Any should receive width. "it will check that mock and rect received message #width"
	Any should receive area "it will fail because mock not received #area message".

Also you can verify that ANY message was sent to particular object:

	mock := Mock new.

	mock someMessage should be: 100.

	mock should receive anyMessage.
		
And both variants are supported:

	mock := Mock new.
	rect := 0@0 corner: 2@3.	
	rect stub.
	
	mock someMessage.
	
	Any should receive anyMessage. "will fail because rect not received any message".
	
	rect width.
	
	Any should receive anyMessage. "will not fail because both objects received at least one message"
	
Any class is specific object spec which means "any" object. You can uses any kind of specs to verify message send for set of objects:
	
	rect := 0@0 corner: 2@3.
	rect stub.	
	rect area.
	
	rect2 := 0@0 corner: 4@5.
	rect2 width.	
		
	(Kind of: Rectangle) should receive width. "will not fail because both rect''s received message #width"
	(Kind of: Rectangle) should receive area "will fail because rect2 not received message #area"

	mock := Mock new.
	(Kind of: Rectangle) should receive width. "will not fail because mock is not kind of Rectangle"
'