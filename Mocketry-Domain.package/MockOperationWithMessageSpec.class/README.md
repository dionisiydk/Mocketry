I represent abstract operation which should be performed on given SpecOfExpectedMessage.

I provide DSL-kind message to modify my spec and to execute operation after this.

My subclasses should implement method #execute.

For public API look at methods. They are all public DSL.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	spec:		<SpecOfExpectedMessage>