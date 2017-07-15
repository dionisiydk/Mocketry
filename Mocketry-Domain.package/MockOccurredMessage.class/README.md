I represent intercepted message send.
I extend information defined in ordinar MessageSend. I add process in which context message was occurred. And I add result which represents result of message execution. 

I implement nice printing.

Public API and Key Messages

- extractResultForm: aBlock 
it will execute given block to catch result of self execution
 
- setUpDefaultResult 
It set default execution result which depends on receiver. For Mocks it will be special new mock. And for real object stubs it will be result of original method execution.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	process:		<Process>
	result:		<MockOccurredMessageResult>