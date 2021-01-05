using Gee;

namespace io.github.jorchube.vest
{
    public class Suite : Object
    {
        public string name { get; set; }
        public TestSuiteResult result { get; private set; }
        public bool hasBeenRun
        {
            get { return !result.testCaseResultMap.is_empty; }
            private set {}
        }
        public bool hasFailedTests
        {
            get { return failedTests() > 0; }
            private set {}
        }

        private HashMap<string, TestCaseDescriptor> TestCaseDescriptorMap;

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
            TestCaseDescriptorMap = new HashMap<string, TestCaseDescriptor>();

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
            TestCaseDescriptorMap.set(name, new TestCaseDescriptor(name, testCase));
        }

        public void run()
        {
            foreach(string key in TestCaseDescriptorMap.keys)
            {
                TestCaseDescriptor descriptor = TestCaseDescriptorMap.get(key);
                runTestCase(descriptor);
            }
        }

        public string resultSummary()
        {
            return "%d PASSED %d FAILED %d IGNORED".printf(passedTests(), failedTests(), 0);
        }

        public int passedTests()
        {
            return result.testCaseResultMap.fold<int>( (entry, count) => { return entry.value.state == TestCaseState.PASSED ? count+1 : count; }, 0);
        }

        public int failedTests()
        {
            return result.testCaseResultMap.fold<int>( (entry, count) => { return entry.value.state == TestCaseState.FAILED ? count+1 : count; }, 0);
        }

        private void runTestCase(TestCaseDescriptor descriptor)
        {
            setUp();
            
            try
            {
                descriptor.testCase();
            }
            catch (Error e)
            {
                testCaseFailed(descriptor, e.message);
                return;
            }

            tearDown();

            testCasePassed(descriptor);
        }

        private void testCaseFailed(TestCaseDescriptor descriptor, string info)
        {
            TestCaseResult res = new TestCaseResult(descriptor.name, TestCaseState.FAILED, info);
            result.testCaseResultMap.set(descriptor.name, res);
        }

        private void testCasePassed(TestCaseDescriptor descriptor)
        {
            TestCaseResult res = new TestCaseResult(descriptor.name, TestCaseState.PASSED);
            result.testCaseResultMap.set(descriptor.name, res);
        }

        private void exitWithError(string message)
        {
            stdout.printf(message);
            
            Process.exit(-1);
        }
    }
}