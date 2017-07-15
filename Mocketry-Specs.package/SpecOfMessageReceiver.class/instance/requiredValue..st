accessing
requiredValue: anObjectOrSpec

	requiredValue := anObjectOrSpec isStateSpec 
		ifTrue: [anObjectOrSpec ]
		ifFalse: [ Identical to: anObjectOrSpec ]