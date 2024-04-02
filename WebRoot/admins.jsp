<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String a = Request.get("a"); // 获取当前需要执行的方法
if (a.equals("insert")) {
    // 执行插入管理员模块,表名：admins
    HashMap ext = new HashMap(); // 创建Map对象,主要用于插入扩展数据，和覆盖前台提交的数据

    String charuid = new CommDAO().insert(request, "admins", ext); // 将数据提交到后台代码执行，查看src/dao/CommDAO.java 文件的insert 方法
    // 插入数据完成，弹出页面并跳转到指定页面
    if (!Request.get("referer").equals("")) { // 提交了跳转地址，则跳转到这个地址中
        out.println("<script>alert('添加成功');location.href='" + Request.get("referer") + "';</script>");
    } else {
        // 没提交跳转地址则返回到上一页中
        out.println("<script>alert('添加成功');location.href=document.referrer;</script>");
    }
} else if (a.equals("update")) {
    // 执行更新管理员模块,表名：admins
    HashMap ext = new HashMap(); // 创建Map对象,主要用于插入扩展数据，和覆盖前台提交的数据

    String charuid = new CommDAO().update(request, "admins", ext); // 将数据提交到后台代码执行，查看src/dao/CommDAO.java 文件的insert 方法

    if (Request.get("referer").equals("1")) {
        out.println("<script>alert('保存成功');location.replace(document.referrer);</script>");
    } else {
        if (!Request.get("referer").equals("")) { // 提交了跳转地址，则跳转到这个地址中
            out.println("<script>alert('更新成功');location.replace('" + Request.get("referer") + "');</script>");
        } else {
            // 没提交跳转地址则返回到上一页中,也就是更新的页面
            out.println("<script>alert('更新成功');location.replace(document.referrer);</script>");
        }
    }
    return;
} else if (a.equals("delete")) {
    // 获取一行数据
    Map map = Query.make("admins").find(Request.get("id"));

    new CommDAO().delete(request, "admins"); // 执行删除命令

    out.println("<script>alert('删除成功');location.replace(document.referrer);</script>");
    return;
}
%>

