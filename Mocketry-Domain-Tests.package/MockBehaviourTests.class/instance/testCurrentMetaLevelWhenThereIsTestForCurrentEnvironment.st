tests
testCurrentMetaLevelWhenThereIsTestForCurrentEnvironment

	| metaLevel |
	metaLevel := behaviour currentMetaLevel.
	
	metaLevel should be: GHMetaLevel empty