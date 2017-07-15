I am specification of expected message send. 
I consist of messageSend spec and usage spec. 
First defines message send signature and last defines how many times message can happen.

My instance can be creation from MessageSend 
	SpecOfExpectedMessage from: aMessageSend
	
Public API and Key Messages

- allowSendsCount: anInteger
It return true if given messages count can be happen.

- detectFailureIn: messageSendsCollection 
It returns most close message send to me which not satisfy me.

- addSpec: extraOccuredMessageSpec 
It is possible to add extra spec to message send description

Internal Representation and Key Implementation Points.

    Instance Variables
	messageSend:		<SpecOfMessageSend>
	usage:		<SpecOfMessageUsage>


    Implementation Points