usage validation
atLeast: minNumberOfTimes atMost: maxNumberOfTimes
	spec usage 
		minCount: minNumberOfTimes;
		maxCount: maxNumberOfTimes.
	self execute