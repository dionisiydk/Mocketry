tests
testUsingExpectationAnyTimes
	"It is default usage strategy. But for lenient/strict logic default is useOnce"
	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; useOnce; useArbitrarily.
		
	mock someMessage should be: #result.
	mock someMessage should be: #result.
	mock someMessage should be: #result