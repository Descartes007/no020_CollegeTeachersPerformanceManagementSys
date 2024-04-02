<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <%
    String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序
    
    String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
    
    // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
    if ("教师".equals(session.getAttribute("cx"))){
        where +=" AND xueyuan='"+session.getAttribute("xueyuan")+"' ";
    }
    if (request.getParameter("kechengming") != null && !"".equals(request.getParameter("kechengming"))) {
        where += " AND kechengming LIKE '%" + request.getParameter("kechengming") + "%'";
    }
    
    List<Map> list = Query.make("kecheng").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 课程 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>

                    <div class="form-group">
                        课程名

                        <input type="text" class="form-control" style="" name="kechengming" value="<%= request.getParameter("kechengming") !=null ? request.getParameter("kechengming") : "" %>" />
                    </div>

                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>课程名</th>
                            <th>学分</th>
                            <th>学院</th>
                            <th>课时</th>
                            <th>学评教分</th>
                            <th>类型</th>
                            <th>管理员</th>
                            <% if ("管理员".equals(session.getAttribute("cx"))){%>
                            <th width="220" data-field="handler">操作</th>
                            <%}%>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int i = 0;
                        for (Map map : list) {
                            i++;
                        %>

                        <tr id="<%= map.get("id") %>" pid="">
                            <td width="30" align="center">
                                <label> <%= i %> </label>
                            </td>
                            <td><%= map.get("kechengming") %></td>
                            <td><%= map.get("xuefen") %></td>
                            <td><% Map mapxueyuan6 = new CommDAO().find("SELECT xueyuanming,id FROM xueyuan where id='" + map.get("xueyuan") + "'"); %>
<%= mapxueyuan6.get("xueyuanming") %></td>
                            <td><%= map.get("keshi") %></td>
                            <td><%= map.get("xuepingjiaofen") %></td>
                            <td><%= map.get("leixing") %></td>
                            <td><% Map mapadmins7 = new CommDAO().find("SELECT username,id FROM admins where id='" + map.get("guanliyuan") + "'"); %>
<%= mapadmins7.get("username") %></td>
                            <% if ("管理员".equals(session.getAttribute("cx"))){%>
                            <td align="center">
                                <a href="kecheng_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                                <a href="kecheng.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
                                <!--qiatnalijne-->
                            </td>
                            <%} %>
                        </tr>
                        <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

