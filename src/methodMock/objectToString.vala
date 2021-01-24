/*
    https://gitlab.gnome.org/-/snippets/1116
*/

/* * Do what you will with this code! * */
  /**
   * prints the property values of a GLib.Objcet/GObject.
   */
public string object_to_string (GLib.Object obj) {
    GLib.ObjectClass real_obj = (GLib.ObjectClass) obj.get_type ().class_ref ();

    var str_builder = new GLib.StringBuilder ();


    str_builder.append ("(")
                .append (obj.get_type().name ())
                .append ("):\n");

    foreach (GLib.ParamSpec ps in real_obj.list_properties ()) {

        if (ps.value_type == 0 || ps.value_type == GLib.Type.INVALID) {
            continue;
        }

        var prop_name = ps.get_name ();

        Value prop_val = GLib.Value (ps.value_type);

        if (prop_val.type () == GLib.Type.INVALID || prop_val.type () == 0) {
            continue;
        }

        obj.get_property (prop_name, ref prop_val);


        str_builder.append ("\t(")
                    .append (prop_val.type_name ())
                    .append (") ")
                    .append (prop_name)
                    .append (": ");


        switch (prop_val.type ()) {
        case (GLib.Type.STRING):
            if (prop_val.dup_string () == null) {
            str_builder.append ("(null)");
            } else {
            str_builder.append (prop_val.dup_string ());
            }
        break;
        case (GLib.Type.INT):
            str_builder.append (prop_val.get_int ().to_string ());
        break;
        case (GLib.Type.BOOLEAN):
            str_builder.append (prop_val.get_boolean ().to_string ());
        break;
        case (GLib.Type.CHAR):
            var v = prop_val.get_schar ();
            str_builder.append_c (v)
                        .append (" (")
                        .append_printf ("%hhx", v);
            str_builder.append (")");
        break;
        case (GLib.Type.DOUBLE):
            str_builder.append (prop_val.get_double ().to_string ());
        break;
        case (GLib.Type.ENUM):
            str_builder.append (prop_val.get_enum ().to_string ());
        break;
        case (GLib.Type.FLAGS):
            // TODO: Probobly needs better handling, but this will do.
            str_builder.append (prop_val.get_flags ().to_string ());
        break;
        case (GLib.Type.FLOAT):
            str_builder.append (prop_val.get_float ().to_string ());
        break;
        case (GLib.Type.INT64):
            str_builder.append (prop_val.get_int64 ().to_string ());
        break;
        case (GLib.Type.LONG):
            str_builder.append (prop_val.get_long ().to_string ());
        break;
        case (GLib.Type.OBJECT):
            str_builder.append_printf ("%llX", (((long)((pointer)prop_val.dup_object ()))));
        break;
        /* /!\ NOTE: Invalid case /!\
            * A ParamSpec can't "contain" a ParamSpec.
        case (GLib.Type.PARAM):
            var spsc = prop_val.get_param ();
            if (spsc == null) {
            str_builder.append ("(null)");
            } else {
            str_builder.append ("name: ")
                        .append (spsc.name)
                        .append (" type: ")
                        .append (spsc.value_type.name ());
            }
        break;
        */
        case (GLib.Type.POINTER):
            str_builder.append ("(")
                        .append_printf ("%llX", (((long)prop_val.get_pointer ())));
            str_builder.append (")");
        break;
        case (GLib.Type.BOXED):
            str_builder.append ("(")
                        .append_printf ("%llX", (((long)prop_val.get_boxed ())));
            str_builder.append (")");
        break;
        case (GLib.Type.UCHAR):
            var v = prop_val.get_uchar ();
            str_builder.append_c ((char) v)
                        .append (" (")
                        .append_printf ("%hhx", v);
            str_builder.append (")");
        break;
        case (GLib.Type.UINT):
            str_builder.append (prop_val.get_uint ().to_string ());
        break;
        case (GLib.Type.UINT64):
            str_builder.append (prop_val.get_uint64 ().to_string ());
        break;
        case (GLib.Type.ULONG):
            str_builder.append (prop_val.get_ulong ().to_string ());
        break;
        case (GLib.Type.VARIANT):
            GLib.Variant v = prop_val.dup_variant ();
            GLib.Variant? tv = null;
            unowned string ts1 = v.get_type_string ();
            str_builder.append ("")
                        .append (ts1)
                        .append ("\n\t(\n");
            GLib.VariantIter iter = v.iterator ();
            tv = iter.next_value ();
            while (tv != null) {
            unowned string ts2 = tv.get_type_string ();
            string tp = tv.print (true);
            str_builder.append ("\t\t((")
                        .append (ts2)
                        .append ("): ")
                        .append (tp)
                        .append (")\n");
            tv = iter.next_value ();
            }
            str_builder.append ("\t)");

        break;
        }
        str_builder.append ("\n");
    }

    return str_builder.str;
}