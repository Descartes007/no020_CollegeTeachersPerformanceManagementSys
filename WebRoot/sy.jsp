<%@ page language="java" pageEncoding="utf-8" %>


<html>
    <head>
        <title>教师绩效考核系统</title>
        <LINK href="images/style.css" type=text/css rel=stylesheet>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
            <!--
            body, td, th {
                font-size: 12px;
            }

            -->
        </style>
    </head>
    <body leftMargin="5" topMargin="5" rightMargin="5">
        <table width="100%" height="210" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF" style="border-collapse: collapse">
            <tbody>
                <tr align="middle" bgcolor="#ffffff">
                    <td colspan="4" bgcolor="#CADCEA"><strong>系统基本信息</strong></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="14%" align="left" valign="bottom">当前用户：</td>
                    <td width="37%" align="left" valign="bottom"><font class="t4"><%=request.getSession().getAttribute("username") %> </font></td>
                    <td width="9%" align="left" valign="bottom">您的权限：</td>
                    <td width="40%" align="left" valign="bottom"><font class="t4"><%=request.getSession().getAttribute("cx") %> </font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td height="38" align="left" valign="bottom">当前日期：</td>
                    <td align="left" valign="bottom"><%
                    java.util.Date date = new java.util.Date();
                    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.CHINA);
                    
                    String result = format.format(date);
                    out.print(result);
                    %>
</td>
                    <td align="left" valign="bottom">您的IP：</td>
                    <td align="left" valign="bottom"><%=request.getRemoteAddr() %></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td align="left" valign="bottom">浏览器版本：</td>
                    <td align="left" valign="bottom"><font class="t41"><%=request.getHeader("User-Agent") %> </font></td>
                    <td align="left" valign="bottom">操作系统：</td>
                    <td align="left" valign="bottom"><font class="t41"><%=System.getProperty("os.name") %> </font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td height="43" align="left" valign="bottom">服务器端口：</td>
                    <td align="left" valign="bottom"><font class="t41"><%=request.getServerPort() %> </font></td>
                    <td align="left" valign="bottom">开发日期：</td>
                    <td align="left" valign="bottom"><% out.print(result); %>
</td>
                </tr>
            </tbody>
        </table>
        <p>&nbsp;</p>
        <table width="100%" height="193" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF" style="border-collapse: collapse">
            <tbody>
                <tr align="middle" bgcolor="#ffffff">
                    <td colspan="2" bgcolor="#CADCEA"><strong>教师绩效考核系统</strong></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%" align="left">系统作者：</td>
                    <td width="41%" align="left"><font class="t4">郭瑜</font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td align="left">指导老师：</td>
                    <td align="left">毛峰</td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td align="left">学号：</td>
                    <td align="left"><font class="t41">18031206</font></td>
                </tr>
            </tbody>
        </table>
        <p>&nbsp;</p>
        <p align="right">&nbsp;</p>
    </body>
</html>
