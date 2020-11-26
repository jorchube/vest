using Gee;

namespace io.github.jorchube.vest
{
    public class TestSuiteResult
    {
        public string suiteName { get; private set; }
        public HashMap <string, TestCaseResult> testCaseResultMap { get; private set; }

        public TestSuiteResult()
        {
            testCaseResultMap = new HashMap <string, TestCaseResult>();
        }
    }
}