using io.github.jorchube.vest;

namespace some.namespace
{
    public static void main()
    {
        Vest.init();

        Vest.addSuite(new MyTestSuite());

        Vest.run();
    }
}