namespace io.github.jorchube.vest
{
    public class MethodMock1<T1, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 1;

        public MethodMock1()
        {
            base();
        }

        public new R call(T1 arg1)
        {
            return base.call(mockArgs(arg1));
        }

        public new bool calledWith(T1 arg1)
        {
            return base.calledWith(mockArgs(arg1));
        }

        public new void returns(T1 arg1, R returnValue)
        {
            base.returns(mockArgs(arg1), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1)
        {
            return new MethodMockArguments<T1, int, int, int, int, int, int, int, int>(numArgs, arg1, 0, 0, 0, 0, 0, 0, 0, 0);
        }
    }

    public class MethodMock2<T1, T2, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 2;

        public MethodMock2()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2)
        {
            return base.call(mockArgs(arg1, arg2));
        }

        public new bool calledWith(T1 arg1, T2 arg2)
        {
            return base.calledWith(mockArgs(arg1, arg2));
        }

        public new void returns(T1 arg1, T2 arg2, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2)
        {
            return new MethodMockArguments<T1, T2, int, int, int, int, int, int, int>(numArgs, arg1, arg2, 0, 0, 0, 0, 0, 0, 0);
        }
    }

    public class MethodMock3<T1, T2, T3, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 3;

        public MethodMock3()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3)
        {
            return base.call(mockArgs(arg1, arg2, arg3));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3)
        {
            return new MethodMockArguments<T1, T2, T3, int, int, int, int, int, int>(numArgs, arg1, arg2, arg3, 0, 0, 0, 0, 0, 0);
        }
    }

    public class MethodMock4<T1, T2, T3, T4, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 4;

        public MethodMock4()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
        {
            return base.call(mockArgs(arg1, arg2, arg3, arg4));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, T4 arg4, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3, arg4), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
        {
            return new MethodMockArguments<T1, T2, T3, T4, int, int, int, int, int>(numArgs, arg1, arg2, arg3, arg4, 0, 0, 0, 0, 0);
        }
    }

    public class MethodMock5<T1, T2, T3, T4, T5, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 5;

        public MethodMock5()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
        {
            return base.call(mockArgs(arg1, arg2, arg3, arg4, arg5));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3, arg4, arg5), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, int, int, int, int>(numArgs, arg1, arg2, arg3, arg4, arg5, 0, 0, 0, 0);
        }
    }

    public class MethodMock6<T1, T2, T3, T4, T5, T6, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 6;

        public MethodMock6()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
        {
            return base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, int, int, int>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0, 0);
        }
    }

    public class MethodMock7<T1, T2, T3, T4, T5, T6, T7, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 7;

        public MethodMock7()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
        {
            return base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, int, int>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, 0, 0);
        }
    }

    public class MethodMock8<T1, T2, T3, T4, T5, T6, T7, T8, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 8;

        public MethodMock8()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
        {
            return base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, T8, int>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, 0);
        }
    }

    public class MethodMock9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R> : MethodMock<MethodMockArguments, R>
    {
        private const int numArgs = 9;

        public MethodMock9()
        {
            base();
        }

        public new R call(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
        {
            return base.call(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9));
        }

        public new bool calledWith(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
        {
            return base.calledWith(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9));
        }

        public new void returns(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9, R returnValue)
        {
            base.returns(mockArgs(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9), returnValue);
        }

        private MethodMockArguments mockArgs(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
        {
            return new MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, T8, T9>(numArgs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
        }
    }
}