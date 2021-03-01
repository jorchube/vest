using io.github.jorchube.vest;

namespace io.github.jorchube.vest.test
{
    public class SuiteTest : TestSuite
    {
        private bool setupCalled = false;

        public override void setUp ()
        {
            setupCalled = true;
        }

        public override void testCases ()
        {
            test("It calls the suite setup method", () =>
            {
                Assert.true(setupCalled);
            });

            test("It calls the suite teardown method", () =>
            {
                SuiteWithTeardown teardownSuite = new SuiteWithTeardown();

                teardownSuite.init();
                teardownSuite.run();

                Assert.true(teardownSuite.teardownCalled);
            });
        }
    }

    class SuiteWithTeardown : TestSuite
    {
        public bool teardownCalled { get; private set; }

        public override void setUp()
        {
            teardownCalled = false;
        }

        public override void tearDown()
        {
            teardownCalled = true;
        }
        public override void testCases ()
        {
            test("a test to force a teardown call", ()=>
            {
            });
        }
    }
}