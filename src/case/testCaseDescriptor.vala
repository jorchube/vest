namespace io.github.jorchube.vest
{
    public class TestCaseDescriptor : Object
    {
        public TestCaseDelegate testCase { get; private set; }
        public string name { get; private set; }

        public TestCaseDescriptor(string name, TestCaseDelegate testCase)
        {
            this.testCase = testCase;
            this.name = name;
        }
    }
}