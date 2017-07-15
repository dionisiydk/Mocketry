I represent failure of SpecOfExpectedMessage.  This spec validates list of occurred messages. And I specify information about what was going wrong.

My occurredMessage contains list of valid occurred message sends.
My wrongMessage contains validation failure about first wrong message send.

Internal Representation and Key Implementation Points.

    Instance Variables
	occuredMessages:		<Collection of: <MockOccurredMessage>>
	wrongMessage:		<SpecOfWrongMessageSend>