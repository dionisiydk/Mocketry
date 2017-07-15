printing
ghostPrintString

	| objectName |
	objectName := GHMetaMessages printObject: self.
	
	^objectName, '(', self mockName, ')'