<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/19 0019
  Time: 下午 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园超市-后台管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css" />t>
</head>
<body>
<!-- 使用自定义css样式 div-signin 完成元素居中-->
<div class="container div-signin">
    <div class="panel panel-primary div-shadow">
        <!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
        <div class="panel-heading">
            <h3>校园超市管理系统</h3>
            <span>SuperMarket Manager System</span>
        </div>
        <div class="panel-body">
            <!-- login form start -->
            <form action="${pageContext.request.contextPath}/base/sysuser/login" class="form-horizontal" method="post" id="frmLogin">
                <div class="form-group">
                    <label class="col-sm-3 control-label">用户名：</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="text" placeholder="请输入用户名" name="loginName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="password" placeholder="请输入密码" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-9 padding-left-0">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary btn-block">登&nbsp;&nbsp;陆</button>
                        </div>
                        <div class="col-sm-4">
                            <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
                        </div>
                        <div class="col-sm-4">
                            <button type="button" class="btn btn-link btn-block">忘记密码？</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- login form end -->
        </div>
    </div>
</div>
<!-- 页尾 版权声明 -->
<div class="container">
    <div class="col-sm-12 foot-css">
        <p class="text-muted credit">
            Copyright jiaxuan 版权所有
        </p>
    </div>
</div>

</body>
</html>
