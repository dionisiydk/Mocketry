pages
captureMessageArguments
	^ HelpTopic 
		title: 'Capture message arguments'
		contents:
'Mocketry provides suitable tool to capture arguments of messages for subsequent verification:

	mock := Mock new.
	mock someMessageWith: Arg argName.
	
	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue.

As argument spec capture plays role of any object. So it not restricts message send expectation. Capture will store all received argument values. To verify concrete argument use message #fromCall:

	Arg argName fromFirstCall should be: #value1.
	Arg argName fromLastCall should be: #value3.
	(Arg argName fromCall: 2) should be: #value2.

Short version 
		Arg argName should be: #argValue.
will signal error if there are multiple different captured values.

Also "should" expression on capture will verify that owner message send was occurred required number of times.

When argument is captured it value is stubbed. It allows you to verify subsequent message sends to captured arguments:

	mock stub someMessageWith: Arg rectangle.

	rect := 0@0 corner: 2@3.
	mock someMessageWith: rect.
	rect area.
	
	Arg rectangle should be: rect.
	Arg rectangle should receive width.

'