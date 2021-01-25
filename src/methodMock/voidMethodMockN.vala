namespace io.github.jorchube.vest
{
    public class VoidMethodMock1<T1> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 1;

        public VoidMethodMock1()
        {
            base();
        }

        public new void call(T1 arg1)
        {
            base.call(mockArgs(arg1));
        }

        public new bool calledWith(T1 arg1)
        {
            return base.calledWith(mockArgs(arg1));
        }

        private MethodMockArguments mockArgs(T1 arg1)
        {
            return new MethodMockArguments<T1, int, int, int, int, int, int, int, int>(numArgs, arg1, 0, 0, 0, 0, 0, 0, 0, 0);
        }
    }

    public class VoidMethodMock2<T1, T2> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 2;

        public VoidMethodMock2()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2)
        {
            base.call(mockArgs(arg1, arg2));
        }

        public new bool calledWith(T1 arg1, T2 arg2)
        {
            return base.calledWith(mockArgs(arg1, arg2));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2)
        {
            return new MethodMockArguments<T1, T2, int, int, int, int, int, int, int>(numArgs, arg1, arg2, 0, 0, 0, 0, 0, 0, 0);
        }
    }

    public class VoidMethodMock3<T1, T2, T3> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 3;

        public VoidMethodMock3()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3)
        {
            base.call(mockArgs(arg1, arg2, arg3));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3)
        {
            return new MethodMockArguments<T1, T2, T3, int, int, int, int, int, int>(numArgs, arg1, arg2, arg3, 0, 0, 0, 0, 0, 0);
        }
    }

    public class VoidMethodMock4<T1, T2, T3, T4> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 4;

        public VoidMethodMock4()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
        {
            base.call(mockArgs(arg1, arg2, arg3, arg4));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
        {
            return new MethodMockArguments<T1, T2, T3, T4, int, int, int, int, int>(numArgs, arg1, arg2, arg3, arg4, 0, 0, 0, 0, 0);
        }
    }

    public class VoidMethodMock5<T1, T2, T3, T4, T5> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 5;

        public VoidMethodMock5()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
        {
            base.call(mockArgs(arg1, arg2, arg3, arg4, arg5));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, int, int, int, int>(numArgs, arg1, arg2, arg3, arg4, arg5, 0, 0, 0, 0);
        }
    }

    public class VoidMethodMock6<T1, T2, T3, T4, T5, T6> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 6;

        public VoidMethodMock6()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
        {
            base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, int, int, int>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0, 0);
        }
    }

    public class VoidMethodMock7<T1, T2, T3, T4, T5, T6, T7> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 7;

        public VoidMethodMock7()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
        {
            base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, int, int>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, 0, 0);
        }
    }

    public class VoidMethodMock8<T1, T2, T3, T4, T5, T6, T7, T8> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 8;

        public VoidMethodMock8()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
        {
            base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, T8, int>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, 0);
        }
    }

    public class VoidMethodMock9<T1, T2, T3, T4, T5, T6, T7, T8, T9> : VoidMethodMock<MethodMockArguments>
    {
        private const int numArgs = 9;

        public VoidMethodMock9()
        {
            base();
        }

        public new void call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
        {
            base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9));
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, T8, T9>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
        }
    }
}