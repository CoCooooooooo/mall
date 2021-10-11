<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>base</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/file.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/zshop.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />
    <script>

    </script>
</head>

<body>
<div class="panel panel-default" id="userPic">
    <div class="panel-heading">
        <h3 class="panel-title">订单管理</h3>
    </div>
    <div class="panel-body">
        <input type="button" value="添加订单" class="btn btn-primary" id="doAddPro">
        <br>
        <br>
        <div class="show-list text-center" >
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">编号</th>
                    <th class="text-center">订单批次号</th>
                    <th class="text-center">价格</th>
                    <th class="text-center">日期</th>
                    <th class="text-center">用户</th>
                    <th class="text-center">用户电话</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${pageInfo.list}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.code}</td>
                    <td>${order.price}</td>
                    <td>${order.cDate}</td>
                    <td>${order.userId.name}</td>
                    <td>${order.userId.phone}</td>
                    <td class="text-center">
                        <input type="button" class="btn btn-warning btn-sm doProModify" value="修改" onclick="showProduct(${product.id})">
                        <input type="button" class="btn btn-warning btn-sm doProDelete" value="删除" onclick="showDeleteModal(${product.id})">
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 添加商品 start -->
<div class="modal fade" tabindex="-1" id="Product">
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/base/order/addorder" class="form-horizontal" method="post" enctype="multipart/form-data" id="frmAddProduct">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加订单</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="product-price" class="col-sm-4 control-label">商品价格：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-price" name="price">
                            </div>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="product-number" class="col-sm-4 control-label">商品数量：</label>--%>
                            <%--<div class="col-sm-8">--%>
                                <%--<input type="text" class="form-control" id="product-number" name="number">--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <div class="form-group">
                            <label for="user" class="col-sm-4 control-label">用户详情：</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="user" id="user">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${user}" var="user">
                                        <option value="${user.id}">${user.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 添加商品 end -->

</body>

</html>