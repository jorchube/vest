namespace io.github.jorchube.vest
{
    public class ConsolePresenter : IPresenter, Object
    {
        public class Ansi : Object
        {
            public const string BOLD_RED = "\x1b[31;1m";
            public const string BOLD_GREEN = "\x1b[32;1m";
            public const string BOLD_BLUE = "\x1b[34;1m";
            public const string RESET = "\x1b[0m";
        }

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
                stdout.printf("Test Suite: %s%s%s\n", Ansi.BOLD_BLUE, suite.name, Ansi.RESET);
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
                stdout.printf("  %s✘%s %s : %sFAILED%s : %s\n", Ansi.BOLD_RED, Ansi.RESET, res.name, Ansi.BOLD_RED, Ansi.RESET, res.info);
            }
            else
            {
                stdout.printf("  %s✔%s %s : %sPASSED%s (%0.3f ms)\n", Ansi.BOLD_GREEN, Ansi.RESET, res.name, Ansi.BOLD_GREEN, Ansi.RESET, res.elapsedMilliseconds);
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
                stdout.printf("  ✔ %s : PASSED (%0.3f ms)\n", res.name, res.elapsedMilliseconds);
            }
        }
    }

}