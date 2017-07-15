accessing
convertExpectationsToSpecs
  
	^expectations 
		select: [ :each | each isForLimitedUsage ] 
		thenCollect: [ :each | each asExpectedMessageSpec]