using Gee;

namespace io.github.jorchube.vest
{
    public class VoidMethodMock<T> : VoidArglessMethodMock
    {
        HashSet<T> callMap;

        public VoidMethodMock()
        {
            callMap = new HashSet<T>();
        }

        public bool calledWith(T? arg)
        {
            return callMap.contains(arg);
        }

        public new void call(T? arg)
        {
            base.call();
            callMap.add(arg);
        }
    }
}