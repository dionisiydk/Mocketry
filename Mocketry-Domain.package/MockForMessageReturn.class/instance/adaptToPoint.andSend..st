arithmetics simulation
adaptToPoint: rcvr andSend: selector

	| zero |
	zero := 0@0.
	self mockBecome: zero.
	^rcvr perform: selector with: zero