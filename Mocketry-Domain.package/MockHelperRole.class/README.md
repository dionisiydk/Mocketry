I am a root of helper mock roles which are used to intercept all messages for given object for particular purpose.  I transform intercepted message sends to replace it receiver with my object and to replace #anyMessage with Any spec.

My subclasses should implement: 
	processTransformedMessageSend: anOccurredMessage by: aMockBehaviour
	  
Internal Representation and Key Implementation Points.

    Instance Variables
	object:		<Object>