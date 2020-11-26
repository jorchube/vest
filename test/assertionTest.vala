using io.github.jorchube.vest;

namespace io.github.jorchube.vest.test
{
    class AssertionTest : Suite
    {
        public override void testCases ()
        {
            test("Assert raises does not raise for expected error", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { throw new assertionError.AssertionFailed("ouch"); });
            });

            test("Assert raises does raise for unexpected error", () =>
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

            test("Assert true does not raise error on true", () =>
            {
                Assert.true(true);
            });

            test("Assert true raises error on false", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.true(false); });
            });

            test("Assert false does not raise error on false", () =>
            {
                Assert.false(false);
            });

            test("Assert false raises error on true", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.false(true); });
            });

            test("Assert equals does not raise on two null objects", () =>
            {
                Assert.equals(null, null);
            });

            test("Assert equals raises on one null and one not null object", () =>
            {
                Assert.raises(new assertionError.AssertionFailed(""), () => { Assert.equals(null, new Object()); });
            });
        }
    }
}