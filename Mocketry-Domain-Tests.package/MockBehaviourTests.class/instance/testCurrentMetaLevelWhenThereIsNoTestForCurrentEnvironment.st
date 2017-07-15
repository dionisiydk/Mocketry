tests
testCurrentMetaLevelWhenThereIsNoTestForCurrentEnvironment

	| metaLevel |

	[DefaultExecutionEnvironment beActive.
	metaLevel := behaviour currentMetaLevel] fork.
	20 milliSeconds wait.
	
	metaLevel should be: GHMetaLevel standard