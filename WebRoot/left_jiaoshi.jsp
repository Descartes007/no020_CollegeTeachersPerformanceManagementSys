<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="课程管理">&#xe6a7;</i>
        <cite>课程管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('课程查询','kecheng_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>课程查询</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('开设课程','kaishekecheng_add.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>开设课程</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('我的课程','kaishekecheng_list_jiaoshi.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>我的课程</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="教学管理">&#xe6a7;</i>
        <cite>教学管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('教学效果','jiaoxuexiaoguo_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>教学效果</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('教师成果','chengguo_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>教师成果</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="绩效管理">&#xe6a7;</i>
        <cite>绩效管理</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('年度绩效','niandujixiao_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>年度绩效</cite>
            </a>
        </li>
<%--        <li>--%>
<%--            <a onclick="xadmin.add_tab('聘期绩效','pinqijixiao_list.jsp')">--%>
<%--                <i class="iconfont">&#xe6a7;</i>--%>
<%--                <cite>聘期绩效</cite>--%>
<%--            </a>--%>
<%--        </li>--%>
        <li>
            <a onclick="xadmin.add_tab('绩效指标','jixiaozhibiao_list.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>绩效指标</cite>
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;">
        <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6a7;</i>
        <cite>个人中心</cite>
        <i class="iconfont nav_right">&#xe697;</i>
    </a>
    <ul class="sub-menu">
        <li>
            <a onclick="xadmin.add_tab('修改个人资料','jiaoshi_updtself.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>修改个人资料</cite>
            </a>
        </li>
        <li>
            <a onclick="xadmin.add_tab('修改密码','mod.jsp')">
                <i class="iconfont">&#xe6a7;</i>
                <cite>修改密码</cite>
            </a>
        </li>
    </ul>
</li>
