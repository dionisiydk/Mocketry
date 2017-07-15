tests
testHasSameBehaviourAsMocks

	| rect mock |
	mock := Mock new.

	rect := 0@0 corner: 2@3.
	rect stub.

	rect ghMutation mutationBehaviour should be: mock ghostBehaviour