<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%@ include file="head.jsp" %>


<script src="js/jquery.validate.js"></script>

<div class="container" style="max-width: 640px">
    <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">修改密码:</div>
        <div class="panel-body">
            <form action="login?ac=adminuppass" method="post" name="form1" id="form1">
                <!-- form 标签开始 -->

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">原密码<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" autocomplete="off" placeholder="请输入原密码" required="true" data-msg-required="请输入原密码" name="ymm" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">新密码<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="password"
                                class="form-control"
                                autocomplete="off"
                                placeholder="请输入新密码"
                                required="true"
                                data-msg-required="请输入新密码"
                                id="xmm"
                                name="xmm1"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">确认密码<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="password"
                                class="form-control"
                                autocomplete="off"
                                placeholder="请输入确认密码"
                                required="true"
                                data-msg-required="请输入确认密码"
                                equalto="#xmm"
                                name="xmm2"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                    <button type="reset" class="btn btn-default" name="Submit2">重置</button>
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

<%@ include file="foot.jsp" %>

