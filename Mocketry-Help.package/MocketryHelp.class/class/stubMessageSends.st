pages
stubMessageSends
	^ HelpTopic 
		title: 'Stub messages sends'
		contents: 
'To stub message send just send message #stub to object and following message will create expectation:

	mock := Mock new.
	
	mock stub someMessage willReturn: 100.
	
	mock someMessage should be: 100.
	
You can stub any objects. It is not only about mocks:

	rect := 0@0 corner: 2@3.
	rect stub width willReturn: 1000.
	
	rect area should be: 3000 "are = width * height"
	
And you can do this with globals too:

	DateAndTime stub now willReturn: #constantValue.
	
	DateAndTime now should be: #constantValue.
	
But you should be carefull with globals. Don''t try 

	Array stub new.

It will crash image. 
And if you stub global from workspace it is your responsibility to recover it from stub behaviour. Do it by this:

	DateAndTime recoverFromGHMutation.

In case when you stub global inside test Mocketry automatically recovers all global stubs when test completes.

Also with Mocketry you can define expectations for set of objects. For example you can stub message to ANY object:

	Any stub width willReturn: 100.

	Mock new width should be: 100.
	rect := 0@0 corner: 2@3.
	rect stub. "it activates message intercection for real object. Without it following sentence will not work"
	rect area should be: 300.

Or you can stub ANY message to particular object:

	mock := Mock new.
	mock stub anyMessage willreturn:: 100.
	
	mock someMessage should be: 100.
	mock someMessage2 should be: 100.
		
And both variants are supported:

	Any stub anyMessage willReturn: 100.
	Mock new someMessage should be: 100.
	
	rect := 0@0 corner: 2@3.	
	rect stub.
	
	rect area should be: 100.
	rect width should be: 100.
	
Any class is specific object spec which means "any" object. You can uses any kind of specs:

	(Kind of: Rectangle) stub width willReturn: 100.
	
	rect := 0@0 corner: 2@3.
	rect stub.	
	rect area should be: 300.
	
	rect2 := 0@0 corner: 4@5.
	rect2 stub.	
	rect2 area should be: 500'