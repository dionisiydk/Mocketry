arithmetics simulation
adaptToInteger: rcvr andSend: selector

	self mockBecome: 0.
	^rcvr perform: selector with: 0