I represent expected mock action which defined by block.
I will return block result as execution result.

I can be created with block by: 
	MockExpectedPluggableAction baseOn: aBlock.
or by block: 
	aBlock asMockExpectationAction
	
Internal Representation and Key Implementation Points.

    Instance Variables
	block:		<BlockClosure>