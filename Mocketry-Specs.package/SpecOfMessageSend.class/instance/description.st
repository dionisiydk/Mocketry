printing
description
	^String streamContents: [ :s |
		self printReceiverOn: s.
		s << ' ' << self shouldPrefixPhrase << ' receive '.
		self printMessageOn: s
	]