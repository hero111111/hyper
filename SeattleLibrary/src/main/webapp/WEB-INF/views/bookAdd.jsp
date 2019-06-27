<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>本の追加</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" type="text/css">
	<link href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../team19/resources/js/display.js" /></script>
</head>
<body style="margin-right:15px;">
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
	<div class="num">
		<a href="<%= request.getContextPath()%>/home"><p>HOME</p></a>
		<p> > </p>
		<p>書籍データの追加</p>
	</div>
	<div class="body">
	<c:if test="${!empty items}">
		<c:forEach var="item" items="${items}">
		<form action="<%=request.getContextPath()%>/confirm" method="post" enctype="multipart/form-data" id="data_upload_form">
		<div class="type">
			<ul  style="padding:0;">
				<li style="margin-top:20px;">書籍の写真</li>
				<li style="font-size:7px; background-color:red; padding:0 10px; margin-left:55px; color:white;">必須</li>
			</ul>
			<img src="../team19/resources/get_image/${item.get("images")}" style="width:180px;">
			<input type="file" id="upload_file" name="upload_file" style="margin-top:30px;">
		</div>
		<div class="all" style="float:left; margin-left:20px; margin-top:20px;">
			<div class="addcontainer">
				<ul><li class="ti">タイトル</li><li class="care care2" >必須</li></ul>
					<input class="get" type="text" name="book_title" placeholder="タイトル" value=${item.get("book_title")} required><hr>
			</div>
			<div class="addcontainer">
				<ul><li class="ti">著者名</li><li class="care care2">必須</li></ul>
					<input class="get" type="text" name="author" placeholder="著者名" value=${item.get("author")} required><hr>
			</div>
			<div class="addcontainer">
				<ul><li class="ti">出版社</li><li class="care care1">任意</li></ul>
					<input class="get" type="text" name="publish" placeholder="出版社" value=${item.get("publish")}><hr>
			</div>
			<div class="addcontainer">
				<ul><li class="ti">説明文</li><li class="care care1">任意</li></ul>
					<input class="get" type="text" name="explain" placeholder="説明文" value=${item.get("explain")}><hr>
			</div>
		</div>
		<div><button type="submit" name="book_id" value = ${item.get("book_id")} style="padding:15px 90px; margin-top:60px; border-radius:30px; background-color:#4169e1; color:white;　text-align:center; font-size:15px;">保存</button></div>
		</form>
		</c:forEach>
	</c:if>
	<c:if test="${empty items}">
		<form action="<%=request.getContextPath()%>/insert" method="post" enctype="multipart/form-data" id="data_upload_form">
		<div class="type">
			<ul  style="padding:0;">
				<li style="margin-top:20px;">書籍の写真</li>
				<li style="font-size:7px; background-color:red; padding:0 10px; margin-left:55px; color:white;">必須</li>
			</ul>
			<div class="preview"></div>
			<input type="file" id="upload_file" name="upload_file" accept="img/*" style="margin-top:30px;" required>
		</div>
		<div class="all" style="float:left; padding-left:20px; margin-top:20px;">
			<div class="addcontainer">
				<ul><li class="ti">タイトル</li><li class="care care2">必須</li></ul>
					<input class="get" type="text" name="book_title" placeholder="タイトル" autocomplete="off" required><hr>
			</div>
			<div class="addcontainer">
				<ul><li class="ti">著者名</li><li class="care care2">必須</li></ul>
					<input class="get" type="text" name="author" placeholder="著者名" autocomplete="off" required><hr>
			</div>
			<div class="addcontainer">
				<ul><li class="ti">出版社</li><li class="care care1">任意</li></ul>
					<input class="get" type="text" name="publish" placeholder="出版社"><hr>
			</div>
			<div class="addcontainer">
				<ul><li class="ti">説明文</li><li class="care care1">任意</li></ul>
					<input class="get" type="text" name="explain" placeholder="説明文"><hr>
			</div>
		</div>
		<div><button type="submit" style="padding:15px 90px; margin-top:60px; border-radius:30px; background-color:#4169e1; color:white; text-align:center; font-size:15px;">作成</button></div>
		</form>
	</c:if>
	</div>
</body>
</html>
