printing
description
	
	^String streamContents: [ :s |
		messageSend printReceiverOn: s.
		s << ' ' << self shouldPrefixPhrase << ' receive '.
		messageSend printMessageOn: s.
		
		usage hasMeaningfulRestrictions ifTrue: [ 
			s << ' ' << usage printRestrictions].
	]
	