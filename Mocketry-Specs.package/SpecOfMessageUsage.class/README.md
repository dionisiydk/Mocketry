I represent restriction on how many times message can be sent.
I am part of SpecOfExpectedMessage.

Public API and Key Messages

- allowMessageSends: anInteger
- allowMessageSends: anInteger withNegatedLogic: aBoolean
- minCount: anInteger
- maxCount: anInteger
- exactCount: anInteger

Internal Representation and Key Implementation Points.

    Instance Variables
	maxCount:		<SmallInteger>
	minCount:		<SmallInteger>