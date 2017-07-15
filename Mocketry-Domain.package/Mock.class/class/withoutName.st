instance creation
withoutName
	"It is explicit message to create mock without name. 
	Standart #new message always detects name by name of containing variable in context"

	^self withBehaviour
		setUpDefaultMockName;
		yourself