using io.github.jorchube.vest;

namespace io.github.jorchube.vest.test
{
    public static void main()
    {
        Vest.init();

        Vest.addSuite(new SuiteTest(), "Suite");

        Vest.addSuite(new AssertionTest(), "Assertions");

        Vest.addSuite(new MethodMockTest(), "MethodMock");

        Vest.addSuite(new XunitPresenterTest(), "Xunit presenter");

        Vest.run();
    }
}