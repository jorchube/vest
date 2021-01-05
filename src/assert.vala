using Gee;

namespace io.github.jorchube.vest
{
    public errordomain assertionError {
        AssertionFailed
    }
    
    public class Assert : Object
    {
        public delegate void RaisesDelegate() throws Error;

        public static void raises(Error assertion, RaisesDelegate del, string? message = null) throws assertionError
        {
            try
            {
                del();
            }
            catch (Error err)
            {
                if (err.domain == assertion.domain && err.code == assertion.code)
                {
                    return;
                }
            }

            throw new assertionError.AssertionFailed(message ?? "Expected error not raised");
        }

        public static void @true(bool b, string? message = null) throws assertionError
        {
            if (!b)
            {
                throw new assertionError.AssertionFailed(message ?? "Expected true was false");
            }
        }

        public static void @false(bool b, string? message = null) throws assertionError
        {
            if (b)
            {
                throw new assertionError.AssertionFailed(message ?? "Expected false was true");
            }
        }

        public static void equals<T, S>(T a, S b, string? message = null) throws assertionError
        {
            if (typeof(T) != typeof(S))
            {
                equalsFailed(message);
            }
            
            if (typeof(T).is_object())
            {
                objectEquals(a, b, message);
                return;
            }

            if (a != b)
            {
                equalsFailed(message);
            }
        }

        private static void objectEquals<T>(T a, T b, string? message = null) throws assertionError
        {
            if (a == b)
            {
                return;
            }

            equalsComparable(a, b, message);
        }

        public static void @null(Object? a, string? message = null) throws assertionError
        {
            if (a != null)
            {
                throw new assertionError.AssertionFailed(message ?? "Expected null but was not null");
            }
        }

        public static void @notNull(Object? a, string? message = null) throws assertionError
        {
            if (a == null)
            {
                throw new assertionError.AssertionFailed(message ?? "Expected not null but was null");
            }
        }

        private static void equalsComparable<T>(T a, T b, string? message = null) throws assertionError
        {
            try
            {
                if (((Comparable<T>)a).compare_to(b) != 0)
                {
                    equalsFailed(message);
                }
            }
            catch (Error e)
            {
                equalsFailed(message);
            }
        }

        private static void equalsFailed(string? message = null) throws assertionError
        {
            throw new assertionError.AssertionFailed(message ?? "Elements were not equal");
        }
    }
}