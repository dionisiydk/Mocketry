My subclasses represent concrete property of message send as a root parent of SpecOfObjectProperty.
Subclasses should implement single method #extractValueFromMessage to initialize a value of property.
 
Instances can be created by 
	
	SpecOfOccurredMessageProcessProperty of: aMockOccurredMessage

Internal Representation and Key Implementation Points.

    Instance Variables
	message:		<MockOccurredMessage>