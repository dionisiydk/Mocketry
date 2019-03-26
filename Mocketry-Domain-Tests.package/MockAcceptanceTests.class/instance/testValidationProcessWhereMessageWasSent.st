tests
testValidationProcessWhereMessageWasSent

	| process |
	mock := Mock new.
	
	process := [mock someMessage] forkAt: Processor activePriority + 1 named: 'MyTestProcess'.
	
	mock should receive someMessage inProcessWhich should be: process.
	mock should receive someMessage inProcessWhich priority should equal: Processor activePriority + 1