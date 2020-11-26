using io.github.jorchube.vest;

namespace io.github.jorchube.vest.test
{
    public static void main()
    {
        Vest.init();

        Vest.addSuite(new AssertionTest());

        Vest.run();
    }
}