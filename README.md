# UnitTest
Example of unit tests in iOS development. 

Test driven development:


func setUp() {} before every test in class.
func tearDown() {} after every test in class.
func testExample() {} normal test.
func testPerformanceExample() {} test the performance. Code inside of self.measure closure runs 10 times to calculate performance.

Test code should be fail at first time, to check is our test works or not.

Red - our test should fail at first for making sure that test works
Green - make test success result
Refactor - always think about make your code clear and clean after making some feature. After refactoring make one more loop.

You can run test for: 
-Only one test
-Group of test(Edit scheme, test)
-All test(Command-U)

Ctrl + Command + Option + G - run last test

It is a good idea to use speaking test method names. It's quite common to use a pattern such as test_<method name>_<precondition>_<expected behavior>. 


Fake objects
Every test should test only one micro feature. We should isolate one specific module from another. To isolate modules from each other, we can use a concept called fake objects.

The most important fake objects are mocks, stubs, and fakes. 

Mocks: They act as recorders. They register whether the system under a test calls the expected methods of another instance with expected arguments. For example, if we have class A that should call method b() of class B, when something happens, we would create a mock for B that sets a Boolean value to true in case b() is called. In the test, we use this Boolean value to assert whether b() has been called. 

Returns true if function is called.


Stubs: These are used when we need defined return values from a method. In a test, it is often useful to have a fixed hardcoded return value for a method that the system under the test calls. The test then asserts that the system under test reacts in an expected way to the defined return value. This makes it easy to test many different scenarios without complicated setups. 

Returns expected value from function.


Fakes: They act as stand-ins for real objects that a system under test communicates with. They are needed to make the code compile, but they are not needed to assert that something expected has happened. Fakes are often used when they are easier to set up than the real objects, or when we need to make sure that the test is independent of the implementation of the real object. 

