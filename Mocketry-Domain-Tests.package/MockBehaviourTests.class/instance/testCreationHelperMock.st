tests
testCreationHelperMock

	| helperMock helperBehaviour |
	behaviour ownerEnvironment: #originalEnv.
	behaviour expectedMessages: #existedExpectations.
	
	helperMock := behaviour createHelperMockAs: #helperMockRole.
	
	helperMock should beInstanceOf: MockHelper.
	helperMock mockName should equal: #helperMockRole printString.
	
	helperBehaviour := helperMock ghostBehaviour.
	helperBehaviour should not be: behaviour.
	helperBehaviour where ownerEnvironment should be: #originalEnv.
	helperBehaviour where expectedMessages should be: #existedExpectations.
	helperBehaviour where mockRole should be: #helperMockRole.
	
	