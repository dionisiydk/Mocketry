*Mocketry-Domain
stub

	| behaviour mutation |
		
	self hasGHMutation 
		ifTrue: [ behaviour := self ghMutation mutationBehaviour ]
		ifFalse: [ 
			behaviour := MockCurrentBehaviour value.
			behaviour registerObject: self.
			mutation := GHObjectMutation behaviour: behaviour.
			mutation mutate: self].
	
	^behaviour createHelperMockAs: (MockStubTeacher for: self)