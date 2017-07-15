I am process specific variable to hold MockBehaviour instance during particular test case execution.

I detect current test case by another process variable  CurrentExecutionEnvironment. It allows me to detect that test was changed.

I ensure that my value will be same only during single test execution