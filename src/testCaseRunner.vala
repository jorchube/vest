namespace io.github.jorchube.vest
{
    public class TestCaseRunner : Object
    {
        public static TestCaseResult run(TestCaseDescriptor caseDescriptor, Suite.SetupDelegate setup, Suite.TeardownDelegate teardown)
        {
            TestCaseResult result;

            setup();

            result = runTestCase(caseDescriptor);

            teardown();

            return result;

        }

        private static TestCaseResult runTestCase(TestCaseDescriptor caseDescriptor)
        {
            try
            {
                double milliseconds = TestCaseRunner.runTestCaseMeasured(caseDescriptor);
                return testCasePassed(caseDescriptor, milliseconds);
            }
            catch (Error e)
            {
                return testCaseFailed(caseDescriptor, e.message);
            }
        }

        private static double runTestCaseMeasured(TestCaseDescriptor descriptor) throws assertionError
        {
            DateTime start = new DateTime.now();

            descriptor.testCase();

            DateTime end = new DateTime.now();

            TimeSpan elapsedMicros = end.difference(start);

            return timespanToMillis(elapsedMicros);
        }

        private static double timespanToMillis(TimeSpan timespan)
        {
            return timespan / 1000.0;
        }

        private static TestCaseResult testCaseFailed(TestCaseDescriptor descriptor, string info)
        {
            return new TestCaseResult(descriptor.name, TestCaseState.FAILED, info);
        }

        private static TestCaseResult testCasePassed(TestCaseDescriptor descriptor, double milliseconds)
        {
            return new TestCaseResult(descriptor.name, TestCaseState.PASSED, null, milliseconds);
        }
    }
}