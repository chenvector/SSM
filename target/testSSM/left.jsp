<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<ul>
	<li onclick="login()">登陆</li>
	<li onclick="regist()">注册</li>
	<li onclick="logout('${pageContext.request.contextPath}')">退出</li>
	<li onclick="viewAll('${pageContext.request.contextPath}')">查看所有</li>
</ul>