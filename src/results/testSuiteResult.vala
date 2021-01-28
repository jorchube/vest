using Gee;

namespace io.github.jorchube.vest
{
    public class TestSuiteResult
    {
        public string suiteName { get; private set; }
        public LinkedList <TestCaseResult> testCaseResults { get; private set; }

        public TestSuiteResult()
        {
            testCaseResults = new LinkedList <TestCaseResult>();
        }
    }
}