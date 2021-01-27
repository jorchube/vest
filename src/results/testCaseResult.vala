namespace io.github.jorchube.vest
{
    public class TestCaseResult
    {
        public string name { get; private set; }
        public TestCaseState state { get; private set; }
        public string? info { get; private set; }
        public double elapsedMilliseconds { get; private set; }

        public TestCaseResult(string name, TestCaseState state, string? info = null, double elapsedMilliseconds = 0)
        {
            this.name = name;
            this.state = state;
            this.info = info;
            this.elapsedMilliseconds = elapsedMilliseconds;
        }
    }
}