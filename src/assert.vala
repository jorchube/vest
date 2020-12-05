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

            throw new assertionError.AssertionFailed("Expected error not raised");
        }

        public static void @true(bool b, string? message = null) throws assertionError
        {
            if (!b)
            {
                throw new assertionError.AssertionFailed("Expected true was false");
            }
        }

        public static void @false(bool b, string? message = null) throws assertionError
        {
            if (b)
            {
                throw new assertionError.AssertionFailed("Expected false was true");
            }
        }

        public static void equals(Object? a, Object? b, string? message = null) throws assertionError
        {
            if (a == null)
            {
                if (b == null)
                {
                    return;
                }

                equalsFailed(a, b);
            }

            if (a.get_type() != b.get_type())
            {
                equalsFailed(a, b);
            }

            if (a == b)
            {
                return;
            }

            equalsComparable(a, b, message);
        }

        public static void @null(Object? a) throws assertionError
        {
            if (a != null)
            {
                throw new assertionError.AssertionFailed("Expected null but was not null");
            }
        }

        public static void @notNull(Object? a) throws assertionError
        {
            if (a == null)
            {
                throw new assertionError.AssertionFailed("Expected not null but was null");
            }
        }

        private static void equalsComparable<T>(T a, T b, string? message = null) throws assertionError
        {
            try
            {
                if (((Comparable<T>)a).compare_to(b) != 0)
                {
                    equalsFailed((Object)a, (Object)b);
                }
            }
            catch (Error e)
            {
                equalsFailed((Object)a, (Object)b);
            }
        }

        private static void equalsFailed(Object? a, Object? b) throws assertionError
        {
            throw new assertionError.AssertionFailed("Objects were not equal");
        }
    }
}