using Gee;

namespace io.github.jorchube.vest
{
    public delegate void TestCaseDelegate() throws assertionError;
    
    public class Vest
    {
        static LinkedList<Suite> suites;

        public static void init()
        {
            Vest.suites = new LinkedList<Suite>();
        }

        public static void addSuite(Suite suite)
        {
            suites.add(suite);
        }

        public static void run()
        {
            foreach (Suite suite in suites)
            {
                runSuite(suite);
            }

            foreach (Suite suite in suites)
            {
                presentSuiteResult(suite);
            }
        }

        private static void runSuite(Suite suite)
        {
            suite.init();

            suite.run();
        }


        // FIXME: Extract all below to a presenter/formatter class
        private static void presentSuiteResult(Suite suite)
        {
            stdout.printf("Test Suite: %s\n", suite.name);
            foreach(string key in suite.result.testCaseResultMap.keys)
            {
                TestCaseResult res = suite.result.testCaseResultMap.get(key);
                presentTestCaseResult(res);
            }
            stdout.printf("%d PASSED %d FAILED %d IGNORED\n", suite.passedTests(), suite.failedTests(), 0);
            stdout.printf("------------------------------\n");
        }

        private static void presentTestCaseResult(TestCaseResult res)
        {
            if (res.state == TestCaseState.FAILED)
            {
                stdout.printf("  ✘ %s : FAILED : %s\n", res.name, res.info);
            }
            else
            {
                stdout.printf("  ✔ %s : PASSED\n", res.name);
            }
        }
    }
}