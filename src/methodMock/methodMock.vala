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
}