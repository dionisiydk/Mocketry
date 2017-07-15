I represent mock expectation.

I consist of:  

- expected message spec (description of expected message defined by SpecOfExpectedMessage)

- current usage count (counter which holds how much times expected message was used)

- expected actions (what should be done as result of intercepted message send)

- extra conditions spec (extra specs which should be validated before actions will be executed. It allows to check conditions and immediatelly stop execution when it is wrong) 
 
My instance returned as result of intercepted message send during mocks teaching. Then following messages can be used to specify different kind of expected behaviour:

- will: aBlock
- willReturn: anObject
- willRaise: anExceptionOfClass
- willReturnValueFrom: anArray
- willReturnYourself

To specify how much times expected message should be used for intercepted sends try this:

- use: aNumber 
- useOne
- useTwice

And to specify conditions which should be valid when expectation is executed use this:

- when: aBlock is: aSpecOfObjectState
- when: aBlock satisfying: aBlock 
- shouldOccurInThisThread
- shouldOccurInAnotherThread 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	actions:		<MockExpectedActionSequence>
	conditionsSpec:		<SpecOfAndConjunction>
	spec:		<SpecOfExpectedMessage>
	usageCount:		<Integer>