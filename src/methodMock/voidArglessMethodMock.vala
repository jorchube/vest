namespace io.github.jorchube.vest
{
    public class VoidArglessMethodMock
    {
        private int calls = 0;

        public int numCalls()
        {
            return calls;
        }

        public void call()
        {
            calls++;
        }
    }
}