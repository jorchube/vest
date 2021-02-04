using Gee;

namespace io.github.jorchube.vest
{
    public class Suite : Object
    {
        public delegate void SetupDelegate();
        public delegate void TeardownDelegate();

        public TestSuiteResult result { get; private set; }

        private string _name;
        public string name
        {
            get { return _name; }
            set { setName(value); }
        }

        public bool hasBeenRun
        {
            get { return !result.testCaseResults.is_empty; }
            private set {}
        }

        public bool hasFailedTests
        {
            get { return result.failedTests() > 0; }
            private set {}
        }

        private LinkedList<TestCaseDescriptor> TestCaseDescriptors;

        public Suite()
        {
            result = new TestSuiteResult();
            this.name = this.get_type().name();
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

        private void setName(string name)
        {
            _name = name;
            result.suiteName = name;
        }
    }
}