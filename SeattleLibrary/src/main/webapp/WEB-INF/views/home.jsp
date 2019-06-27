<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Top</title>
	<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />">
</head>
<body>
<div>
	<header>
		<a href="<%= request.getContextPath()%>/" style="margin-left:8px; text-decoration:none; float:right;"><img src="resources/image/log.png" class="icon1" style="margin-right:8px;"><li style="list-style:none;">ログアウト</li></a>
	</header>
	<div class="m">
	 <h1 style="margin-bottom:30px; display:inline-block; font-size:70px;"><span style="color:red; font-family: 'Source Serif Pro', serif;">S</span><span style="color:#0000ff; font-family: 'Source Serif Pro', serif;">e</span><span style="color:#ffa500; font-family: 'Source Serif Pro', serif;">a</span><span style="color:red; font-family: 'Source Serif Pro', serif;">t</span><span style="color:#00ffff; font-family: 'Source Serif Pro', serif;">t</span><span style="color:blue; font-family: 'Source Serif Pro', serif;">l</span><span style="color:#000000; font-family: 'Source Serif Pro', serif;">e</span></h1>
		<form action="search" method="post">
		<div class="key2">
		<input name="keyword" type="search" placeholder="検索画面" class="main_search" style="border:1px solid #b0c4de; background:white;" required>
		</div>
		<input type="hidden" value="" style="vertical-align:top; margin-right:30px; margin-top:37px;　border-bottom:1px solid #b0c4de;">
		</form>
		<ul>
		<a href="<%= request.getContextPath()%>/home1" class="menu0" style="text-decoration:none; display:inline-block;"><li class="menu3">書籍管理</li></a>
		<a href="<%= request.getContextPath()%>/bookAdd" class="menu0" style="text-decoration:none;  display:inline-block;"><li class="menu3">書籍追加</li></a>
		</ul>
	</div>
</div>
</body>
</html>
