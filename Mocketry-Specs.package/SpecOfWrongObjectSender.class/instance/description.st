printing
description

	wrongSender ifNil: [ 
		^spec printObject, ' was not returned by anybody'
			, ' but it should be ', spec printRequiredSender.	 ].
			
	^spec printObject, ' was returned from ', wrongSender printWithoutResult
		, ' but it should be ', spec printRequiredSender.	