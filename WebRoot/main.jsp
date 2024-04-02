<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

<script>
    alert("对不起,请您先登陆!");
    location.href = "login.jsp";
</script>
<% out.close(); %>
 <%} %>


<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8" />
        <title>教师绩效考核系统-后台管理</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="./css/font.css" />
        <link rel="stylesheet" href="./css/xadmin.css" />
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            var is_remember = false;
        </script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./">教师绩效考核系统</a>
            </div>
            <!--
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    -->
            <!--
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
        </li>
    </ul>
    -->

            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">欢迎登录教师绩效考核系统，<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>，权限<%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %></a>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="logout.jsp">退出</a>
                </li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <% if ("管理员".equals(request.getSession().getAttribute("cx"))) { %>
 <%@ include file="left_guanliyuan.jsp" %>
 <%} %>
 <% if ("教师".equals(request.getSession().getAttribute("cx"))) { %>
 <%@ include file="left_jiaoshi.jsp" %>
 <%} %>

                    <!--leftmenu-->
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
                </ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd>
                    </dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src="sy.jsp" frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->

        <script>
            setInterval(function () {
                $.post("./", "", function () {});
            }, 60 * 1000);
        </script>
    </body>
</html>
