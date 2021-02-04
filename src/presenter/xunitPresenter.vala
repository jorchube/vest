using Gee;

namespace io.github.jorchube.vest
{
    public class XunitPresenter : Object, IPresenter
    {
        private IFileSystemWrapper fswrapper;
        private string filename = "test_results.xml";

        public XunitPresenter(IFileSystemWrapper fswrapper)
        {
            this.fswrapper = fswrapper;
        }

        public void present(Collection<TestSuiteResult> testSuiteResults)
        {
            Xml.Doc *document = new Xml.Doc();
            string documentString = "";

            document->set_root_element(rootNode());

            foreach(TestSuiteResult result in testSuiteResults)
            {
                addSuiteResultToNode(document->get_root_element(), result);
            }

            documentAsString(document, out documentString);

            fswrapper.writeTextFile(filename, documentString);
        }

        private void addSuiteResultToNode(Xml.Node* node, TestSuiteResult suiteResult)
        {
            Xml.Node *suiteNode = testSuiteNode(suiteResult.suiteName);

            foreach(TestCaseResult caseResult in suiteResult.testCaseResults)
            {
                addCaseResultToNode(suiteNode, caseResult);
            }

            node->add_child(suiteNode);
        }

        private void addCaseResultToNode(Xml.Node* node, TestCaseResult caseResult)
        {
            Xml.Node *caseNode = testCaseNode(caseResult);

            node->add_child(caseNode);
        }

        private void documentAsString(Xml.Doc *document, out string documentString)
        {
            document->dump_memory_enc_format(out documentString);
        }

        private Xml.Node rootNode()
        {
            return node("testsuites");
        }

        private Xml.Node* testSuiteNode(string name)
        {
            Xml.Node *node = node("testsuite");
            addNodeName(node, name);
            node->add_child(node);
            return node;
        }

        private Xml.Node* testCaseNode(TestCaseResult caseResult)
        {
            if (caseResult.state == TestCaseState.PASSED)
            {
                return passedTestCaseNode(caseResult.name, caseResult.elapsedMilliseconds);
            }

            return failedTestCaseNode(caseResult.name, caseResult.info);
        }

        private Xml.Node* passedTestCaseNode(string name, double elapsedMilliseconds)
        {
            Xml.Node *node = testCaseNodePartial(name);
            addNodeTime(node, elapsedMilliseconds);

            return node;
        }

        private Xml.Node* failedTestCaseNode(string name, string info)
        {
            Xml.Node *node = testCaseNodePartial(name);
            node->add_child(failureNode(info));

            return node;
        }

        private Xml.Node* testCaseNodePartial(string name)
        {
            Xml.Node *node = node("testcase");
            addNodeClassname(node, "");
            addNodeName(node, name);

            return node;
        }

        private Xml.Node* failureNode(string message)
        {
            Xml.Node* node = node("failure");
            addNodeMessage(node, message);

            return node;
        }

        private Xml.Node node(string name)
        {
            return new Xml.Node(null, name);
        }

        private void addNodeName(Xml.Node* node, string name)
        {
            node->new_prop("name", name);
        }

        private void addNodeClassname(Xml.Node* node, string name)
        {
            node->new_prop("classname", name);
        }

        private void addNodeTime(Xml.Node* node, double millis)
        {
            string secondsStr = "%0.3f".printf(millis/1000.0);
            node->new_prop("time", secondsStr);
        }

        private void addNodeMessage(Xml.Node* node, string message)
        {
            node->new_prop("message", message);
        }
    }
}