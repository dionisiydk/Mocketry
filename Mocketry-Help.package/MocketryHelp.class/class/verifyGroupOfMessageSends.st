pages
verifyGroupOfMessageSends
	^ HelpTopic 
		title: 'Verify group of message sends'
		contents:
'There is way to verify group of message sends at once:

	mock := Mock new.
	rect := 0@0 corner: 2@3.
	rect stub.
	mock someMessage.
	rect area.
		
	[ rect width.
	mock someMessage ] should beDone.

	[ mock someMessage.
	rect width ] should beDoneInOrder.

#beDone don''t care about order of message sends.
#beDoneInOrder verifies that messages were set in same order as they defined inside given block'