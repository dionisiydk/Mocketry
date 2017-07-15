tests
testValidationThatParticularMessageWasSentToSetOfObjectsWhenNoSuchObjectsExist

	[(Instance of: Rectangle) should receive someMessage] should raise: SpecOfFailed