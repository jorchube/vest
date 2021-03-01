using io.github.jorchube.vest;
using Gee;

namespace io.github.jorchube.vest.test
{
    public class AssertionTest : TestSuite
    {
        public override void testCases ()
        {
            test("Assert.raises() does not raise for expected error", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { throw new assertionError.AssertionFailed("ouch"); });
            });

            test("Assert.raises() does raise for unexpected error", () =>
            {
                bool raised = false;

                try
                {
                    Assert.raises(new assertionError.AssertionFailed(""), () => { throw new IOError.FAILED("ouch"); });
                }
                catch (assertionError err)
                {
                    raised = true;
                }

                if (!raised)
                {
                    throw new assertionError.AssertionFailed("Did not raise");
                }
            });

            test("Assert.true() does not raise error on true", () =>
            {
                Assert.true(true);
            });

            test("Assert.true() raises error on false", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.true(false); });
            });

            test("Assert.false() does not raise error on false", () =>
            {
                Assert.false(false);
            });

            test("Assert.false() raises error on true", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.false(true); });
            });

            test("Assert.equals() does not raise on two strings that are equal", () =>
            {
                string a = "string";
                string b = "string";

                Assert.equals(a, b);
            });

            test("Assert.equals() raises on two strings that are not equal", () =>
            {
                string a = "aaa";
                string b = "bbb";

                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.equals(a, b); });
            });

            test("Assert.equals() raises on two objects of different types", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.equals(new ObjectTypeA(), new ObjectTypeB()); });
            });

            test("Assert.equals() does not raise on two integers that are equal", () =>
            {
                int a = 1;
                int b = 1;

                Assert.equals(a, b);
            });

            test("Assert.equals() does raises on two integers that are not equal", () =>
            {
                int a = 1234;
                int b = 154576;

                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.equals(a, b); });
            });

            test("Assert.equals() does not raise on two objects with same reference", () =>
            {
                Object a = new Object();
                Object b = a;

                Assert.equals(a, b);
            });

            test("Assert.equals() does not raise on two comparable objects that are equal", () =>
            {
                Assert.equals(new ObjectComparable(1), new ObjectComparable(1));
            });

            test("Assert.equals() raises on two comparable objects that are not equal", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.equals(new ObjectComparable(1), new ObjectComparable(2)); });
            });

            test("Assert.null() raises on non null object", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.null(new ObjectComparable(1)); });
            });

            test("Assert.null() does not raise on null object", () =>
            {
                Assert.null(null);
            });

            test("Assert.notNull() raises on null object", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.notNull(null); });
            });

            test("Assert.notNull() does not raise on non null object", () =>
            {
                Assert.notNull(new ObjectComparable(1));
            });
        }

        class ObjectTypeA : Object
        {}

        class ObjectTypeB : Object
        {}

        class ObjectComparable : Object, Comparable<ObjectComparable>
        {
            private int a { get; private set; }

            public ObjectComparable(int aValue)
            {
                a = aValue;
            }

            public int compare_to(ObjectComparable other)
            {
                return this.a - other.a;
            }
        }
    }
}