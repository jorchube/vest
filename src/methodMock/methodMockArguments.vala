using Gee;

namespace io.github.jorchube.vest
{
    public interface ToStringable : Object
    {
        public abstract string to_string();
    }

    public class ArgValue : Object
    {
        public Value value {get; private set; }
        public string valueString {get; private set; }

        public ArgValue (Value value, string valueString)
        {
            this.value = value;
            this.valueString = valueString;
        }
    }

    public class MethodMockArguments<T1, T2, T3, T4, T5, T6, T7, T8, T9> : Object, Hashable<MethodMockArguments>
    {
        Gee.List<ArgValue> arguments;

        private delegate ArgValue argValueFromArgDelegate<TN>(TN arg);

        private argValueFromArgDelegate<T1> valueFromArg1;
        private argValueFromArgDelegate<T2> valueFromArg2;
        private argValueFromArgDelegate<T3> valueFromArg3;
        private argValueFromArgDelegate<T4> valueFromArg4;
        private argValueFromArgDelegate<T5> valueFromArg5;
        private argValueFromArgDelegate<T6> valueFromArg6;
        private argValueFromArgDelegate<T7> valueFromArg7;
        private argValueFromArgDelegate<T8> valueFromArg8;
        private argValueFromArgDelegate<T9> valueFromArg9;

        private int numArgs;

        public MethodMockArguments(int numArgs, T1? arg1, T2? arg2, T3? arg3, T4? arg4, T5? arg5, T6? arg6, T7? arg7, T8? arg8, T9? arg9)
        {
            arguments = new ArrayList<ArgValue>();

            this.numArgs = numArgs;

            initArgValueFromArgDelegates();

            arguments.add(valueFromArg1(arg1));
            arguments.add(valueFromArg2(arg2));
            arguments.add(valueFromArg3(arg3));
            arguments.add(valueFromArg4(arg4));
            arguments.add(valueFromArg5(arg5));
            arguments.add(valueFromArg6(arg6));
            arguments.add(valueFromArg7(arg7));
            arguments.add(valueFromArg8(arg8));
            arguments.add(valueFromArg9(arg9));
        }

        public uint hash()
        {
            return to_string().hash();
        }

        public bool equal_to(MethodMockArguments other)
        {
            return hash() == other.hash();
        }

        public string to_string()
        {
            StringBuilder strBuilder = new StringBuilder(typeof(MethodMockArguments).name());

            strBuilder.append("(");

            for(int i=0; i<numArgs; ++i)
            {
                strBuilder.append(argToString(arguments[i]));
            }

            strBuilder.append(")");

            stdout.printf(">>> %s || hash : %u\n", strBuilder.str, strBuilder.str.hash());

            return strBuilder.str;
        }

        private string argToString(ArgValue arg)
        {
            StringBuilder strBuilder = new StringBuilder();

            strBuilder
                .append(arg.value.type_name())
                .append("(")
                .append(arg.valueString)
                .append(")");

            return strBuilder.str;
        }

        private void initArgValueFromArgDelegates()
        {
            valueFromArg1 = (a) => { return valueFromArg<T1>(a); };
            valueFromArg2 = (a) => { return valueFromArg<T2>(a); };
            valueFromArg3 = (a) => { return valueFromArg<T3>(a); };
            valueFromArg4 = (a) => { return valueFromArg<T4>(a); };
            valueFromArg5 = (a) => { return valueFromArg<T5>(a); };
            valueFromArg6 = (a) => { return valueFromArg<T6>(a); };
            valueFromArg7 = (a) => { return valueFromArg<T7>(a); };
            valueFromArg8 = (a) => { return valueFromArg<T8>(a); };
            valueFromArg9 = (a) => { return valueFromArg<T9>(a); };
        }

        private ArgValue valueFromArg<TN>(TN arg)
        {
            Value value = Value(typeof(TN));
            string valueString = "";

            switch(typeof(TN))
            {
                case Type.INT:
                case Type.BOOLEAN:
                case Type.CHAR:
                    value.set_int((int)arg);
                    valueString = ((int)arg).to_string();
                    break;
                case Type.LONG:
                    value.set_long((long)arg);
                    valueString = ((long)arg).to_string();
                    break;
                case Type.DOUBLE:
                    value.set_double((double?)arg);
                    valueString = ((double?)arg).to_string();
                    break;
                case Type.STRING:
                    value.set_string((string)arg);
                    valueString = (string)arg;
                    break;
                default:
                    if (typeof(TN).is_a(Type.OBJECT))
                    {
                        value.set_object((Object)arg);
                        valueString = object_to_string((Object)arg);
                        break;
                    }
                    if (typeof(TN).is_a(Type.ENUM))
                    {
                        value.set_int((int)arg);
                        valueString = ((int)arg).to_string();
                        break;
                    }

                    break;
            }

            return new ArgValue(value, valueString);
        }
    }
}