tests
testPrintingStringWhenMockWithName
	"here we tests how mock will be shown inside tools. 
	By default mocks under test are created in current test environment. We fork messages under test  to simulate tools default environment"
	| actual |
	mock := Mock named: 'test mock'.	
	
	[DefaultExecutionEnvironment beActive.
	actual := mock printString] fork.
	20 milliSeconds wait.
		
	actual should equal: 'a Mock(test mock)'