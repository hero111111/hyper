<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>拡大</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/css1.css" />" type="text/css">
</head>
<body>
<header>
	<div class="top"><a href="<%= request.getContextPath()%>/home" style="text-decoration:none;">
			<p style="margin-bottom:0; margin-right:10px;"><img src="resources/image/seattle.png" class="icon" ></p>
			</a></div>
	<ul class="top-right">
	<form action="search" method="post" style="display:inline-block;">
		<input name="keyword" type="search" placeholder="検索..." class="search1" style="border:1px solid #b0c4de;" required><i class="fas fa-search"></i>
		<input type="submit" style="vertical-align:top; background:none; border:0; color:white;">
	</form>
		<a href="<%= request.getContextPath()%>/home1" class="menu"><li>書籍管理</li></a>
		<a href="<%= request.getContextPath()%>/bookAdd" class="menu-bar"><li>書籍追加</li></a>
		<a href="<%= request.getContextPath()%>/" style="margin-left:8px;"><li>ログアウト</li></a>
	</ul>
</header>
</body>
</html>
