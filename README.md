[![Build Status](https://travis-ci.org/dionisiydk/Mocketry.svg?branch=master)](https://travis-ci.org/dionisiydk/Mocketry)
# Mocketry

Mocketry is mock objects framework\. It provides simplest way to stub any message to any object and to verify any occurred behaviour

## Installation
Use following script for Pharo version >= 6:
```Smalltalk
Metacello new
  baseline: 'Mocketry';
  repository: 'github://dionisiydk/Mocketry';
  load
```
To add dependency in your project baseline:
```Smalltalk
spec
    baseline: 'Mocketry'
    with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x' ]
```
For old Pharo versions project should be loaded from smalltalkhub:
```Smalltalk
Metacello new
      smalltalkhubUser: 'dionisiy' project: 'Mocketry';
      configuration: 'Mocketry';
      version: #stable;
      load.
```
## Create mocks easily
To create mock just use **\#new**
```Smalltalk
yourMock := Mock new.
```
Mocketry not requires any special context variables for this\.

Also Mocketry implements auto naming logic to retrive variable names from test context\. Inside test yourMock will be shown as "a Mock\(yourMock\)" \(in debugger\)\.

But if you need special name you can specify it:
```Smalltalk
Mock named: 'yourMock'
```
You can look at it livelly in MockTests\.

Also there is way to get multiple mocks at once:
```Smalltalk
[ :mockA :mockB | "your code here" ] runWithMocks
```
## Stub any message sends
<a name="stubMessageSends"></a>To stub message send just send message **\#stub** to object and following message will create expectation:
```Smalltalk
mock := Mock new.
    
mock stub someMessage willReturn: 100.
    
mock someMessage should be: 100.
```
You can stub any objects\. It is not only about mocks:
```Smalltalk
rect := 0@0 corner: 2@3.
    
rect stub width willReturn: 1000.
    
rect area should be: 3000 "are = width * height"
```
And you can do this with globals too:
```Smalltalk
DateAndTime stub now willReturn: #constantValue.
    
DateAndTime now should be: #constantValue.
```
But you should be carefull with globals\. Don't try
```Smalltalk
Array stub new.
```
It will crash image\.
And if you stub global from workspace it is your responsibility to recover it from stub behaviour\. Do it by this:
```Smalltalk
DateAndTime recoverFromGHMutation.
```
In case when you stub global inside test Mocketry automatically recovers all global stubs when test completes\.

Also with Mocketry you can define expectations for set of objects\. For example you can stub message to **ANY object**:
```Smalltalk
Any stub width willReturn: 100.
    
mock := Mock new.
mock width should be: 100.
    
rect := 0@0 corner: 2@3.
rect stub. "#stub activates message intercection for real object. Without it following sentence will not work"
    
rect area should be: 300.
```
Or you can stub **ANY message** to particular object:
```Smalltalk
mock := Mock new.
    
mock stub anyMessage willreturn:: 100.
    
mock someMessage should be: 100.
mock someMessage2 should be: 100.
```
And both variants are supported:
```Smalltalk
Any stub anyMessage willReturn: 100.
    
mock := Mock new.
mock someMessage should be: 100.
    
rect := 0@0 corner: 2@3.
rect stub.
    
rect area should be: 100.
rect width should be: 100.
```
**Any** class is specific object spec which means "any" object\. You can uses any kind of specs:
```Smalltalk
(Kind of: Rectangle) stub width willReturn: 100.
    
rect := 0@0 corner: 2@3.
rect stub.
    
rect area should be: 300.
    
rect2 := 0@0 corner: 4@5.
rect2 stub.
    
rect2 area should be: 500
```
### Stub message sends with arguments
In place of message arguments you can use expected objects itself\. Or you can put specifications for expected arguments:
```Smalltalk
mock stub messageWith: arg1 and: arg2
mock stub messageWith: Any and: arg2
mock stub messageWith: [:arg | true]
mock stub messageWith: (Kind of: String) and: arg2
mock stub messageWith: (Instance of: Float) & (Satisfying for: [:arg | arg > 10]).
```
Last defined expectation has more priority than previous one\. It allows you to define default expectations in setUp method and override it in particular tests\. Following example shows it:
```Smalltalk
mock := Mock new.
(mock stub messageWith: (Instance of: SmallInteger)) willReturn: #anyInt.
(mock stub messageWith: (Kind of: String)) willReturn: #anyString.
(mock stub messageWith: 10) willReturn: #ten.
    
(mock messageWith: 10) should be: #ten.
(mock messageWith: 20) should be: #anyInt.
(mock messageWith: 'test' should be: #anyString
```
### Expected actions for stubs
There are different kind of expected actions:
```Smalltalk
mock := Mock new.
    
mock stub someMessage willReturn: #result.
mock someMessage should be: #result.
    
mock stub someMessage willRaise: ZeroDivide new.
[mock someMessage] should raise: ZeroDivide.
    
(mock stub someMessageWith: #arg) will: [#result].
(mock someMessageWith: #arg) should be: #result.
    
(mock stub someMessageWith: #arg1 and: #arg2) will: [:arg1 :arg2 | arg1, arg2].
(mock someMessageWith: #arg1 and: #arg2) should equal: 'arg1arg2'.
    
mock stub someMessage willReturnValueFrom: #(result1 result2).
mock someMessage should be: #result1.
mock someMessage should be: #result2
```
### Extra conditions on message sends
It is possible to verify arbitrary condition when expected message is going to be executed\. For example:
```Smalltalk
mock := Mock new.
mock stub someMessage
    when: [flag] is: (Kind of: Boolean);
    when: [flag] is: true;
    when: [ flag ] satisfy: [ :object | true or: [ false ] ].
    
flag := true.
mock someMessage. "not failes"
    
flag := false.
mock someMessage "will fail immediately on call by last condition: flag should be true"
    
flag := #flag.
mock someMessage "will fail immediately on call by first condition: flag should be boolean"
```
Also Mocketry implements process related condition to check that message was synchronously sent \(relative to test process\):
```Smalltalk
mock stub someMessage shouldBeSentInThisProcess.
[ mock someMessage ] fork. "will fail immediately on call".
    
mock stub someMessage shouldBeSentInAnotherProcess.
[ mock someMessage ] fork. "will not fail".
mock someMessage. "will fail immediately on call"
```
### Message sends usage rules
It is possible to specify how much times expectation can be used:
```Smalltalk
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
```
### Unexpected messages\. Automocks
Mock returns another special mock for unexpected messages \(when no expectation is defined for received message\):
```Smalltalk
mock := Mock new.
    
automock := mock someMessage.
    
automock should beInstanceOf: MockForMessageReturn.
```
And any message to this mock will produce another automock\.
It means that your tests will not fail if you will not define any expectation for your mocks\.
It allows you put only required detailes inside your tests which really make sense for tested aspect of functionality\. Anything else does not matters\.

Also to improve this idea automock try to play role of false in boolean expressions\.
```Smalltalk
mock := Mock new.
returnedMock := mock someMessage.
    
result := returnedMock ifFalse: [ #falseBranch ] ifTrue: [ #trueBranch ].
    
result should be: #falseBranch.
returnedMock should be: false
```
And play zero in arithmetic
```Smalltalk
mock := Mock new.
returnedMock := mock someMessage.
    
result := 1 + returnedMock.
result should equal: 1.
returnedMock should equal: 0
```
### Stub group of message sends
There is way to stub multiple message sends at once:
```Smalltalk
mock := Mock new.
rect := 0@0 corner: 2@3.
rect stub.
    
[ mock someMessage willReturn: 10.
rect width willReturn: 1000 ] should expect.
    
mock someMessage should be: 10.
rect area should be: 3000.
```
Inside "should expect" block you don't need to send **extra \#stub** message to objects

## Verify message sends

With Mocketry you can check that particular object received particular message\. Use **"should receive**" expression for this:
```Smalltalk
mock := Mock new.
    
mock someMessage.
    
mock should receive someMessage.
mock should not receive anotherMessage
```
You can verify that message was send to real objects\. It is not only about mocks:
```Smalltalk
rect := 0@0 corner: 2@3.
    
rect stub "it should be here to enable message interception"
rect area
    
rect should receive width. "area = width * height"
```
And you can do this with globals too:
```Smalltalk
DateAndTime stub.
DateAndTime midnight.
    
DateAndTime should receive now. "inside midnight #now is called"
```
But you should be carefull with globals\. Look at section [¿?](#stubMessageSends)\.

Also with Mocketry you can verify that message was sent to set of objects\.
For example you can verify that message was sent to **ANY object**:
```Smalltalk
mock := Mock new.
rect := 0@0 corner: 2@3.
rect stub.
    
mock width.
rect area.
    
Any should receive width. "it will check that mock and rect received message #width"
Any should receive area "it will fail because mock not received #area message".
```
Also you can verify that **ANY message** was sent to particular object:
```Smalltalk
mock := Mock new.
    
mock someMessage should be: 100.
    
mock should receive anyMessage.
```
And both variants are supported:
```Smalltalk
mock := Mock new.
rect := 0@0 corner: 2@3.
rect stub.
    
mock someMessage.
    
Any should receive anyMessage. "will fail because rect not received any message".
    
rect width.
    
Any should receive anyMessage. "will not fail because both objects received at least one message"
```
**Any** class is specific object spec which means "any" object\. You can uses any kind of specs to verify message send for set of objects:
```Smalltalk
rect := 0@0 corner: 2@3.
rect stub.
    
rect area.
    
rect2 := 0@0 corner: 4@5.
rect2 width.
    
(Kind of: Rectangle) should receive width. "will not fail because both rect's received message #width"
(Kind of: Rectangle) should receive area "will fail because rect2 not received message #area"
    
mock := Mock new.
(Kind of: Rectangle) should receive width. "will not fail because mock is not kind of Rectangle"
```
### Verify message sends with arguments

In place of message arguments you can use expected objects itself\. Or you can put specifications for expected arguments:
```Smalltalk
mock := Mock new.
    
(mock messageWith: 10) should be: #ten.
(mock messageWith: 'test' should be: #anyString.
    
mock should receive messageWith: 10.
mock should receive messageWith: (Instance of: SmallInteger).
mock should receive messageWith: 'test'.
mock should receive messageWith: (Kind of: String).
mock should receive messageWith: [:arg | arg isNumber].
```
### Capture message arguments
Mocketry provides suitable tool to capture arguments of messages for subsequent verification:
```Smalltalk
mock := Mock new.
mock someMessageWith: Arg argName.
    
mock someMessageWith: #argValue.
    
Arg argName should be: #argValue.
```
As argument spec capture plays role of any object\. So it not restricts message send expectation\. Capture will store all received argument values\. To verify concrete argument use message \#fromCall:
```Smalltalk
Arg argName fromFirstCall should be: #value1.
Arg argName fromLastCall should be: #value3.
(Arg argName fromCall: 2) should be: #value2.
```
Short version:
```Smalltalk
Arg argName should be: #argValue.
```
will signal error if there are multiple different captured values\.

Also "should" expression on capture will verify that owner message send was occurred required number of times\.

When argument is captured it value is stubbed\. It allows you to verify subsequent message sends to captured arguments:
```Smalltalk
mock stub someMessageWith: Arg rectangle.
    
rect := 0@0 corner: 2@3.
mock someMessageWith: rect.
rect area.
    
Arg rectangle should be: rect.
Arg rectangle should receive width.
```
### Verify message sends count

Mocketry allows to verify how many times object received particular message:
```Smalltalk
mock := Mock new.
    
mock someMessage.
mock should receive someMessage once.
    
mock someMessage.
mock should receive someMessage twice.
    
mock someMessage.
mock should receive someMessage exactly: 3.
mock should receive someMessage atLeast: 2.
mock should receive someMessage atMost: 3.
mock should receive someMessage atLeast: 1 atMost: 5.
```
Same works to verify that set of objects received particular message expected number of times:
```Smalltalk
mock := Mock new.
mock2 := Mock new.
    
mock someMessage; someMessage.
mock2 someMessage.
    
Any should receive someMessage twice. "will fail because mock2 received #someMessage only once"
    
mock2 someMessage.
Any should receive someMessage twice. "will not fail because both mocks received #someMessage twice"
```
### Verify message send result
There are two ways how to verify result of occurred message:

First you can continue "should receive" expression with "which should" clause to validate actual returned value:
```Smalltalk
rect := 0@0 corner: 2@3.
rect stub.
    
rect area.
    
rect should receive area which should equal: 6.
rect should receive width which should beKindOf: Number
```
And you can validate sender message of any object:
```Smalltalk
mock := Mock new.
    
result := mock someMessage.
    
result should beReturnedFrom: [ mock someMessage ].
```
### Verify group of message sends
There is way to verify group of message sends at once:
```Smalltalk
mock := Mock new.
rect := 0@0 corner: 2@3.
rect stub.
    
mock someMessage.
rect area.
    
[ rect width.
mock someMessage ] should beDone.
    
[ mock someMessage.
rect width ] should beDoneInOrder.
```
**\#beDone** don't care about order of message sends\.

**\#beDoneInOrder** verifies that messages were set in same order as they defined inside given block

### Verify all expectations
There is way how to verify that all defined expectations were occurred:
```Smalltalk
mock1 := Mock new.
mock2 := Mock new.
    
[mock1 someMessage. mock2 someMessage2]
    should lenient satisfy:
[ mock2 someMessage2.
mock1 someMessage willReturn: 'some'].
```
**\#lenient** means that we don't care about order in which expected messages were happened\.
```Smalltalk
mock1 := Mock new.
mock2 := Mock new.
    
[mock1 someMessage. mock2 someMessage2]
    should strictly satisfy:
[ mock1 someMessage willReturn: 'some'.
mock2 someMessage2].
```
**\#strictly** means that we want expected messages were happened in same order in which they were defined\.
