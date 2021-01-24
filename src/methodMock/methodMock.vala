using Gee;

namespace io.github.jorchube.vest
{
    public class MethodMock<T, R> : VoidMethodMock<T>
    {
        HashMap<T, R> returnMap;

        public MethodMock()
        {
            base();
            returnMap = new HashMap<T, R>();
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

    public class MethodMock1<T1, R> : MethodMock<MethodMockArguments, R>
    {
        public MethodMock1()
        {
            base();
        }

        public new R call(T1 arg1)
        {
            MethodMockArguments args = new MethodMockArguments<T1>(arg1);

            return base.call(args);
        }

        public new bool calledWith(T1 arg1)
        {
            MethodMockArguments args = new MethodMockArguments<T1>(arg1);

            return base.calledWith(args);
        }

        public new void returns(T1 arg1, R returnValue)
        {
            MethodMockArguments args = new MethodMockArguments<T1>(arg1);

            base.returns(args, returnValue);
        }
    }
}