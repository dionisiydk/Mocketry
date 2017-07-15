printing
printMessageOn: aStream

	self selector isSimpleValue 
			ifTrue: [ self printSimpleMessageOn: aStream ]
			ifFalse: [ 
				aStream << self selector title << ' with '.
				self printArgumentsArrayOn: aStream ]