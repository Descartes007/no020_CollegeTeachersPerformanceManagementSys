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
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "kaishekecheng");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑开设课程:</div>
            <div class="panel-body">
                <form action="kaishekecheng.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">教师</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入教师"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="jiaoshi"
                                    name="jiaoshi"
                                    value="<%= mmm.get("jiaoshi") %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">课程</label>
                            <div class="col-sm-10">
                                <select class="form-control class_kecheng33" data-value="<%= Info.html(mmm.get("kecheng")) %>" id="kecheng" name="kecheng" style="width: 250px">
                                    <% List<Map> select = new CommDAO().select("SELECT * FROM kecheng WHERE xueyuan='"+session.getAttribute("xueyuan")+"'  ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("kechengming") %></option>
                                    <%} %>

                                </select>
                                <script>
                                    $(".class_kecheng33").val($(".class_kecheng33").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">课程时间<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入课程时间"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写课程时间"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="kechengshijian"
                                    name="kechengshijian"
                                    value="<%= Info.html(mmm.get("kechengshijian")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学期<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_xueqi34"
                                    data-value="<%= Info.html(mmm.get("xueqi")) %>"
                                    data-rule-required="true"
                                    data-msg-required="请填写学期"
                                    id="xueqi"
                                    name="xueqi"
                                    style="width: 250px"
                                >
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                                <script>
                                    $(".class_xueqi34").val($(".class_xueqi34").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">地址<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入地址"
                                    style="width: 250px"
                                    data-rule-required="true"
                                    data-msg-required="请填写地址"
                                    id="dizhi"
                                    name="dizhi"
                                    value="<%= Info.html(mmm.get("dizhi")) %>"
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

