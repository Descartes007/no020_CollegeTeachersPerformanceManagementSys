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
    
    if (request.getParameter("username") != null && !"".equals(request.getParameter("username"))) {
        where += " AND username LIKE '%" + request.getParameter("username") + "%'";
    }
    if (request.getParameter("xueyuan") != null && !"".equals(request.getParameter("xueyuan"))) {
        where += " AND xueyuan ='" + request.getParameter("xueyuan") + "'";
    }
    
    List<Map> list = Query.make("jiaoshi").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 教师 </span>
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
                        工号

                        <input type="text" class="form-control" style="" name="username" value="<%= request.getParameter("username") !=null ? request.getParameter("username") : "" %>" />
                    </div>
                    <div class="form-group">
                        学院

                        <select
                            class="form-control class_xueyuan1"
                            data-value="<%= request.getParameter("xueyuan") !=null ? request.getParameter("xueyuan") : "" %>"
                            data-rule-required="true"
                            data-msg-required="请填写学院"
                            id="xueyuan"
                            name="xueyuan"
                        >
                            <option value="">请选择</option>
                            <% List<Map> select = new CommDAO().select("SELECT * FROM xueyuan ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("xueyuanming") %></option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_xueyuan1").val($(".class_xueyuan1").attr("data-value"));
                        </script>
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
                            <th>工号</th>
                            <th>姓名</th>
                            <th>学院</th>
                            <th>类型</th>
                            <th>手机</th>
                            <th width="220" data-field="handler">操作</th>
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
                            <td><%= map.get("username") %></td>
                            <td><%= map.get("xingming") %></td>
                            <td><% Map mapxueyuan1 = new CommDAO().find("SELECT xueyuanming,id FROM xueyuan where id='" + map.get("xueyuan") + "'"); %>
<%= mapxueyuan1.get("xueyuanming") %></td>
                            <td><%= map.get("leixing") %></td>
                            <td><%= map.get("shouji") %></td>
                            <td align="center">
                                <a href="jiaoshi_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                                <a href="jiaoshi.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
                                <!--qiatnalijne-->
                            </td>
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

