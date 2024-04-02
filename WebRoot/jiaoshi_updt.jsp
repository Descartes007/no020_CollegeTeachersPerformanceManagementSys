<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%return;
    } %> <%
     String updtself = "0"; // 设置更新
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "jiaoshi");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑教师:</div>
            <div class="panel-body">
                <form action="jiaoshi.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">工号<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入工号"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写工号"
                                    remote="factory/checkno.jsp?checktype=update&id=<%= mmm.get("id") %>&table=jiaoshi&col=username"
                                    data-msg-remote="内容重复了"
                                    id="username"
                                    name="username"
                                    value="<%= Info.html(mmm.get("username")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入姓名"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写姓名"
                                    id="xingming"
                                    name="xingming"
                                    value="<%= Info.html(mmm.get("xingming")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_xueyuan6"
                                    data-value="<%= Info.html(mmm.get("xueyuan")) %>"
                                    data-rule-required="true"
                                    data-msg-required="请填写学院"
                                    id="xueyuan"
                                    name="xueyuan"
                                    style="width: 250px"
                                >
                                    <% List<Map> select = new CommDAO().select("SELECT * FROM xueyuan ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("xueyuanming") %></option>
                                    <%} %>

                                </select>
                                <script>
                                    $(".class_xueyuan6").val($(".class_xueyuan6").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类型<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_leixing7"
                                    data-value="<%= Info.html(mmm.get("leixing")) %>"
                                    data-rule-required="true"
                                    data-msg-required="请填写类型"
                                    id="leixing"
                                    name="leixing"
                                    style="width: 250px"
                                >
                                    <option value="1">1</option>
                                </select>
                                <script>
                                    $(".class_leixing7").val($(".class_leixing7").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">手机<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入手机"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写手机"
                                    phone="true"
                                    data-msg-phone="请输入正确手机号码"
                                    id="shouji"
                                    name="shouji"
                                    value="<%= Info.html(mmm.get("shouji")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="<%= updtself %>" type="hidden" />

                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>

