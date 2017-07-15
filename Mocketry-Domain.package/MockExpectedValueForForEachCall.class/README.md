I represent expected message result which will be extracted from array for every intercepted message send. So for first send it will be first item of my values array. And for second send it will be second item.

I allow easily define expected values for multiple message sends.

My instance can be created by 
	MockExpectedValueForEachCall value: anArray
	
Internal Representation and Key Implementation Points.

    Instance Variables
	values:		<Array of: <Object>>
	currentValueIndex:		<SmallInteger>