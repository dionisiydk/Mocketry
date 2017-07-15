*Mocketry-Domain
createMockBehaviour
	| behaviour |
	forkedProcesses add: MockCleaningProcessHook instance.
	
	behaviour := super createMockBehaviour.
	behaviour ownerTestCase: testCase.
	^behaviour