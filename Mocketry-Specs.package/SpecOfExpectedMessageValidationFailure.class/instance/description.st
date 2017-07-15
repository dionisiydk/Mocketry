printing
description

	"mostSimilarMessage ifNotNil: [ ^mostSimilarMessage description]."

	occuredMessages ifEmpty: [ ^spec printMessageNotHappen].
	
	^spec description, ' but it was ', occuredMessages size asString , ' times' 