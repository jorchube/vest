using io.github.jorchube.vest;

namespace io.github.jorchube.vest.test
{
    public class MethodMockTest : Suite
    {
        public override void testCases ()
        {
            test("It returns method number of calls", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                Assert.equals(0, stub.aVoidArglessMethodMock.numCalls());

                stub.aVoidArglessMethod();
                Assert.equals(1, stub.aVoidArglessMethodMock.numCalls());

                stub.aVoidArglessMethod();
                Assert.equals(2, stub.aVoidArglessMethodMock.numCalls());
            });

            test("It returns true if call has been made with given argument", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aVoidMethod(3);

                Assert.equals(1, stub.aVoidMethodMock.numCalls());
                Assert.false(stub.aVoidMethodMock.calledWith(2));
                Assert.true(stub.aVoidMethodMock.calledWith(3));
            });

            test("It returns the given return value", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.anArglessMethodMock.returns("to return");

                string ret = stub.anArglessMethod();

                Assert.equals(1, stub.anArglessMethodMock.numCalls());
                Assert.equals("to return", ret);
            });

            test("It returns the given return values in the same order as set up", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.anArglessMethodMock.returns("to return first");
                stub.anArglessMethodMock.returns("to return second");
                stub.anArglessMethodMock.returns("to return last");

                Assert.equals("to return first", stub.anArglessMethod());
                Assert.equals("to return second", stub.anArglessMethod());
                Assert.equals("to return last", stub.anArglessMethod());
                Assert.equals(3, stub.anArglessMethodMock.numCalls());
            });

            test("It returns null if no more return values have been set up", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.anArglessMethodMock.returns("to return");

                Assert.equals("to return", stub.anArglessMethod());
                Assert.null((Object)stub.anArglessMethod());
                Assert.equals(2, stub.anArglessMethodMock.numCalls());
            });

            test("It returns the given value for the given argument or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock.returns(1, "one");
                stub.aMethodMock.returns(2, "two");

                Assert.equals("one", stub.aMethod(1));
                Assert.equals("two", stub.aMethod(2));
                Assert.null((Object)stub.aMethod(3));
                Assert.equals(3, stub.aMethodMock.numCalls());

                Assert.true(stub.aMethodMock.calledWith(1));
                Assert.true(stub.aMethodMock.calledWith(2));
                Assert.true(stub.aMethodMock.calledWith(3));
                Assert.false(stub.aMethodMock.calledWith(4));
            });

            test("It returns the given value for the given 1 argument or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock1.returns(1, "one");
                stub.aMethodMock1.returns(2, "two");

                Assert.equals("one", stub.aMethod1(1));
                Assert.equals("two", stub.aMethod1(2));
                Assert.null((Object)stub.aMethod1(3));
                Assert.equals(3, stub.aMethodMock1.numCalls());

                Assert.true(stub.aMethodMock1.calledWith(1));
                Assert.true(stub.aMethodMock1.calledWith(2));
                Assert.true(stub.aMethodMock1.calledWith(3));
                Assert.false(stub.aMethodMock1.calledWith(4));
            });

            //  test("It returns the given value for the given 2 arguments or null otherwise", () =>
            //  {
            //      AnInterfaceStub stub = new AnInterfaceStub();

            //      stub.aMethodMock2.returns(1, 2, "one");
            //      stub.aMethodMock2.returns(2, 1, "two");

            //      Assert.equals("one", stub.aMethod2(1, 2));
            //      Assert.equals("two", stub.aMethod2(2, 1));
            //      Assert.null((Object)stub.aMethod2(3, 2));
            //      Assert.equals(3, stub.aMethodMock2.numCalls());

            //      Assert.true(stub.aMethodMock2.calledWith(1, 2));
            //      Assert.true(stub.aMethodMock2.calledWith(2, 1));
            //      Assert.true(stub.aMethodMock2.calledWith(3, 2));
            //      Assert.false(stub.aMethodMock2.calledWith(4, 5));
            //  });
        }
    }

    public class AnInterfaceStub : Object
    {
        public VoidArglessMethodMock aVoidArglessMethodMock;
        public VoidMethodMock<int> aVoidMethodMock;
        public ArglessMethod<string> anArglessMethodMock;
        public MethodMock<int, string> aMethodMock;
        public MethodMock1<int, string> aMethodMock1;
        //  public MethodMock2<int, int, string> aMethodMock2;

        public AnInterfaceStub()
        {
            aVoidArglessMethodMock = new VoidArglessMethodMock();
            aVoidMethodMock = new VoidMethodMock<int>();
            anArglessMethodMock = new ArglessMethod<string>();
            aMethodMock = new MethodMock<int, string>();
            aMethodMock1 = new MethodMock1<int, string>();
            //  aMethodMock2 = new MethodMock2<int, int, string>();
        }

        public void aVoidArglessMethod()
        {
            aVoidArglessMethodMock.call();
        }

        public void aVoidMethod(int arg)
        {
            aVoidMethodMock.call(arg);
        }

        public string anArglessMethod()
        {
            return anArglessMethodMock.call();
        }

        public string aMethod(int arg)
        {
            return aMethodMock.call(arg);
        }

        public string aMethod1(int arg)
        {
            return aMethodMock1.call(arg);
        }

        //  public string aMethod2(int arg1, int arg2)
        //  {
        //      return aMethodMock2.call(arg1, arg2);
        //  }
    }
}