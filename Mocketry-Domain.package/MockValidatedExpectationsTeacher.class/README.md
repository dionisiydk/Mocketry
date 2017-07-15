I am special mock teacher to create expectations which then be validated as specs. 
I keep all defined expectations to validate only them.
Every expectation defined by me will be created with useOnce strategy by default.
All my expectations will be replayed with same order as they were defined.

My users should not use my default instance and instead always create new one:

	MockVAlidatedExpectationsTeacher new.
	
Internal Representation and Key Implementation Points.

    Instance Variables
	expectations:		<OrderedCollection of: <MockExpectedMessage>>
