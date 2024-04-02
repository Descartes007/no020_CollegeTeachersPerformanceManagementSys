<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
 <%@ page import="util.Request" %>
 <%@ page import="dao.Query" %>
 <%@ page import="com.alibaba.fastjson.*" %>
 <%@ page import="java.util.Map" %>
 <%@ page import="java.util.List" %>
<%
out.clear();
out.clearBuffer();
if ("table".equals(request.getParameter("a"))) {
    String table = request.getParameter("table");
    String id = request.getParameter("id");
    HashMap map = new CommDAO().find("SELECT * FROM " + table + " WHERE id=" + id);
    String json = JSONObject.toJSONString(map);
    out.print(json);
} else if ("selectUpdate".equals(request.getParameter("a"))) {
    out.clear();
    out.clearBuffer();

    String table = Request.get("table");
    Query query = Query.make(table);
    String limit = "50";
    JSONObject where = JSON.parseObject(Request.get("where"));
    for (Map.Entry entry : where.entrySet()) {
        String key = (String) entry.getKey();
        Object value = entry.getValue();
        if (key.equals("limit")) {
            limit = String.valueOf(value);
        } else if (value instanceof JSONObject) {
            JSONObject w = (JSONObject) value;
            query.where(key, w.getString("exp"), w.getString("value"));
        } else if (value instanceof JSONArray) {
            JSONArray w = (JSONArray) value;
            query.where(key, (String) w.get(0), w.get(1));
        } else {
            query.where(key, value);
        }
    }
    List list = query.order("id desc").limit(limit).select();
    out.print(JSON.toJSONString(list));
} else if ("commit".equals(request.getParameter("a"))) {
    String id = request.getParameter("id");
    String biao = request.getParameter("biao");
    HashMap ext = new HashMap();
    String insertId = new CommDAO().insert(request, "pinglun", ext);
    out.print("<script>alert('评论成功');location.href=document.referrer;</script>");
    return;
}
%>

