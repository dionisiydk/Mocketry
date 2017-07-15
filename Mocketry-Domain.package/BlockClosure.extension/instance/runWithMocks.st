*Mocketry-Domain
runWithMocks

	| mocks |
	mocks := self argumentNames collect: [:each | Mock named: each ].
	self valueWithArguments: mocks