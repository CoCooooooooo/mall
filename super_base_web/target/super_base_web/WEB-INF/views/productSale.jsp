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
        $(function(){

            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion:3,
                currentPage:${pageInfo.pageNum},
                totalPages:${pageInfo.pages},
                pageUrl:function(type,page, current){
                    return '${pageContext.request.contextPath}/base/product/findSale?pageNum='+page;
                },
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            })
        })


    </script>
</head>

<body>
<div class="panel panel-default" id="userPic">
    <div class="panel-heading">
        <h3 class="panel-title">销售统计</h3>
    </div>
    <div class="panel-body">
        <div class="show-list text-center" >
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">商品批次号</th>
                    <th class="text-center">商品</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">已售</th>
                    <th class="text-center">价格</th>
                    <th class="text-center">商品详情</th>
                    <th class="text-center">产品类型</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${pageInfo.list}" var="product">
                <tr>
                    <td>${product.batch}</td>
                    <td>${product.name}</td>
                    <td>${product.number}</td>
                    <td>${product.saleNumber}</td>
                    <td>${product.price}</td>
                    <td>${product.info}</td>
                    <td>${product.productType.name}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- 使用bootstrap-paginator实现分页 -->
            <ul id="pagination"></ul>
        </div>
    </div>
</div>
</body>

</html>