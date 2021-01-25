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

            test("It returns the given value for the given 1 int argument or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock1Int.returns(1, "one");
                stub.aMethodMock1Int.returns(2, "two");

                Assert.equals("one", stub.aMethod1Int(1));
                Assert.equals("two", stub.aMethod1Int(2));
                Assert.null((Object)stub.aMethod1Int(3));
                Assert.equals(3, stub.aMethodMock1Int.numCalls());

                Assert.true(stub.aMethodMock1Int.calledWith(1));
                Assert.true(stub.aMethodMock1Int.calledWith(2));
                Assert.true(stub.aMethodMock1Int.calledWith(3));
                Assert.false(stub.aMethodMock1Int.calledWith(4));
            });

            test("It returns the given value for the given 1 string argument or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock1String.returns("one", 1);
                stub.aMethodMock1String.returns("two", 2);

                Assert.equals(1, stub.aMethod1String("one"));
                Assert.equals(2, stub.aMethod1String("two"));
                Assert.null((Object)stub.aMethod1String("three"));
                Assert.equals(3, stub.aMethodMock1String.numCalls());

                Assert.true(stub.aMethodMock1String.calledWith("one"));
                Assert.true(stub.aMethodMock1String.calledWith("two"));
                Assert.true(stub.aMethodMock1String.calledWith("three"));
                Assert.false(stub.aMethodMock1String.calledWith("four"));
            });

            test("It returns the given value for the given 1 object argument or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock1Object.returns(new AnObject(1), "one");
                stub.aMethodMock1Object.returns(new AnObject(2), "two");

                Assert.equals("one", stub.aMethod1Object(new AnObject(1)));
                Assert.equals("two", stub.aMethod1Object(new AnObject(2)));
                Assert.null((Object)stub.aMethod1Object(new AnObject(3)));
                Assert.equals(3, stub.aMethodMock1Object.numCalls());

                Assert.true(stub.aMethodMock1Object.calledWith(new AnObject(1)));
                Assert.true(stub.aMethodMock1Object.calledWith(new AnObject(2)));
                Assert.true(stub.aMethodMock1Object.calledWith(new AnObject(3)));
                Assert.false(stub.aMethodMock1Object.calledWith(new AnObject(4)));
            });

            test("It returns the given value for the given 2 arguments or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock2.returns(1, 2.2, "one");
                stub.aMethodMock2.returns(2, 1.1, "two");

                Assert.equals("one", stub.aMethod2(1, 2.2));
                Assert.equals("two", stub.aMethod2(2, 1.1));
                Assert.null((Object)stub.aMethod2(1, 2.1));
                Assert.equals(3, stub.aMethodMock2.numCalls());

                Assert.true(stub.aMethodMock2.calledWith(1, 2.2));
                Assert.true(stub.aMethodMock2.calledWith(2, 1.1));
                Assert.true(stub.aMethodMock2.calledWith(1, 2.1));
                Assert.false(stub.aMethodMock2.calledWith(4, 5.0));
            });

            test("It returns true if a call has been done with the given 9 (LOL 9) arguments", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aVoidMethod9(1, AnEnum.A, true, 'c', 123, 0.99, "aaa", new AnObject(999), 0);
                stub.aVoidMethod9(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 0);

                Assert.equals(2, stub.aVoidMethodMock9.numCalls());

                Assert.true(stub.aVoidMethodMock9.calledWith(1, AnEnum.A, true, 'c', 123, 0.99, "aaa", new AnObject(999), 0));
                Assert.true(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));

                Assert.false(stub.aVoidMethodMock9.calledWith(0, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.A, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, true, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'd', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'c', 124, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.98, "aba", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "abc", new AnObject(333), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(334), 0));
                Assert.false(stub.aVoidMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 1));
            });

            test("It returns the given value for the given 9 (LOL 9) arguments or null otherwise", () =>
            {
                AnInterfaceStub stub = new AnInterfaceStub();

                stub.aMethodMock9.returns(1, AnEnum.A, true, 'c', 123, 0.99, "aaa", new AnObject(999), 0, "a return");
                stub.aMethodMock9.returns(1, AnEnum.B, false, 'c', 123, 0.99, "aaa", new AnObject(333), 0, "another return");

                Assert.equals("a return", stub.aMethod9(1, AnEnum.A, true, 'c', 123, 0.99, "aaa", new AnObject(999), 0));
                Assert.equals("another return", stub.aMethod9(1, AnEnum.B, false, 'c', 123, 0.99, "aaa", new AnObject(333), 0));
                Assert.null((Object)stub.aMethod9(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.equals(3, stub.aMethodMock9.numCalls());

                Assert.true(stub.aMethodMock9.calledWith(1, AnEnum.A, true, 'c', 123, 0.99, "aaa", new AnObject(999), 0));
                Assert.true(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aaa", new AnObject(333), 0));
                Assert.true(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));

                Assert.false(stub.aMethodMock9.calledWith(0, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.A, false, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, true, 'c', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'd', 123, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 124, 0.99, "aba", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.98, "aba", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "abc", new AnObject(333), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(334), 0));
                Assert.false(stub.aMethodMock9.calledWith(1, AnEnum.B, false, 'c', 123, 0.99, "aba", new AnObject(333), 1));
            });
        }
    }

    public class AnInterfaceStub : Object
    {
        public VoidArglessMethodMock aVoidArglessMethodMock;
        public VoidMethodMock<int> aVoidMethodMock;
        public ArglessMethod<string> anArglessMethodMock;
        public MethodMock<int, string> aMethodMock;
        public MethodMock1<int, string> aMethodMock1Int;
        public MethodMock1<string, int> aMethodMock1String;
        public MethodMock1<AnObject, string> aMethodMock1Object;
        public MethodMock2<long, double?, string> aMethodMock2;
        public VoidMethodMock9<int, AnEnum, bool, char, long, double?, string, AnObject, int> aVoidMethodMock9;
        public MethodMock9<int, AnEnum, bool, char, long, double?, string, AnObject, int, string> aMethodMock9;

        public AnInterfaceStub()
        {
            aVoidArglessMethodMock = new VoidArglessMethodMock();
            aVoidMethodMock = new VoidMethodMock<int>();
            anArglessMethodMock = new ArglessMethod<string>();
            aMethodMock = new MethodMock<int, string>();
            aMethodMock1Int = new MethodMock1<int, string>();
            aMethodMock1String = new MethodMock1<string, int>();
            aMethodMock1Object = new MethodMock1<AnObject, string>();
            aMethodMock2 = new MethodMock2<long, double?, string>();
            aVoidMethodMock9 = new VoidMethodMock9<int, AnEnum, bool, char, long, double, string, AnObject, int>();
            aMethodMock9 = new MethodMock9<int, AnEnum, bool, char, long, double, string, AnObject, int, string>();
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

        public string aMethod1Int(int arg)
        {
            return aMethodMock1Int.call(arg);
        }

        public int aMethod1String(string arg)
        {
            return aMethodMock1String.call(arg);
        }

        public string aMethod1Object(AnObject arg)
        {
            return aMethodMock1Object.call(arg);
        }

        public string aMethod2(long arg1, double arg2)
        {
            return aMethodMock2.call(arg1, arg2);
        }

        public void aVoidMethod9(int arg1, AnEnum arg2, bool arg3, char arg4, long arg5, double arg6, string arg7, AnObject arg8, int arg9)
        {
            aVoidMethodMock9.call(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
        }

        public string aMethod9(int arg1, AnEnum arg2, bool arg3, char arg4, long arg5, double arg6, string arg7, AnObject arg8, int arg9)
        {
            return aMethodMock9.call(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
        }
    }

    public enum AnEnum
    {
        A,
        B
    }

    public class AnObject : Object
    {
        public int a {get; private set;}

        public AnObject(int a)
        {
            this.a = a;
        }

        public string to_string()
        {
            return "AnObject(%d)".printf(a);
        }
    }
}