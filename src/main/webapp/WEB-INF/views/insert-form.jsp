<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加信息</title>
<link rel="stylesheet" type="text/css" href="a/css/index1.css" />
<script type="text/javascript" src="a/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<table>
	<form action="insertProduct.do" method="post">
	<tr>
		<td>商品名称</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>商品价格</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>入库时间</td>
		<td><input type="text" name="createtime" onclick="WdatePicker()"></td>
	</tr>
	<tr>
		<td>商品描述</td>
		<td><input type="text" name="detail"></td>
	</tr>
	<tr>
		<td><input type="submit" value="提交"></td>
	</tr>
	</form>
</table>
</body>
</html>