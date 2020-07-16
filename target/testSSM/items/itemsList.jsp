<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品列表</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<script src="${pageContext.request.contextPath}/js/items.js"></script>
</head>
<body>
<div style="padding: 0 20px">
	<div class="row">
		<div class="col-md-6 col-lg-6">
			<div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="queryByName('${pageContext.request.contextPath}')">查找</button>
                    </span>
				<input type="text" class="form-control" placeholder="Search by name" id="searchName" value="${vo.query}">
			</div>
		</div>
		<div class="col-md-4 col-lg-4">
			<a href="addItem.jsp" class="btn btn-success">增加商品</a>
			<input class="btn btn-danger" type="button" value="删除所有" onclick="deleteAll()">
		</div>
	</div>
	<div class="row" style="margin-top: 20px">
		<table class="table table-bordered">
			<tr align="center">
				<th style="text-align:center"><input type="checkbox" class="choose_all"></th>
				<th style="text-align:center">商品编号</th>
				<th style="text-align:center">商品名称</th>
				<th style="text-align:center">商品描述</th>
				<th style="text-align:center">商品价格</th>
				<th style="text-align:center">生产日期</th>
				<th style="text-align:center">商品图片</th>
				<th style="text-align:center">操作</th>
			</tr>
			<c:forEach items="${vo.itemsList}" var="items">
				<tr class="data" align="center">
					<td class="datachoose"><input type="checkbox" class="single"></td>
					<td class="id">${items.id}</td>
					<td>${items.name}</td>
					<td>${items.detail}</td>
					<td>${items.price}</td>
					<td><fmt:formatDate value="${items.createtime}" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:if test="${items.pic!=null && items.pic!=''}">
							<img src="${items.pic}" width="64px" height="auto"/>
						</c:if>
					</td>
					<td>
                        <%-- javascript:void(0) 超链接原来的href跳转失效 --%>
						<a href="${pageContext.request.contextPath}/items/findOne.action?id=${items.id}" class="btn btn-info">修改</a>|
						<a href="${pageContext.request.contextPath}/items/delete.action?id=${items.id}" class="btn btn-danger">删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan="8">
					<input class="btn btn-success" type="button" value="首页"
						   onclick="firstPage('${pageContext.request.contextPath}')"/>&nbsp;&nbsp;
					<input class="btn btn-success" type="button" id="pre" value="上一页"
						   onclick="prePage('${pageContext.request.contextPath}',${vo.myPages})"/>&nbsp;&nbsp;
					<!-- 当前页 -->
					<input type="text" id="pageNow" value="${vo.pageNow}" style="text-align:center"/>&nbsp;&nbsp;
					<input class="btn btn-success" type="button" value="跳转"
						   onclick="skipPage('${pageContext.request.contextPath}',${vo.myPages})"/>&nbsp;&nbsp;
					<input class="btn btn-success" type="button" id="next" value="下一页"
						   onclick="nextPage('${pageContext.request.contextPath}',${vo.myPages})"/>&nbsp;&nbsp;
					<input class="btn btn-success" type="button" value="末页"
						   onclick="lastPage('${pageContext.request.contextPath}',${vo.myPages})"/>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
<script>

	/* 删除所有 */
	function deleteAll(){
		var str = "";
		//迭代遍历所有的checkbox
		$(".single").each(function(){
			//判断当前的checkbox是否是被选中的状态  true选中
			if($(this).prop("checked")){
				var text = $(this).parents(".data").find(".id").text();
				//id=1&id=2&
				str = str + "id="+text +"&";
			}
		});
		//id=1&id=2
		str = str.substr(0,str.length-1)
		//  url?id=1&id=2
		window.location.href="${pageContext.request.contextPath}/items/delete.action?"+str
	}
</script>
</html>