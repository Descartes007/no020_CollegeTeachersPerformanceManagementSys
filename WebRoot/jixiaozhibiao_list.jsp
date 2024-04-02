<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>

<script src="js/datepicker/WdatePicker.js"></script>
<div style="padding: 10px" class="admin-content">
    <%
        String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

        // 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中
        if ("教师".equals(session.getAttribute("cx"))) {
            where += " AND jiaoshi='" + session.getAttribute("id") + "' ";
        }
        if (request.getParameter("leibie") != null && !"".equals(request.getParameter("leibie"))) {
            where += " AND leibie ='" + request.getParameter("leibie") + "'";
        }

        if (request.getParameter("addtime") != null && !"".equals(request.getParameter("addtime"))) {
            where += " AND left(kaoheshijian,4)='"+request.getParameter("addtime")+"'";
        }
        Map leibie = new HashMap();
        leibie.put("0" , "教学工作量");
        leibie.put("1" , "教学效果");
        leibie.put("2" , "教学建设与研究");

        List<Map> list = Query.make("jixiaozhibiao").where(where).order(orderby + " " + sort).page(15);
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 绩效指标 </span>
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
                        类别

                        <select class="form-control class_leibie35"
                                data-value="<%= request.getParameter("leibie") !=null ? request.getParameter("leibie") : "" %>"
                                data-rule-required="true" data-msg-required="请填写类别" id="leibie" name="leibie">
                            <option value="">请选择</option>
                            <option value="0">教学工作量</option>
                            <option value="1">教学效果</option>
                            <option value="2">教学建设与研究</option>
                        </select>
                        <script>
                            $(".class_leibie35").val($(".class_leibie35").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        年份
                        <input type="text" class="form-control" value="<%=Request.get("addtime")%>" name="addtime" readonly="readonly"
                               onfocus="WdatePicker({dateFmt:'yyyy',lang:'zh-cn'})"/>
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
                        <th>类别</th>
                        <th>指标结果</th>
                        <th>教师</th>
                        <th>考核时间</th>
                        <th>管理员</th>
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
                        <td><%= leibie.get(map.get("leibie")) %>
                        </td>
                        <td><%= map.get("zhibiaojieguo") %>
                        </td>
                        <td><%
                            Map mapjiaoshi10 = new CommDAO().find("SELECT username,id FROM jiaoshi where id='" + map.get("jiaoshi") + "'"); %>
                            <%= mapjiaoshi10.get("username") %>
                        </td>
                        <td><%= map.get("kaoheshijian") %>
                        </td>
                        <td><%
                            Map mapadmins11 = new CommDAO().find("SELECT username,id FROM admins where id='" + map.get("guanliyuan") + "'"); %>
                            <%= mapadmins11.get("username") %>
                        </td>
                        <% if ("管理员".equals(session.getAttribute("cx"))) {%>
                        <td align="center">
                            <a href="jixiaozhibiao_updt.jsp?id=<%= map.get("id") %>">编辑</a>

                            <a href="jixiaozhibiao.jsp?a=delete&id=<%= map.get("id") %>"
                               onclick="return confirm('确定要删除？')">删除</a>
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
    String[] fenleis = ("0\n" +
            "1\n" +
            "2").split("\n");
    // List<Map> List = Query.make("jixiaozhibiao").where(where).field("COUNT(*) count,leibie").group("leibie").order("id asc").select();
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
                text: '绩效指标统计'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {},
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                data: [
                    <% for (String f : fenleis){%>
                    '<%=leibie.get(f)%>',
                    <%}%>
                ]
            },
            series: [
                {
                    name: '合格',
                    type: 'bar',
                    data: [
                        <% for (String f : fenleis){
                           double cjLists  =  Query.make("jixiaozhibiao")
                                        .where(where)
                                        .where("zhibiaojieguo",1)
                                        .where("leibie" , f)
                                        .count();
                        %>
                        <%=cjLists%>,
                        <% } %>
                    ]
                },
                {
                    name: '不合格',
                    type: 'bar',
                    data: [
                        <% for (String f : fenleis){
                           double cjLists  =  Query.make("jixiaozhibiao")
                                        .where(where)
                                        .where("zhibiaojieguo",0)
                                        .where("leibie" , f)
                                        .count();
                        %>
                        <%=cjLists%>,
                        <% } %>
                    ]
                }
            ]
        };

        option && myChart.setOption(option);
    })();
</script>
<%@ include file="foot.jsp" %>

