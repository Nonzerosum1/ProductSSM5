<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表</title>

<script type="application/javascript" src="jQuery/jquery-1.11.1.js"></script>
<link type="text/css" rel="stylesheet" href="jQuery/bootstrap_3.3.0/css/bootstrap.min.css">
<script type="application/javascript" src="jQuery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="a/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<script type="text/javascript">
	$(function (e) {
		
		$("#submitBtn").click(function () {
			var arr = new Array();
			$.each($("#classify :checkbox:checked"),function(i){
				arr[i] = $(this).val();
			});
			var vals = arr.join(",");
			
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/insertProduct.do",
				//data : "username="+$("#username").val()+"&password="+$("#password").val(),
				data : {
					"name" : $("#name").val(),
					"price" : $("#price").val(),
					"createtime" : $("#createtime").val(),
					"detail" : $("#detail").val(),
					"cids" : vals
				},
				beforeSend : function () {
					return true;
				},
				success : function (jsonObj) {
					if(jsonObj){
						window.location.href="${pageContext.request.contextPath}/queryProducts.do";
					}else{
						alert("添加失败");
					}
				}
			});
		});
	});
</script>
<!-- Modal增加信息 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加产品</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="name" class="col-sm-2 control-label">商品名称</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="price" class="col-sm-2 control-label">商品价格</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="price">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="createtime" class="col-sm-2 control-label">入库时间</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="createtime" onclick="WdatePicker()">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="detail" class="col-sm-2 control-label">商品描述</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="detail">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="detail" class="col-sm-2 control-label">商品分类</label>
			    <div class="col-sm-10" id="classify">
			       <label class="checkbox-inline">
				      <input type="checkbox" id="inlineCheckbox1" value="1"> 手机
				   </label>
				   <label class="checkbox-inline">
				      <input type="checkbox" id="inlineCheckbox2" value="2"> 电子产品
				   </label>
				   <label class="checkbox-inline">
				      <input type="checkbox" id="inlineCheckbox3" value="3"> 电脑
				   </label>
 			    </div>
			  </div>
		 </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="submitBtn" data-dismiss="modal">提交</button>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid">
	<div class="row">
		<h3 class="text-center">产品列表</h3>
	</div>
	<div class="row">
	<table class="table table-striped table-hover">
	<thead>
		<tr style="color: #B3B3B3;" class="text-center">
			<td>商品名称</td>
			<td>商品价格</td>
			<td>入库时间</td>
			<td>商品描述</td>
			<td>商品分类</td>
			<td>
				操作 
				<!-- <a class="btn btn-info btn-sm active" href="insert-form.jsp" role="button">添加</a> -->
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
				  添加
				</button>
			</td>
	</tr>
	</thead>
	
	<c:forEach items="${products }" var="product">
		<tr class="text-center">
			<td>${product.name }</td>
			<td>${product.price }</td>
			<td>${product.createtime }</td>
			<td>${product.detail }</td>
			<td>
				<c:forEach items="${product.categories }" var="category">
					${category.name }
				</c:forEach>
			</td>
			<td>
				<a class="btn btn-primary btn-sm active" href="getUpdateForm.do?id=${product.id }" role="button">修改</a>&nbsp;
				<a class="btn btn-danger btn-sm active" href="deleteProduct.do?id=${product.id }" role="button">删除</a>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</div>


</body>
</html>