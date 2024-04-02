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
     HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "pinqijixiao");
     %>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑聘期绩效:</div>
            <div class="panel-body">
                <form action="pinqijixiao.jsp?a=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">考核<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="class_kaohe16" data-value="<%= Info.html(mmm.get("kaohe")) %>">
                                    <label><input type="radio" data-rule-required="true" data-msg-required="请填写考核" id="kaohe" name="kaohe" value="A" /> A</label>
                                    <label><input type="radio" data-rule-required="true" data-msg-required="请填写考核" id="kaohe" name="kaohe" value="B" /> B</label>
                                    <label><input type="radio" data-rule-required="true" data-msg-required="请填写考核" id="kaohe" name="kaohe" value="C" /> C</label>
                                    <label><input type="radio" data-rule-required="true" data-msg-required="请填写考核" id="kaohe" name="kaohe" value="D" /> D</label>
                                </div>
                                <script>
                                    $(".class_kaohe16 :radio[value='<%= Info.html(mmm.get("kaohe")) %>']").prop("checked", true);
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">教师<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_jiaoshi17"
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
                                    $(".class_jiaoshi17").val($(".class_jiaoshi17").attr("data-value"));
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

