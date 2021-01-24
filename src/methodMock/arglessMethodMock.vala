using Gee;

namespace io.github.jorchube.vest
{
    public class ArglessMethod<R> : VoidArglessMethodMock
    {
        Gee.Queue<R> returnValues;

        public ArglessMethod()
        {
            returnValues = new LinkedList<R>();
        }

        public void returns (R retval)
        {
            returnValues.offer(retval);
        }

        public new R call()
        {
            base.call();
            return returnValues.poll();
        }
    }
}