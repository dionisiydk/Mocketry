*Mocketry-Domain
expect
	
	| teacher |
	teacher := MockTeacher default.
	MockCurrentBehaviour useMockRole: teacher while: receiver.
	^teacher