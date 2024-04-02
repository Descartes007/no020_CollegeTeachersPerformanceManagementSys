<%@ page language="java"  pageEncoding="UTF-8" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath %>" />
        <title>My JSP 'adminyanzheng.jsp' starting page</title>
    </head>

    <body>
        <%
        session.invalidate();
        response.sendRedirect("index.jsp");
        %>

    </body>
</html>
