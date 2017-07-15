I represent sequence of expected actions which should be executed all together when corresponding message send will be intercepted.
I return last action result as execution result.

I am used by MockExpectedMessage as actions variable.

Public API and Key Messages

- add: aMockExpectationAction
 
Internal Representation and Key Implementation Points.

    Instance Variables
	actions:		<Collection of <MockExpectationAction>>
