<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title>
</head>
<body>
<!--  enctype="multipart/form-data" 表示以二进制的数据格式来传输  -->
<form class="registForm" enctype="multipart/form-data"> 
	<table border="1px" cellspacing="0" cellpadding="10px" align="center">
		<tr>
			<td colspan="3" align="center"><h1>注册页面</h1></td>
		</tr>
		<tr>
			<td>姓名</td>
			<td>
				<input type="text" name="username" class="username" value="${user.username}"
					onblur="validateName('${pageContext.request.contextPath}')"  />
				<span class="namemsg"></span>
			</td>
		</tr>
		<tr>
			<td>生日</td>
			<td>
				<input type="date" name="birthday" class="birthday"
					value="<fmt:formatDate value='${user.birthday}' pattern='yyyy-MM-dd' />" />
			</td>
		</tr>
		<tr>
			<td>性别</td>
			<td>
				<c:if test="${user.sex eq 1}">
					<script type="text/javascript">
						$(".boy").prop("checked",true);
					</script>
				</c:if>
				<c:if test="${user.sex eq 2}">
					<script type="text/javascript">
						$(".girl").prop("checked",true);
					</script>
				</c:if>
				<input type="radio" name="sex" value="1" class="boy"/>男
				<input type="radio" name="sex" value="2" class="girl"/>女
			</td>
		</tr>
		<tr>
			<td>地址</td>
			<td>
				<input type="text" name="address" class="address" value="${user.address}"/>
			</td>
		</tr>
		<tr>
			<td>头像</td>
			<td>
				<img name="pic" class="pic" src="${user.pic}" width="64px" height="auto"/>
				<br/>
				<input type="file" name="user_pic" onchange="showPreview(this)"/>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="button" onclick="registController('${pageContext.request.contextPath}')" value="注册"/>&nbsp;&nbsp;
				<input type="reset" value="重置"/>
			</td>
		</tr>
	</table>
</form>
</body>
<script type="text/javascript">
function showPreview(source){
	var file = source.files[0];
	if(window.FileReader){
		var fr = new FileReader();
		fr.onloadend = function(e){
			$(".pic").css({"width":"64px","height":"auto"});
			$(".pic").attr("src",e.target.result);
		}
		fr.readAsDataURL(file);
	}
}
</script>
</html>