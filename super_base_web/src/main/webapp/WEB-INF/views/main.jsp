<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>校园超市-后台管理系统</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/index.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script type="text/javascript">
        $(function(){
            // 点击切换页面
            $("#product-type-set").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/productType/findAll");
            });
            $("#product-set").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/product/findAll");
            });
            $("#product-info").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/product/findInfo");
            });
            $("#product-sale").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/product/findSale");
            });
            $("#productOrder-set").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/order/findAll");
            });
            $("#user-set").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/user/findAll");
            });
            $("#manager-set").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/base/sysuser/findAll");
            });
        });
    </script>
</head>

<body>
<div class="wrapper-cc clearfix">
    <div class="content-cc">
        <!-- header start -->
        <div class="clear-bottom head">
            <div class="container head-cc">
                <p>校园超市<span>后台管理系统</span></p>
                <div class="welcome">
                    <div class="left">欢迎您：</div>
                    <div class="right">jiaxuan</div>
                    <div class="exit">退出</div>
                </div>
            </div>
        </div>
        <!-- header end -->
        <!-- content start -->
        <div class="container-flude flude-cc" id="a">
            <div class="row user-setting">
                <div class="col-xs-2 user-wrap">
                    <ul class="list-group">
                        <li class="list-group-item active" name="userSet" id="product-type-set">
                            <i class="glyphicon glyphicon-lock"></i> &nbsp;商品类型管理
                        </li>
                        <li class="list-group-item" name="userPic" id="product-set">
                            <i class="glyphicon glyphicon-shopping-cart"></i> &nbsp;商品管理
                        </li>
                        <li class="list-group-item" name="productInfo" id="product-info">
                            <i class="glyphicon glyphicon-home"></i> &nbsp;库存查询
                        </li>
                        <li class="list-group-item" name="productSale" id="product-sale">
                            <i class="glyphicon glyphicon-gift"></i> &nbsp;销售统计
                        </li>
                        <li class="list-group-item" name="userOrder" id="productOrder-set">
                            <i class="glyphicon glyphicon-phone"></i> &nbsp;订单历史采购
                        </li>

                        <li class="list-group-item" name="userInfo" id="user-set">
                            <i class="glyphicon glyphicon-user"></i> &nbsp;用户管理
                        </li>
                        <li class="list-group-item" name="adminSet" id="manager-set">
                            <i class="glyphicon glyphicon-globe"></i> &nbsp;系统用户管理
                        </li>
                    </ul>
                </div>
                <div class="col-xs-10" id="userPanel">
                    <iframe id="frame-id" src="${pageContext.request.contextPath}/base/productType/findAll" width="100%" height="100%" frameborder="0" scrolling="no">
                    </iframe>
                </div>

            </div>
        </div>
        <!-- content end-->
    </div>
</div>
<!-- footers start -->
<div class="footer">
    @(jiaxuan)@
</div>
<!-- footers end -->
</body>

</html>
