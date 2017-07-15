tests
testCurrentMetaLevelWhenThereIsTestForCurrentEnvironment

	| metaLevel env |
	metaLevel := behaviour currentMetaLevel.
	
	metaLevel should be: GHMetaLevel empty