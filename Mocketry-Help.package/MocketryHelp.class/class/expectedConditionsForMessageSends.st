pages
expectedConditionsForMessageSends
	^ HelpTopic 
		title: 'Expected conditions for message sends'
		contents:
'It is possible to verify arbitrary condition when expected message is going to be executed. For example:

	mock := Mock new.
	mock someMessage
		when: [flag] is: (Kind of: Boolean);
		when: [flag] is: true;
		when: [ flag ] satisfy: [ :object | true or: [ false ] ]
	
	flag := true.
	mock someMessage. "not failes"

	flag := false.
	mock someMessage "will fail immediately on call by last condition: flag should be true"
	
	flag := #flag.
	mock someMessage "will fail immediately on call by first condition: flag should be boolean"
	
Also Mocketry implements process related condition to check that message was synchronously sent (relative to test process):

	mock stub someMessage shouldBeSentInThisProcess.
	[ mock someMessage ] fork. "will fail immediately on call".
	
	mock stub someMessage shouldBeSentInAnotherProcess.
	[ mock someMessage ] fork. "will not fail".
	mock someMessage. "will fail immediately on call"'