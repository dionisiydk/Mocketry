I specify arbitrary condition during message send. 
I am used by MockExpectedMessage to validate any state in time when expectation should be executed.

My instance can be created by 
	SpecOfMessageSendCondition of: aSubjectBlock by: aSpec
or it is created by dsl messages: 
	mock stub someMessage when: [ anyState ] is: true
or
	mock stub someMessage when: [ anyState ] is: (Instance of: Number)
 
Internal Representation and Key Implementation Points.

    Instance Variables
	conditionSpec:		<SpecOfObjectState>
	subjectBlock:		<BlockClosure>


    Implementation Points