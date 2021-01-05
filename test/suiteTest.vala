using io.github.jorchube.vest;

namespace io.github.jorchube.vest.test
{
    class SuiteTest : Suite
    {
        private bool setupCalled = false;

        public override void setUp ()
        {
            setupCalled = true;
        }

        public override void testCases ()
        {
            test("Should call custom setup", () =>
            {
                Assert.true(setupCalled);
            });
            
            test("Should call custom teardown", () =>
            {
                SuiteWithTeardown teardownSuite = new SuiteWithTeardown();

                teardownSuite.init();
                teardownSuite.run();

                Assert.true(teardownSuite.teardownCalled);
            });
        }
    }

    class SuiteWithTeardown : Suite
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