I am special helper mock role which intercepts all messages to validate occurred behaviour with my object. 
During intercepting I build SpecOfExpectedMessage which I use to validate occurred behaviour. I put my object as receiver in these spec.

I am used during single message validation: 
	mock should receive someMessage once
	
Internal Representation and Key Implementation Points.

    Instance Variables
	withNegation:		<Boolean>