namespace io.github.jorchube.vest
{
    public class TestCaseResult
    {
        public string name { get; private set; }
        public TestCaseState state { get; private set; }
        public string? info { get; private set; }

        public TestCaseResult(string name, TestCaseState state, string? info = null)
        {
            this.name = name;
            this.state = state;
            this.info = info;
        }
    }
}