operations
useMockRole: aMockRole while: aBlock

	| currentRole |
	currentRole := mockRole.
	mockRole := aMockRole.
	aBlock ensure: [ mockRole := currentRole ]