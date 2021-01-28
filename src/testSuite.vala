using Gee;

namespace io.github.jorchube.vest
{
    public class Suite : Object
    {
        public delegate void SetupDelegate();
        public delegate void TeardownDelegate();

        public string name { get; set; }
        public TestSuiteResult result { get; private set; }
        public bool hasBeenRun
        {
            get { return !result.testCaseResults.is_empty; }
            private set {}
        }
        public bool hasFailedTests
        {
            get { return failedTests() > 0; }
            private set {}
        }

        private LinkedList<TestCaseDescriptor> TestCaseDescriptors;

        public Suite()
        {
            this.name = this.get_type().name();
            result = new TestSuiteResult();
            hasBeenRun = false;
            hasFailedTests = false;
        }

        public virtual void setUp()
        {

        }

        public virtual void testCases() throws testlibError, assertionError
        {
            throw new testlibError.NotImplemented("Implement this function to call registerTestCase() for each suite test case");
        }

        public virtual void tearDown()
        {

        }

        public void init()
        {
            TestCaseDescriptors = new LinkedList<TestCaseDescriptor>();

            try
            {
                testCases();
            }
            catch (Error e)
            {
                exitWithError("Error parsing test cases: %s".printf(e.message));
            }

        }

        public void test(string name, TestCaseDelegate testCase)
        {
            TestCaseDescriptors.add(new TestCaseDescriptor(name, testCase));
        }

        public void run()
        {
            foreach(TestCaseDescriptor descriptor in TestCaseDescriptors)
            {
                runTestCase(descriptor);
            }
        }

        public int passedTests()
        {
            return result.testCaseResults.fold<int>( (entry, count) => { return entry.state == TestCaseState.PASSED ? count+1 : count; }, 0);
        }

        public int failedTests()
        {
            return result.testCaseResults.fold<int>( (entry, count) => { return entry.state == TestCaseState.FAILED ? count+1 : count; }, 0);
        }

        private void runTestCase(TestCaseDescriptor descriptor)
        {
            TestCaseResult caseResult = TestCaseRunner.run(descriptor, setUp, tearDown);

            result.testCaseResults.add(caseResult);
        }

        private void exitWithError(string message)
        {
            stdout.printf(message);

            Process.exit(-1);
        }
    }
}