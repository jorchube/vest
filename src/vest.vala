using Gee;

namespace io.github.jorchube.vest
{
    public delegate void TestCaseDelegate() throws assertionError;
    
    public class Vest
    {
        static LinkedList<Suite> suites;
        static LinkedList<IPresenter> presenters;

        public static void init()
        {
            Vest.suites = new LinkedList<Suite>();
            Vest.presenters = new LinkedList<IPresenter>();

            addDefaultPresenter();
        }

        public static void addSuite(Suite suite, string? customName = null)
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
            foreach (Suite suite in suites)
            {
                runSuite(suite);
            }
        }

        private static void presentSuitesResults()
        {
            foreach (IPresenter presenter in presenters)
            {
                presenter.present(suites);
            }
        }

        private static void addDefaultPresenter()
        {
            presenters.add(new ConsolePresenter());
        }

        private static void runSuite(Suite suite)
        {
            suite.init();

            suite.run();
        }

        private static void exitWithStatusCode()
        {
            foreach (Suite suite in suites)
            {
                if (!suite.hasBeenRun || suite.hasFailedTests)
                {
                    Process.exit(-1);
                }
            }
        }
    }
}