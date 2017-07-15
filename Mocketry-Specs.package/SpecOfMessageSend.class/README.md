I specify message send signature. I consist of receiver, selector and arguments specs (as conjunction).

I can be created from MessageSend tempalte:
	SpecOfMessageSend from: aMessageSend

where aMessageSend is supposed to include specs in place of receiver, selector and arguments (objects will be converted to specs anyway).

Public API and Key Messages

- receiver
- selector
- arguments