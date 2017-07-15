initialization
initialize
	super initialize.
	
	actions := MockExpectedActionSequence new.
	usageCount := 0.
	conditionsSpec := SpecOfAndConjunction new