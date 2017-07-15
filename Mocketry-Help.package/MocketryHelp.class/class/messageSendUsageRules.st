pages
messageSendUsageRules
	^ HelpTopic 
		title: 'Message send usage rules'
		contents:
'It is possible to specify how much times expectation can be used:
	
	mock := Mock new.	
	mock stub someMesage willReturn: #default.
	mock stub someMessage willReturn: 300; use: 3.
	mock stub someMessage willReturn: 200; useTwice.
	mock stub someMesage willReturn: 100 useOnce.	
	"last defined expectation is more preferred then previously defined"
	
	mock someMessage should be: 100.
	
	mock someMessage should be: 200.
	mock someMessage should be: 200.
	
	mock someMessage should be: 300.
	mock someMessage should be: 300.
	mock someMessage should be: 300.
	
	mock someMessage should be: #default
'