<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="学院管理">&#xe6a7;</i>
        <cite>学院管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('学院添加','xueyuan_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>学院添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('学院查询','xueyuan_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>学院查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="账号管理">&#xe6a7;</i>
        <cite>账号管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('管理员信息','admins_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>管理员信息</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('新增管理员','admins_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>新增管理员</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('密码修改','mod.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>密码修改</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="教师管理">&#xe6a7;</i>
        <cite>教师管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('教师添加','jiaoshi_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>教师添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('教师查询','jiaoshi_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>教师查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="课程管理">&#xe6a7;</i>
        <cite>课程管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('课程添加','kecheng_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>课程添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('课程查询','kecheng_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>课程查询</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('开设课程','kaishekecheng_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>开设课程</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="教学效果管理">&#xe6a7;</i>
        <cite>教学效果管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('教学效果添加','jiaoxuexiaoguo_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>教学效果添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('教学效果查询','jiaoxuexiaoguo_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>教学效果查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="教师成果管理">&#xe6a7;</i>
        <cite>教师成果管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('成果添加','chengguo_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>成果添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('成果查询','chengguo_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>成果查询</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="年度绩效管理">&#xe6a7;</i>
        <cite>年度绩效管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('年度绩效添加','niandujixiao_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>年度绩效添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('年度绩效查询','niandujixiao_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>年度绩效查询</cite>
            </a>
        </li>
    </ul>
</li>
<%--<li>--%>
<%--    <a href="javascript:;">--%>
<%--        <i class="iconfont left-nav-li" lay-tips="聘期绩效管理">&#xe6a7;</i>--%>
<%--        <cite>聘期绩效管理</cite>--%>
<%--        <i class="iconfont nav_right">&#xe697;</i>--%>
<%--    </a>--%>
<%--    <ul class="sub-menu">--%>
<%--        <li>--%>
<%--            <a onclick="xadmin.add_tab('聘期绩效添加','pinqijixiao_add.jsp')">--%>
<%--                <i class="iconfont">&#xe6a7;</i>--%>
<%--                <cite>聘期绩效添加</cite>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a onclick="xadmin.add_tab('聘期绩效查询','pinqijixiao_list.jsp')">--%>
<%--                <i class="iconfont">&#xe6a7;</i>--%>
<%--                <cite>聘期绩效查询</cite>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</li>--%>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="绩效管理">&#xe6a7;</i>
        <cite>绩效管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('绩效添加','jixiaozhibiao_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>绩效添加</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('绩效查询','jixiaozhibiao_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>绩效查询</cite>
            </a>
        </li>
    </ul>
</li>
