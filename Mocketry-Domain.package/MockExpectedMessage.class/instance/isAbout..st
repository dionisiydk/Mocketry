testing
isAbout: aMessageSend

	(spec matches: {aMessageSend}) ifFalse: [ ^false ].
	
	^spec allowSendsCount: usageCount + 1