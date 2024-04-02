<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8" />
        <title>教师绩效考核系统-后台登录</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="./css/font.css" />
        <link rel="stylesheet" href="./css/login.css" />
        <link rel="stylesheet" href="./css/xadmin.css" />
        <script type="text/javascript" src="./js/jquery.min.js"></script>
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="login-bg">
        <div class="login layui-anim layui-anim-up">
            <div class="message">教师绩效考核系统-管理登录</div>
            <div id="darkbannerwrap"></div>
            <form method="post" class="layui-form" action="login?ac=adminlogin&a=a">
                <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input" />
                <hr class="hr15" />
                <input name="pwd" lay-verify="required" placeholder="密码" type="password" class="layui-input" />
                <hr class="hr15" />
                <select name="cx" class="layui-select">
                    <option value="管理员">管理员</option>
                    <option value="教师">教师</option>
                </select>
                <hr class="hr15" />
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-inline" style="width: 100px">
                            <input type="text" name="pagerandom" placeholder="验证码" class="layui-input" lay-verify="required" />
                        </div>
                        <img alt="刷新验证码" onClick="this.src='image.jsp?time='+new Date().getTime();" src="image.jsp" style="cursor: pointer; padding-top: 10px" />
                    </div>
                </div>
                <hr class="hr15" />
                <input value="登录" lay-submit lay-filter="login" style="width: 100%" type="submit" />
                <hr class="hr20" />
            </form>
        </div>

        <script>
            $(function () {
                layui.use("form", function () {
                    var form = layui.form;
                    form.on("submit(login)", function (data) {
                        // alert(888)

                        return true;
                    });
                });
            });
        </script>
        <!-- 底部结束 -->
    </body>
</html>
