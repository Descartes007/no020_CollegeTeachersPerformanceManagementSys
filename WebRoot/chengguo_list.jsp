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
        if ("教师".equals(session.getAttribute("cx"))) {
            where += " AND jiaoshi='" + session.getAttribute("id") + "' ";
        }
        if (request.getParameter("chengguoming") != null && !"".equals(request.getParameter("chengguoming"))) {
            where += " AND chengguoming LIKE '%" + request.getParameter("chengguoming") + "%'";
        }

        List<Map> list = Query.make("chengguo").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 成果 </span>
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
                        成果名

                        <input type="text" class="form-control" style="" name="chengguoming"
                               value="<%= request.getParameter("chengguoming") !=null ? request.getParameter("chengguoming") : "" %>"/>
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
                        <th>成果名</th>
                        <th>成果分</th>
                        <th>教师</th>
                        <th>年份</th>
                        <% if ("管理员".equals(session.getAttribute("cx"))) {%>
                        <th width="220" data-field="handler">操作</th>
                        <%} %>
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
                            <label><%= i %>
                            </label>
                        </td>
                        <td><%= map.get("chengguoming") %>
                        </td>
                        <td><%= map.get("chengguofen") %>
                        </td>
                        <td><%
                            Map mapjiaoshi5 = new CommDAO().find("SELECT username,id FROM jiaoshi where id='" + map.get("jiaoshi") + "'"); %>
                            <%= mapjiaoshi5.get("username") %>
                        </td>
                        <td><%= map.get("nianfen") %>
                        </td>
                        <% if ("管理员".equals(session.getAttribute("cx"))) {%>
                        <td align="center">
                            <a href="chengguo_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                            <a href="chengguo.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
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
<%
    List<Map> List = Query.make("chengguo").where(where).order("nianfen asc,id asc").select();
%>
<script src="js/echarts/echarts.js"></script>
<div id="container" style="min-width:400px;height:400px"></div>
<script>
    (function () {
        var chartDom = document.getElementById('container');
        var myChart = echarts.init(chartDom);
        var option;

        option = {
            title: {
                text: '成果分统计'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['成果分']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: [
                    <% for (Map r:List){%>
                    '<%=r.get("nianfen")%>',
                    <%}%>
                ]
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '成果分',
                    type: 'line',
                    stack: 'Total',
                    data: [
                        <% for (Map r:List){%>
                        '<%=r.get("chengguofen")%>',
                       <%}%>
                    ]
                }
            ]
        };

        option && myChart.setOption(option);
    })();
</script>

<%@ include file="foot.jsp" %>

