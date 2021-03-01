using Gee;

namespace io.github.jorchube.vest
{
    public delegate void TestCaseDelegate() throws assertionError;

    public class Vest
    {
        static LinkedList<TestSuite> suites;
        static LinkedList<IPresenter> presenters;

        public static void init()
        {
            Vest.suites = new LinkedList<TestSuite>();
            Vest.presenters = new LinkedList<IPresenter>();

            addConsolePresenter();
            addXunitPresenter();
        }

        public static void addSuite(TestSuite suite, string? customName = null)
        {
            if (customName != null)
            {
                suite.name = customName;
            }

            suites.add(suite);
        }

        public static void run()
        {
            runSuites();

            presentSuitesResults();

            exitWithStatusCode();
        }

        private static void runSuites()
        {
            foreach (TestSuite suite in suites)
            {
                runSuite(suite);
            }
        }

        private static void presentSuitesResults()
        {
            Collection<TestSuiteResult> results = new LinkedList<TestSuiteResult>();
            results.add_all_iterator(suites.map<TestSuiteResult>(s => s.result));

            foreach (IPresenter presenter in presenters)
            {
                presenter.present(results);
            }
        }

        private static void addConsolePresenter()
        {
            presenters.add(new ConsolePresenter());
        }

        private static void addXunitPresenter()
        {
            XunitPresenter presenter = new XunitPresenter(new FileSystemWrapper());
            presenters.add(presenter);
        }

        private static void runSuite(TestSuite suite)
        {
            suite.init();

            suite.run();
        }

        private static void exitWithStatusCode()
        {
            bool failure = false;

            foreach (TestSuite suite in suites)
            {
                if (!suite.hasBeenRun)
                {
                    stderr.printf("Suite %s has not run any test\n", suite.name);
                    failure = true;
                }

                if (suite.hasFailedTests)
                {
                    stderr.printf("Suite %s has failed tests\n", suite.name);
                    failure = true;
                }
            }

            if (failure)
            {
                Process.exit(1);
            }
        }
    }
}