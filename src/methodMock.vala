using Gee;

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

    public class VoidMethodMock<T> : VoidArglessMethodMock
    {
        HashSet<T> callMap;

        public VoidMethodMock(EqualDataFunc equalFunc)
        {
            callMap = new HashSet<T>(null, equalFunc);
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

    public class MethodMock<T, R> : VoidMethodMock<T>
    {
        HashMap<T, R> returnMap;

        public MethodMock(EqualDataFunc equalFunc)
        {
            base(equalFunc);
            returnMap = new HashMap<T, R>(null, equalFunc, null);
        }

        public new R call(T arg)
        {
            base.call(arg);
            if (returnMap.has_key(arg))
            {
                return returnMap.get(arg);
            }

            return null;
        }

        public void returns(T? arg, R? returnValue)
        {
            returnMap.set(arg, returnValue);
        }
    }
}