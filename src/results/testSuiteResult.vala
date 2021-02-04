using Gee;

namespace io.github.jorchube.vest
{
    public class TestSuiteResult
    {
        public string suiteName { get; set; }
        public LinkedList <TestCaseResult> testCaseResults { get; private set; }

        public TestSuiteResult()
        {
            testCaseResults = new LinkedList <TestCaseResult>();
        }

        public int passedTests()
        {
            return testCaseResults.fold<int>( (entry, count) => { return entry.state == TestCaseState.PASSED ? count+1 : count; }, 0);
        }

        public int failedTests()
        {
            return testCaseResults.fold<int>( (entry, count) => { return entry.state == TestCaseState.FAILED ? count+1 : count; }, 0);
        }
    }
}