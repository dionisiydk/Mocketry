instance creation
from: anOccurredMessage withBehaviour: aGhostBehavior
	^self withoutName 
		mockOwnerMessage: anOccurredMessage;
		ghostBehaviour: aGhostBehavior