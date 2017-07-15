tests
testStubbingGlobalClass
	
	[
		GHClassStub stub someMessage willReturn: #result.

		GHClassStub someMessage should be: #result
	
	] ensure: [ GHClassStub recoverFromGHMutation ]
	