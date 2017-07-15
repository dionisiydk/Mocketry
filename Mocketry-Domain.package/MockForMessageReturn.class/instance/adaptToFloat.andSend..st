arithmetics simulation
adaptToFloat: rcvr andSend: selector

	self mockBecome: 0.0.
	^rcvr perform: selector with: 0.0