running
setUp
	super setUp.
	"We maually reset current mock behaviour for the case when process specific variable is managed badly. It is covered by other test cases"
	MockCurrentBehaviour value: nil.
		
	mock := Mock new.