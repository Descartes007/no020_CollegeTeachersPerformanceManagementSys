<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <%
    String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序
    
    String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
    where += " AND jiaoshi='" + request.getSession().getAttribute("username") + "' "; //  设置jiaoshi为当前登录用户
    
    // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
    
    if (request.getParameter("jiaoshi") != null && !"".equals(request.getParameter("jiaoshi"))) {
        where += " AND jiaoshi LIKE '%" + request.getParameter("jiaoshi") + "%'";
    }
    if (request.getParameter("kecheng") != null && !"".equals(request.getParameter("kecheng"))) {
        where += " AND kecheng ='" + request.getParameter("kecheng") + "'";
    }
    
    List<Map> list = Query.make("kaishekecheng").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 开设课程 </span>
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
                        教师

                        <input type="text" class="form-control" style="" name="jiaoshi" value="<%= request.getParameter("jiaoshi") !=null ? request.getParameter("jiaoshi") : "" %>" />
                    </div>
                    <div class="form-group">
                        课程

                        <select class="form-control class_kecheng30" data-value="<%= request.getParameter("kecheng") !=null ? request.getParameter("kecheng") : "" %>" id="kecheng" name="kecheng">
                            <option value="">请选择</option>
                            <% List<Map> select = new CommDAO().select("SELECT * FROM kecheng ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                            <option value="<%= m.get("id") %>"><%= m.get("kechengming") %></option>
                            <%} %>

                        </select>
                        <script>
                            $(".class_kecheng30").val($(".class_kecheng30").attr("data-value"));
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
                            <th>教师</th>
                            <th>课程</th>
                            <th>课程时间</th>
                            <th>学期</th>
                            <th>地址</th>
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
                            <td><%= map.get("jiaoshi") %></td>
                            <td><% Map mapkecheng9 = new CommDAO().find("SELECT kechengming,id FROM kecheng where id='" + map.get("kecheng") + "'"); %>
<%= mapkecheng9.get("kechengming") %></td>
                            <td><%= map.get("kechengshijian") %></td>
                            <td><%= map.get("xueqi") %></td>
                            <td><%= map.get("dizhi") %></td>
                            <td align="center">
                                <a href="kaishekecheng_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                                <a href="kaishekecheng.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
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

