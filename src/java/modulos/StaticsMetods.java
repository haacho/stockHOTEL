package modulos;

import com.google.gson.Gson;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

public class StaticsMetods {

    public static final Gson gSon = new Gson();
    public static final SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat ddMMyyyy = new SimpleDateFormat("dd/MM/yyyy");
    public static final SimpleDateFormat MMMM = new SimpleDateFormat("MMMM");
    public static final DecimalFormat dfMoney = new DecimalFormat("$0.00");
    public static final DecimalFormat df = new DecimalFormat("0.00");
    public static final Calendar FECHA_POR_DEFECTO = Calendar.getInstance();

    static {
        try {
            FECHA_POR_DEFECTO.setTime(yyyyMMdd.parse("1930-01-01"));
        } catch (ParseException ex) /*  32:    */ {
            Logger.getLogger(StaticsMetods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String showExepction(Exception ex) {
        String res = "<div class=\"alert alert-danger\">" + ex.getMessage() + "</div>";
        return res;
    }

    public static String showSuccess(String sms) {
        String res = "<div class=\"alert alert-success\">" + sms + "</div>";
        return res;
    }

    public static String parseCalendarToString(Calendar c) {
        if (c == null) {
            return "No Definido";
        }
        return yyyyMMdd.format(c.getTime());
    }

    public static Calendar parseStringToCalendar(String s) {
        Calendar c = Calendar.getInstance();
        try {
            c.setTime(yyyyMMdd.parse(s));
        } catch (ParseException ex) {
            Logger.getLogger(StaticsMetods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static String parseDoubleMoneyToString(Double valor) {
        return dfMoney.format(valor);
    }

    public static String parseDoubleToString(Double valor) {
        return df.format(valor);
    }

    public static String parseTipoActiontoString(String tipoAction) {
        return tipoAction.equals("B") ? "Eliminar" : tipoAction.endsWith("A") ? "Aceptar" : "Modificar";
    }

    public static String printBtnActionsSmall(String onClick) /*  87:    */ {
        String res = "<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">\n    <a onclick=\"" + onClick + "('M')\"><i class=\"icon-pencil bigger-150 \" data-toggle=\"tooltip\" title=\"Crear\"></i></a>\n" + "    <a onclick=\"" + onClick + "('B')\"><i class=\"icon-trash bigger-150 red\" data-toggle=\"tooltip\" title=\"Eliminar\"></i></a>\n" + "    <a onclick=\"" + onClick + "('A')\"><i class=\"icon-plus-sign bigger-150 green\" data-toggle=\"tooltip\" title=\"Modificar\"></i></a>\n" + "</div>";
        return res;
        /*  94:    */    }
    /*  95:    */
    /*  96:    */ public static String printBtnActions(String onClick) /*  97:    */ {
        /*  98: 95 */ String res = "<button onclick=\"" + onClick + "('A')\" class=\"btn btn-primary pull-right btn-sm\" style=\"margin: 2px\"><i class=\"icon-plus-sign bigger-130\"></i>Nuevo</button>\n" + "<button onclick=\"" + onClick + "('B')\" class=\"btn btn-primary pull-right btn-sm\" style=\"margin: 2px\"><i   class=\"icon-trash bigger-130\"></i>Eliminar</button>\n" + "<button onclick=\"" + onClick + "('M')\" class=\"btn btn-primary pull-right btn-sm\" style=\"margin: 2px\"><i class=\"icon-pencil bigger-130 \"></i>Modificar</button>    ";
        /*  99:    */
        /* 100:    */
        /* 101: 98 */ return res;
        /* 102:    */    }
    /* 103:    */
    /* 104:    */ public static String printBtnActionsSmall(String onClick, String actions, String id, String size) /* 105:    */ {
        /* 106:103 */ if (size == null) {
            /* 107:104 */ size = "150";
            /* 108:    */        }
        /* 109:106 */ String res = "<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">\n";
        /* 110:107 */ if (actions.contains("A")) {
            /* 111:108 */ res = res + "    <a onclick=\"" + onClick + "(" + id + ",'A')\"><i class=\"icon-plus-sign bigger-" + size + " green\" data-toggle=\"tooltip\" title=\"Crear\"></i></a>\n";
            /* 112:    */        }
        /* 113:110 */ if (actions.contains("M")) {
            /* 114:111 */ res = res + "    <a onclick=\"" + onClick + "(" + id + ",'M')\"><i class=\"icon-pencil bigger-" + size + "\" data-toggle=\"tooltip\" title=\"Modificar\"></i></a>\n";
            /* 115:    */        }
        /* 116:113 */ if (actions.contains("B")) {
            /* 117:114 */ res = res + "    <a onclick=\"" + onClick + "(" + id + ",'B')\"><i class=\"icon-trash bigger-" + size + " red\" data-toggle=\"tooltip\" title=\"Eliminar\"></i></a>\n";
            /* 118:    */        }
        /* 119:116 */ res = res + "</div>";
        /* 120:117 */ return res;
        /* 121:    */    }
    /* 122:    */
    /* 123:    */ public static String printBtnActionsSmall(String onClick, String actions, String id) /* 124:    */ {
        /* 125:121 */ return printBtnActionsSmall(onClick, actions, id, null);
        /* 126:    */    }
    /* 127:    */
    /* 128:    */ public static String parseMes(int mes) /* 129:    */ {
        /* 130:126 */ Calendar cal = new GregorianCalendar(2000, mes, 20);
        /* 131:127 */ String input = MMMM.format(cal.getTime());
        /* 132:128 */ return input.substring(0, 1).toUpperCase() + input.substring(1);
        /* 133:    */    }
    /* 134:    */
    /* 135:    */ public static String showInfo(String sms) /* 136:    */ {
        /* 137:133 */ String res = "<div class=\"alert alert-info\">" + sms + "</div>";
        /* 138:134 */ return res;
        /* 139:    */    }
    /* 140:    */
    /* 141:    */ public static String getParameter(HttpServletRequest request, String name)
            /* 142:    */ throws UnsupportedEncodingException /* 143:    */ {
        /* 144:139 */ String parameter = request.getParameter(name);
        /* 145:140 */ if (parameter == null) {
            /* 146:141 */ return null;
            /* 147:    */        }
        /* 148:143 */ return new String(parameter.getBytes(), "UTF-8");
        /* 149:    */    }
    /* 150:    */
    /* 151:    */ public static String toString(Object obj) /* 152:    */ {
        /* 153:151 */ return obj == null ? "" : obj.toString();
        /* 154:    */    }
}
