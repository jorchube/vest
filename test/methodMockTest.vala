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

            test("It returns the given return value", () =>
            {
                Assert.true(false);
            });

            test("It returns true if call has been made with given argument", () =>
            {
                Assert.true(false);
            });
        }
    }

    public interface AnInterface : Object
    {
        public abstract void aVoidArglessMethod();
    }

    public class AnInterfaceStub : AnInterface, Object
    {
        public VoidArglessMethodMock aVoidArglessMethodMock;

        public AnInterfaceStub()
        {
            aVoidArglessMethodMock = new VoidArglessMethodMock();
        }

        public void aVoidArglessMethod()
        {
            aVoidArglessMethodMock.call();
        }
    }
}