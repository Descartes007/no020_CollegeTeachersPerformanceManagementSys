<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8" %>
<%@page import="util.Info" %>
<%@page import="java.util.List" %>
<%
String table = request.getParameter("table") == null ? "" : request.getParameter("table");
String col = request.getParameter("col") == null ? "" : request.getParameter("col");
String value = request.getParameter(col) == null ? "" : request.getParameter(col);
String checktype = request.getParameter("checktype") == null ? "" : request.getParameter("checktype");
String valuecopy = "";

// 检测插入行是否内容已存在
if (checktype.equals("insert")) {
    //value = Info.getUTFStr(value);
    System.out.println(value);
    List list = new CommDAO().select("select * from " + table + " where " + col + "='" + value + "'");
    if (list.size() > 0) {
        out.print("false");
    } else {
        out.print("true");
    }
}
// 检测更新行是否内容已存在
if (checktype.equals("update")) {
    String id = request.getParameter("id") == null ? "" : request.getParameter("id");
    //value = Info.getUTFStr(value);
    System.out.println(value);
    List list = new CommDAO().select("select * from " + table + " where " + col + "='" + value + "' and id!=" + id);
    System.out.println("select * from " + table + " where " + col + "='" + value + "' and id!=" + id);
    if (list.size() > 0) {
        out.print("false");
    } else {
        out.print("true");
    }
}
%>

