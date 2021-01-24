using Gee;

namespace io.github.jorchube.vest
{
    public class MethodMockArguments<T1> : Object, Hashable<MethodMockArguments>
    {
        Gee.List<Value?> arguments;

        private delegate Value valueFromArgDelegate<TN>(TN arg);

        private valueFromArgDelegate<T1> valueFromArg1;

        public MethodMockArguments(T1 arg1)
        {
            arguments = new ArrayList<Value?>();

            initValueFromArgDelegates();

            arguments.add(valueFromArg1(arg1));
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

            strBuilder
                .append("(")
                .append(argToString(arguments[0]))
                .append(")");

            return strBuilder.str;
        }

        private string argToString(Value arg)
        {
            StringBuilder strBuilder = new StringBuilder();

            strBuilder
                .append(arg.type_name())
                .append("(")
                .append(arg.strdup_contents())
                .append(")");

            return strBuilder.str;
        }

        private void initValueFromArgDelegates()
        {
            valueFromArg1 = (a) => { return valueFromArg<T1>(a); };
        }

        private Value valueFromArg<TN>(TN arg)
        {
            Value value = Value(typeof(TN));

            switch(typeof(TN))
            {
                case Type.INT:
                    value.set_int((int)arg);
                    break;
            }

            return value;
        }
    }
}