I am special operation on SpecOfExpectedMessage which is used to modify given spec by my DSL api and validate it immediatelly.

So for example after sending me message once I will change usage spec of expected message and immediatelly validate occurred message by it. 

I am used during received message validation: 
	mock should receive someMessage once
	 
Look at my superclass comment and methods