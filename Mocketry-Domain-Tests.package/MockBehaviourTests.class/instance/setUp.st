running
setUp
	super setUp.
	
	MockCurrentBehaviour value: nil.	
	behaviour := MockBehaviour new.
	