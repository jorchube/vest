using io.github.jorchube.vest;
using Gee;

namespace io.github.jorchube.vest.test
{
    public class XunitPresenterTest : TestSuite
    {
        private IPresenter xunitPresenter;
        private FileSystemWrapperStub fswrapper;

        private string expectedReportPath = "test_results.xml";

        public override void setUp ()
        {
            fswrapper = new FileSystemWrapperStub();

            xunitPresenter = new XunitPresenter(fswrapper);
        }

        public override void testCases ()
        {
            test("It creates a xunit presenter", () =>
            {
            });

            test("It creates an empty xunit test report", () =>
            {
                Collection<TestSuiteResult> results = new LinkedList<TestSuiteResult>();

                xunitPresenter.present(results);

                Assert.equals(1, fswrapper.writeTextFileMock.numCalls());
                Assert.equals(expectedReportPath, fswrapper.writeTextFile_path);
                assertXmlAreEqual(ExpectedContent.emptyReport, fswrapper.writeTextFile_content);
            });

            test("It creates an xunit test report with one empty suite", () =>
            {
                Collection<TestSuiteResult> results = new LinkedList<TestSuiteResult>();
                results.add(TestSuiteResultSamples.emptySuiteResult());

                xunitPresenter.present(results);

                Assert.equals(1, fswrapper.writeTextFileMock.numCalls());
                Assert.equals(expectedReportPath, fswrapper.writeTextFile_path);
                assertXmlAreEqual(ExpectedContent.emptySuite, fswrapper.writeTextFile_content);
            });

            test("It creates an xunit test report with one suite with one passing test", () =>
            {
                Collection<TestSuiteResult> results = new LinkedList<TestSuiteResult>();
                results.add(TestSuiteResultSamples.suiteWithOnePassingTestResult());

                xunitPresenter.present(results);

                Assert.equals(1, fswrapper.writeTextFileMock.numCalls());
                Assert.equals(expectedReportPath, fswrapper.writeTextFile_path);
                assertXmlAreEqual(ExpectedContent.onePassingTestResultSuite, fswrapper.writeTextFile_content);
            });

            test("It creates an xunit test report with one suite with one failing test", () =>
            {
                Collection<TestSuiteResult> results = new LinkedList<TestSuiteResult>();
                results.add(TestSuiteResultSamples.suiteWithOneFailingTestResult());

                xunitPresenter.present(results);

                Assert.equals(1, fswrapper.writeTextFileMock.numCalls());
                Assert.equals(expectedReportPath, fswrapper.writeTextFile_path);
                assertXmlAreEqual(ExpectedContent.oneFailingTestResultSuite, fswrapper.writeTextFile_content);
            });

            test("It creates an xunit test report with one suite with one failing test and one passing test", () =>
            {
                Collection<TestSuiteResult> results = new LinkedList<TestSuiteResult>();
                results.add(TestSuiteResultSamples.suiteWithOneFailingAndOnePassingTestResult());

                xunitPresenter.present(results);

                Assert.equals(1, fswrapper.writeTextFileMock.numCalls());
                Assert.equals(expectedReportPath, fswrapper.writeTextFile_path);
                assertXmlAreEqual(ExpectedContent.oneFailingAndOnePassingTestResultSuite, fswrapper.writeTextFile_content);
            });
        }
    }

    public class FileSystemWrapperStub : IFileSystemWrapper, Object
    {
        public VoidMethodMock2<string, string> writeTextFileMock = new VoidMethodMock2<string, string>();
        public string writeTextFile_path;
        public string writeTextFile_content;

        public FileSystemWrapperStub()
        {
            writeTextFile_content = "";
        }

        public void writeTextFile(string path, string content)
        {
            writeTextFile_path = path;
            writeTextFile_content = content;
            writeTextFileMock.call(path, content);
        }
    }

    public class ExpectedContent : Object
    {
        public const string emptyReport = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <testsuites></testsuites>";

        public const string emptySuite = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <testsuites><testsuite name=\"Empty Suite\"></testsuite></testsuites>";

        public const string onePassingTestResultSuite = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <testsuites><testsuite name=\"One Passing Test Result Suite\"><testcase classname=\"\" name=\"It is a passing test case\" time=\"1.234\"/></testsuite></testsuites>";

        public const string oneFailingTestResultSuite = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <testsuites><testsuite name=\"One Failing Test Result Suite\"><testcase classname=\"\" name=\"It is a failing test case\"><failure message=\"Failed because stonks\"/></testcase></testsuite></testsuites>";

        public const string oneFailingAndOnePassingTestResultSuite = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <testsuites><testsuite name=\"One Failing And One Passing Test Result Suite\"><testcase classname=\"\" name=\"It is a failing test case\"><failure message=\"Failed because stonks\"/></testcase><testcase classname=\"\" name=\"It is a passing test case\" time=\"1.234\"/></testsuite></testsuites>";
    }

    public class TestSuiteResultSamples : Object
    {
        public static TestSuiteResult emptySuiteResult()
        {
            TestSuiteResult res = new TestSuiteResult();
            res.suiteName = "Empty Suite";
            return res;
        }

        public static TestSuiteResult suiteWithOnePassingTestResult()
        {
            TestSuiteResult res = new TestSuiteResult();
            res.suiteName = "One Passing Test Result Suite";
            res.testCaseResults.add(passingTestResult());

            return res;
        }

        public static TestSuiteResult suiteWithOneFailingTestResult()
        {
            TestSuiteResult res = new TestSuiteResult();
            res.suiteName = "One Failing Test Result Suite";
            res.testCaseResults.add(failingTestResult());

            return res;
        }

        public static TestSuiteResult suiteWithOneFailingAndOnePassingTestResult()
        {
            TestSuiteResult res = new TestSuiteResult();
            res.suiteName = "One Failing And One Passing Test Result Suite";
            res.testCaseResults.add(failingTestResult());
            res.testCaseResults.add(passingTestResult());

            return res;
        }

        private static TestCaseResult passingTestResult()
        {
            return new TestCaseResult("It is a passing test case", TestCaseState.PASSED, null, 1234.123);
        }

        private static TestCaseResult failingTestResult()
        {
            return new TestCaseResult("It is a failing test case", TestCaseState.FAILED, "Failed because stonks", 0);
        }
    }

    public void assertXmlAreEqual(string expectedXml, string actualXml) throws assertionError
    {
        Xml.Doc *expected = Xml.Parser.parse_doc(expectedXml);
        Xml.Doc *actual = Xml.Parser.parse_doc(actualXml);

        string expectedString = "";
        string actualString = "";

        expected->dump_memory_enc_format(out expectedString);
        actual->dump_memory_enc_format(out actualString);

        Assert.equals(expectedString, actualString);
    }
}