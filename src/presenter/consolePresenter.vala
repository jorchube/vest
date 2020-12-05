namespace io.github.jorchube.vest
{
    public class ConsolePresenter : IPresenter, Object
    {
        private const string COLOR_RED = "\x1b[31m";
        private const string COLOR_GREEN = "\x1b[32m";
        private const string COLOR_BLUE = "\x1b[34m";
        private const string COLOR_BOLD = "\x1b[1m";
        private const string COLOR_RESET = "\x1b[0m";

        private const int STDOUT = 1;

        public void present(Gee.List<Suite> suites)
        {
            foreach (Suite suite in suites)
            {
                presentSuiteResult(suite);
            }
        }

        private static void presentSuiteResult(Suite suite)
        {
            presentTestSuiteName(suite);
            foreach(string key in suite.result.testCaseResultMap.keys)
            {
                TestCaseResult res = suite.result.testCaseResultMap.get(key);
                presentTestCaseResult(res);
            }
            stdout.printf("%d PASSED %d FAILED %d IGNORED\n", suite.passedTests(), suite.failedTests(), 0);
            stdout.printf("------------------------------\n");
        }

        private static void presentTestSuiteName(Suite suite)
        {
            if (Posix.isatty(STDOUT))
            {
                stdout.printf("Test Suite: %s%s%s%s\n", COLOR_BOLD, COLOR_BLUE, suite.name, COLOR_RESET);
            }
            else
            {
                stdout.printf("Test Suite: %s\n", suite.name);
            }
        }

        private static void presentTestCaseResult(TestCaseResult res)
        {
            if (Posix.isatty(STDOUT))
            {
                presentTestCaseResultColored(res);
            }
            else
            {
                presentTestCaseResultNoColor(res);
            }
        }

        private static void presentTestCaseResultColored(TestCaseResult res)
        {
            if (res.state == TestCaseState.FAILED)
            {
                stdout.printf("  %s✘%s %s : FAILED : %s\n", COLOR_RED, COLOR_RESET, res.name, res.info);
            }
            else
            {
                stdout.printf("  %s✔%s %s : PASSED\n", COLOR_GREEN, COLOR_RESET, res.name);
            }
        }

        private static void presentTestCaseResultNoColor(TestCaseResult res)
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