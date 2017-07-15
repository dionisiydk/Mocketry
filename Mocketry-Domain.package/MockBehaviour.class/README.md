I am ghost behaviour for mocks.
I delegate messages processing to MockRole instance. For example MockTeacher will build expectations for received message. And MockPlayer will use expectations to execute received messages.

So I have collection of expectedMessages and collection of occurredMessages.
Expected messages contains description of messages with predefined actions for them. Actions are performed when occurred message corresponds to expectation description.
Occurred messages contains full histrory of intercepted messages in context of player role. In tests you can write specifications about what was happened.

To represent intercepted messages I use MockOccurredMessage class. It provide suitable printing and hold extra information. For example it contains process where message was sent and returned result. In test such information can be used to validate tested behaviour.

As ghost behaviour I define my vision on current meta level. I use empty meta level when message intercepted in context of tests. And I use standart meta level when it was happens in contexts of tools (not tests). For this I use process specific variable MockCurrentEnvironment. During test it is MockTestEnvironment and in context of tools it is MockDefaultEnvironment.

Usually my instance not created directly. You should use process specific variable to retrive me from current context.
 	MockCurrentBahaviour value 
Idea that mocks inside same test should have single behaviour instance. 	

Public API and Key Messages

- buildExpectationFor: anOccurredMessage
It will create and return MockExpectedMessage for received message. send. Then users can sent special messages to it to define expected behaviour.

- replayMessageSend: anOccurredMessage
It will lookup and execute expectation for received message send. Given occurred message will be saved in occurredMessages history. 

- validateOccurredMessagesBy: aSpecOfExpectedMessage
It will validate occurredMessages collection by given spec.
 
- createHelperMockAs: aMockRole 
It will create special mock which will delegate all messages to given role.

- useMockRole: aMockRole while: aBlock
It will use given mock role to process intercepted messages during given block execution.

- replayMocks 
It set role MockPlayer

- teachMocks
It set role MockTeacher 
  
- setUpContextNameFor: aMock
It will extract name of variable which contains aMock from current test case context. If it will be found detected name will be set to given mock.

Internal Representation and Key Implementation Points.

    Instance Variables
	ownerEnvironment:		<MockEnvironment>
	expectedMessages:		<Collection of <MockExpectedMessage>>
	mockRole:		<MockRole>
	occurredMessages:		<Collection of <MockOccurredMessage>>
