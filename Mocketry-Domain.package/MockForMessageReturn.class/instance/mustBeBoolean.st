boolean simulation
mustBeBoolean
	| sender |
	
	sender := thisContext sender.
	sender pc: sender previousPc.

	self mockBecome: false