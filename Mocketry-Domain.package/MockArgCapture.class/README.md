I represent of captured argument from series of occurred message sends.

I should be retrived by direct message to suitable class Arg:
	Arg argName 
 
I supposed to be used as argument spec in expectations. When expectation is executed I capture given message argument for future verification. I allow tests to be looked like: 

	mock stub someMessageWith: Arg argName.
	
 	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue
 
I capture all argument values from multiple message sends. 
To retrieve values of concrete call use:

	Arg argName fromFirstCall should be: #first.	
	Arg argName fromLastCall should be: #last.
	(Arg argName fromCall: 2) should be: #second.

Internal Representation and Key Implementation Points.

    Instance Variables
	messageSpec:		<SpecOfMessageSend>
	name:		<String>
	values:		<OrderedCollection>