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
                    return '${pageContext.request.contextPath}/base/product/findAll?pageNum='+page;
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
            });


            //上传图像预览
            $('#file').on('change',function() {
                $('#img').attr('src', window.URL.createObjectURL(this.files[0]));
            });
            $('#file').on('change',function() {
                $('#img2').attr('src', window.URL.createObjectURL(this.files[0]));
            });
        });

        //服务端提示消息
        var successMsg='${successMsg}';
        var errorMsg='${errorMsg}';
        if(successMsg!=''){
            layer.msg(successMsg,{
                time:2000,
                skin:'successMsg'
            })
        }
        if(errorMsg!=''){
            layer.msg(errorMsg,{
                time:2000,
                skin:'errorMsg'
            })
        }
        //显示商品信息
        function showProduct(id) {
            $.post(
                '${pageContext.request.contextPath}/base/product/findById',
                {'id':id},
                function (result) {
                    if (result.status==1){
                        $('#pro-number').val(result.data.number);
                        $('#pro-name').val(result.data.name);
                        $('#pro-num').val(result.data.id);
                        $('#pro-price').val(result.data.price);
                        $('#pro-TypeId').val(result.data.productType.id);
                        $('#img2').attr('src','${pageContext.request.contextPath}/base/product/getImage?path='+result.data.image);
                    }
                }
            )
        }
        //显示删除模态框
        function showDeleteModal(id){
            $('#deleteProductId').val(id);
            $('#deleteProductModal').modal('show');
        }
        //显示卖出模态框
        function showSaleProduct(id){
            $('#saleProductId').val(id);
            $('#saleProductModal').modal('show');
        }

        function saleProduct() {
            var id =$("#ids").val();
            var number =$("#numbers").val();
            $.post(
                '${pageContext.request.contextPath}/base/product/updateNumber',
                {'id':id,number:number},
                function (result) {
                    if (result.success){
                        layer.closeAll();
                        layer.msg('销售成功');
                    }else {
                        layer.msg('失败')
                    }
                }
            )
        }

        //删除商品
        function deleteProduct(){
            $.post(
                '${pageContext.request.contextPath}/base/product/removeById',
                {'id':$('#deleteProductId').val()},
                function(result){
                    if(result.status==1){
                        layer.msg('删除成功',{
                            time:2000,
                            skin:'successMsg'
                        })
                    }
                }
            )
        }


    </script>
</head>

<body>
<div class="panel panel-default" id="userPic">
    <div class="panel-heading">
        <h3 class="panel-title">商品管理</h3>
    </div>
    <div class="panel-body">
        <input type="button" value="添加商品" class="btn btn-primary" id="doAddPro">
        <br>
        <br>
        <div class="show-list text-center" >
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">图片</th>
                    <th class="text-center">编号</th>
                    <th class="text-center">商品批次号</th>
                    <th class="text-center">商品</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">价格</th>
                    <th class="text-center">商品详情</th>
                    <th class="text-center">产品类型</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">生产日期</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${pageInfo.list}" var="product">
                <tr>
                    <td>
                    <img src="${product.image}" class="img-responsive">
                    </td>
                    <td>${product.id}</td>
                    <td>${product.batch}</td>
                    <td>${product.name}</td>
                    <td>${product.number}</td>
                    <td>${product.price}</td>
                    <td>${product.info}</td>
                    <td>${product.productType.name}</td>
                    <td>
                        <c:if test="${product.productType.status==1}">有效商品</c:if>
                        <c:if test="${product.productType.status==0}">无效商品</c:if>
                    </td>
                    <td>${product.pDate}</td>
                    <td class="text-center">
                        <input type="button" class="btn btn-info btn-sm saleProduct" value="卖出" onclick="showSaleProduct(${product.id})">
                        <input type="button" class="btn btn-primary btn-sm doProModify" value="修改" onclick="showProduct(${product.id})">
                        <input type="button" class="btn btn-warning btn-sm doProDelete" value="删除" onclick="showDeleteModal(${product.id})">
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- 使用bootstrap-paginator实现分页 -->
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加商品 start -->
<div class="modal fade" tabindex="-1" id="Product">
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/base/product/add" class="form-horizontal" method="post" enctype="multipart/form-data" id="frmAddProduct">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="product-name" class="col-sm-4 control-label">商品名称：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-price" class="col-sm-4 control-label">商品价格：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-price" name="price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-number" class="col-sm-4 control-label">商品数量：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-number" name="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-info" class="col-sm-4 control-label">商品描述：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="product-info" name="info">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="file" class="col-sm-4 control-label">商品图片：</label>
                            <div class="col-sm-8">
                                <a href="javascript:;" class="file">选择文件
                                    <input type="file" name="file" id="file">
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-type" class="col-sm-4 control-label">商品类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="productTypeId" id="product-type">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${productTypes}" var="productType">
                                        <option value="${productType.id}">${productType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <!-- 显示图像预览 -->
                        <img style="width: 160px;height: 180px;" id="img">
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

<!-- 修改商品 start -->
<div class="modal fade" tabindex="-1" id="myProduct">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="" class="form-horizontal">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pro-num" class="col-sm-4 control-label">商品编号：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pro-num" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-name" class="col-sm-4 control-label">商品名称：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pro-name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-number" class="col-sm-4 control-label">商品数量：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pro-number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-price" class="col-sm-4 control-label">商品价格：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pro-price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pro-image" class="col-sm-4 control-label">商品图片：</label>
                            <div class="col-sm-8">
                                <a class="file">
                                    选择文件 <input type="file" name="file" id="pro-image">
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-type" class="col-sm-4 control-label">商品类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${productTypes}" var="productType">
                                        <option value="${productType.id}">${productType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <!-- 显示图像预览 -->
                        <img style="width: 160px;height: 180px;" id="img2">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary updatePro">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
    <!-- 修改商品 end -->
</div>

<!-- 出库 start -->
<div class="modal fade" tabindex="-1" id="saleProductModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form>
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">出售商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">
                        <div class="form-group">
                            <label for="numbers" class="col-sm-4 control-label">商品数量：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="numbers" name="numbers">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer" id="saleProductId">
                    <button class="btn btn-primary salePro" onclick="saleProduct()" data-dimiss="modal">卖出</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
    <!-- 修改商品 end -->
</div>

<!-- 确认删除 start -->
<div class="modal fade" tabindex="-1" id="deleteProductModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body text-center row">
                <h4>确认要删除该商品吗</h4>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deleteProductId">
                <button class="btn btn-primary updatePro" onclick="deleteProduct()" data-dimiss="modal">确认</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除 end -->

</body>

</html>