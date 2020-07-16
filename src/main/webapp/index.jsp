<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="css/index.css"/> 
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</head>
<body style="letter-spacing: -8px">
	<div class="head" style="width: 1200px;height: 200px;background-color: olive">
		<%@ include file="head.jsp" %>
	</div>
	<div class="left" style="width: 300px;height: 400px;background-color: lightblue;display:inline-block">
		<%@ include file="left.jsp" %>
	</div>
	<div class="main"  style="width: 900px;height: 400px; background-color: orange;display:inline-block;vertical-align: top">
		<%@ include file="main.jsp" %>
	</div>
	<div class="foot" style="width: 1200px;height: 100px;background-color: olive;">
		<%@ include file="foot.jsp" %>
	</div>
</body>
</html>