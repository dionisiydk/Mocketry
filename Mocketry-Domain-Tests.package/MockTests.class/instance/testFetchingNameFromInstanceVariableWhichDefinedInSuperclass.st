tests
testFetchingNameFromInstanceVariableWhichDefinedInSuperclass
	| actual | 
	actual := mockFromSuperclass mockName.
		
	actual should equal: 'mockFromSuperclass'