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

        public static void equals<T, S>(T expected, S value, string? message = null) throws assertionError
        {
            if (expected == null && value != null)
            {
                equalsFailed("Expected null but was not null");
                return;
            }

            if (expected != null && value == null)
            {
                equalsFailed("Expected not null but was null");
                return;
            }

            if (typeof(T) != typeof(S))
            {
                equalsFailed(message);
                return;
            }

            if (typeof(T).is_object())
            {
                objectEquals(expected, value, message);
                return;
            }

            if (typeof(T).is_a(Type.STRING))
            {
                stringEquals((string)expected, (string)value);
                return;
            }

            if (typeof(T).is_a(Type.INT))
            {
                intEquals((int)expected, (int)value);
                return;
            }

            if (expected != value)
            {
                equalsFailed("Elements were not equal");
            }
        }

        private static void intEquals(int expected, int value) throws assertionError
        {
            if (expected != value)
            {
                equalsFailed("Expected \"%d\" is not equal to \"%d\"".printf(expected, value));
            }
        }

        private static void stringEquals(string expected, string value) throws assertionError
        {
            if (strcmp(expected, value) != 0)
            {
                equalsFailed("Expected \"%s\" is not equal to \"%s\"".printf(expected, value));
            }
        }

        private static void objectEquals<T>(T expected, T value, string? message = null) throws assertionError
        {
            if (expected == value)
            {
                return;
            }

            equalsComparable(expected, value, message);
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

        private static void equalsComparable<T>(T expected, T value, string? message = null) throws assertionError
        {
            try
            {
                if (((Comparable<T>)expected).compare_to(value) != 0)
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