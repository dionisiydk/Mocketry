I am specification of expected object sender. I specify object which should be returned from one of occurred messages and I specify sender message which actualy should returned it.
 
My instance can be created by
	SpecOfExpectedObjectSender for: anObjectOrSpec returnedFrom: aSpecOfExpectedMessage
 
Internal Representation and Key Implementation Points.

    Instance Variables
	object:		<Object>
	requiredSender:	<SpecOfExpectedMessage>