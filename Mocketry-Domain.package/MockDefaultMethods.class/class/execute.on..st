execution
execute: anOccurredMessage on: aMock
	"look at class comment for explanation"
	| defaultMethod |
	defaultMethod := self lookupSelector: anOccurredMessage selector.
	defaultMethod ifNotNil: [
		GHCurrentMetaLevelDepth increaseFor: [ 
			[^GHMetaMessages 
				executeWith: aMock andArguments: anOccurredMessage arguments method: defaultMethod] 
					on: Error do: [ :err | ]].
	].

	^MockForMessageReturn from: anOccurredMessage withBehaviour: aMock ghostBehaviour