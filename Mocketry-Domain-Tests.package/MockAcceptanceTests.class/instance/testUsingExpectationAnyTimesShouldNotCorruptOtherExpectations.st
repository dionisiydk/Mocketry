tests
testUsingExpectationAnyTimesShouldNotCorruptOtherExpectations
	"It is default usage strategy. But for lenient/strict logic default is useOnce"

	mock stub someMessage2 willReturn: #result2.
	mock stub someMessage willReturn: #result; useArbitrarily.
	
	mock someMessage2 should be: #result2.	
	mock someMessage should be: #result