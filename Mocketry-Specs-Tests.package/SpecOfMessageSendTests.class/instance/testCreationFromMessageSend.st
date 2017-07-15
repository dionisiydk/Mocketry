tests
testCreationFromMessageSend

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: #receiver selector: #selector arguments: #(arg1 arg2)).
	
	spec where specs should haveSize: 4.
	spec where specs first should beInstanceOf: SpecOfMessageReceiver.
	spec where specs first requiredValue requiredValue should be: #receiver.
	
	spec where specs second should beInstanceOf: SpecOfMessageSelector.
	spec where specs second requiredValue requiredValue should be: #selector.
	
	spec where specs third should beInstanceOf: SpecOfMessageArgument.
	spec where specs third argumentNumber should be: 1.
	spec where specs third requiredValue requiredValue should be: #arg1.
	
	spec where specs fourth should beInstanceOf: SpecOfMessageArgument.
	spec where specs fourth argumentNumber should be: 2.
	spec where specs fourth requiredValue requiredValue should be: #arg2.