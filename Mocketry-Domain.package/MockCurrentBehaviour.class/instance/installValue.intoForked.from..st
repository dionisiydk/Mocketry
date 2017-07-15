accessing
installValue: aMockBehaviour intoForked: newProcess from: ownerProcess
	
	aMockBehaviour isInheritableByFork ifFalse: [ ^self ].

	newProcess psValueAt: index put: aMockBehaviour