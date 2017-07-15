I am mock role which force mocks to replay all expected behaviour. 
With me MockBehaviour will lookup appropriate exectation for intrecepted messages and execute it actions.
When MockBehaviour not found expectation for intercepted message it will return new special mock as default result

I am defined as singleton:
	MockPlayer default.
	
I am default role for MockBehaviour