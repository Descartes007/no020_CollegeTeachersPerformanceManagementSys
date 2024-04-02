package util;

import com.jntoo.db.utils.StringUtil;
import com.jntoo.db.utils.ThreadContextHolder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Request {

    /**
     * 获取当前线程的 Request
     * @return
     */
    public static HttpServletRequest getRequest() {
        return ThreadContextHolder.getContext(SetChar.LocalRequestContext.class).getRequest();
    }

    /**
     * 获取当前线程的 Response
     * @return
     */
    public static HttpServletResponse getResponse() {
        return ThreadContextHolder.getContext(SetChar.LocalRequestContext.class).getResponse();
    }

    /**
     * 获取Url 字符串参数
     * @param name
     * @return
     */
    public static String get(String name) {
        String[] value = getRequest().getParameterValues(name);
        return value == null || value.length == 0 ? "" : StringUtil.join(",", value);
    }

    /**
     * 获取Url 字符串参数
     * @param name
     * @param def 默认值
     * @return
     */
    public static String get(String name, String def) {
        if (def == null) {
            def = "";
        }
        String[] value = getRequest().getParameterValues(name);
        return value == null || value.length == 0 ? def : StringUtil.join(",", value);
    }

    /**
     * 获取URL 整数参数
     * @param name
     * @return
     */
    public static int getInt(String name) {
        return getInt(name, 0);
    }

    /**
     * 获取URL 整数参数
     * @param name
     * @param def 默认值
     * @return
     */
    public static int getInt(String name, int def) {
        String value = get(name, String.valueOf(def));
        return value.equals("") ? def : Integer.valueOf(value).intValue();
    }

    /**
     * 获取URL 浮点数参数
     * @param name
     * @return
     */
    public static double getDouble(String name) {
        return getDouble(name, 0.0f);
    }

    /**
     * 获取URL 浮点数参数
     * @param name
     * @param def 默认值
     * @return
     */
    public static double getDouble(String name, double def) {
        String value = get(name, String.valueOf(def));
        return value.equals("") ? def : Double.valueOf(value).doubleValue();
    }
}
