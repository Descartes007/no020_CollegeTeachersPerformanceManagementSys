<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>

    <script>
        alert("对不起,请您先登陆!");
        location.href = "login.jsp";
    </script>
    <%return;
    } %> <%
     String updtself = "0"; // 设置更新
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "jixiaozhibiao");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑绩效指标:</div>
            <div class="panel-body">
                <form action="jixiaozhibiao.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类别<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_leibie40"
                                    data-value="<%= Info.html(mmm.get("leibie")) %>"
                                    data-rule-required="true"
                                    data-msg-required="请填写类别"
                                    id="leibie"
                                    name="leibie"
                                    style="width: 250px"
                                >
                                    <option value="0">教学工作量</option>
                                    <option value="1">教学效果</option>
                                    <option value="2">教学建设与研究</option>
                                </select>
                                <script>
                                    $(".class_leibie40").val($(".class_leibie40").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">指标结果<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_zhibiaojieguo41"
                                    data-value="<%= Info.html(mmm.get("zhibiaojieguo")) %>"
                                    data-rule-required="true"
                                    data-msg-required="请填写指标结果"
                                    id="zhibiaojieguo"
                                    name="zhibiaojieguo"
                                    style="width: 250px"
                                >
                                    <option value="0">不合格</option>
                                    <option value="1">合格</option>
                                </select>
                                <script>
                                    $(".class_zhibiaojieguo41").val($(".class_zhibiaojieguo41").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">教师<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_jiaoshi42"
                                    data-value="<%= Info.html(mmm.get("jiaoshi")) %>"
                                    data-rule-required="true"
                                    data-msg-required="请填写教师"
                                    id="jiaoshi"
                                    name="jiaoshi"
                                    style="width: 250px"
                                >
                                    <% List<Map> select = new CommDAO().select("SELECT * FROM jiaoshi ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("username") %></option>
                                    <%} %>

                                </select>
                                <script>
                                    $(".class_jiaoshi42").val($(".class_jiaoshi42").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">考核时间<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"
                                    style="width: 120px"
                                    data-rule-required="true"
                                    data-msg-required="请填写考核时间"
                                    id="kaoheshijian"
                                    name="kaoheshijian"
                                    readonly="readonly"
                                    value="<%= Info.html(mmm.get("kaoheshijian")) %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">管理员</label>
                            <div class="col-sm-10">
                                <select class="form-control class_guanliyuan43" data-value="<%= Info.html(mmm.get("guanliyuan")) %>" id="guanliyuan" name="guanliyuan" style="width: 250px">
                                    <% select = new CommDAO().select("SELECT * FROM admins ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                    <option value="<%= m.get("id") %>"><%= m.get("username") %></option>
                                    <%} %>

                                </select>
                                <script>
                                    $(".class_guanliyuan43").val($(".class_guanliyuan43").attr("data-value"));
                                </script>
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

