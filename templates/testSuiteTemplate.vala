using io.github.jorchube.vest;

namespace some.namespace
{
    class MyTestSuite : Suite
    {
        public override void testCases ()
        {
            test("Should_pass", () =>
            {
                stdout.printf("awesome remierdas\n");
            });
        }
    }
}