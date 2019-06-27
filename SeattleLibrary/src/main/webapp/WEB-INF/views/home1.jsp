<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>詳細</title>
	<link
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
	<link href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
</script>
</head>
<body>
<header>
	<div class="top3"><a href="<%= request.getContextPath()%>/home" style="text-decoration:none;">
			<p><img src="resources/image/seattle.png" class="icon2" ></p>
			<h1 style="margin:0;">SeattleLibrary</h1></a></div>
	<ul class="top-right">
	<form action="search" method="post" style="display:inline-block;">
		<input name="keyword" type="search" placeholder="検索..." class="search1" style="border:1px solid #b0c4de;" required><i class="fas fa-search"></i>
		<input type="submit" value="検索" style="vertical-align:top; background:none; border:0; color:white;">
	</form>
		<a href="<%= request.getContextPath()%>/home1" class="menu"><li>書籍管理</li></a>
		<a href="<%= request.getContextPath()%>/bookAdd" class="menu-bar"><li>書籍追加</li></a>
		<a href="<%= request.getContextPath()%>/" style="margin-left:8px;"><li>ログアウト</li></a>
	</ul>
</header>

<div class="heads">
	<img src="resources/image/read.jpg" style="height:650px; z-index: 100; position:absolute; top:100; right:50;">
	<div style="background-color:#191960; width:100%; position:absolute; top:250;">
	<img src="resources/image/books00.jpg" style="width:100%; height:300px; opacity:.2;">
	</div>
	<h1 style="position:relative; color:white; z-index:100; font-size:80px;">Let's read the book.</h1>
</div>
<div class="main">
<div class="num1">
	<h1>最新の本追加</h1>
</div>
<div class="mains">
	<c:forEach var="item" items="${items}">
		<div class="contents">
		<form action="details" method="post" style="text-align:center;">
			<a href="javascript:void(0)" onclick="this.parentNode.submit();" style=" height:200px;">
			<img src="../team19/resources/get_image/${item.get("images")}" style="width:180px; height:250px; clear:both; ">
			</a>
		<input value=${item.get("book_id")} type="hidden" name="book_id">
		</form>
		</div>
	</c:forEach>
	</div>

	<div class="num1">
		<h1>Major</h1>
	</div>
	<div class="mains">
		<c:forEach var="m" begin="0" end="15" items="${i}">
			<div class="contents">
			<form action="details" method="post" style="text-align:center;">
				<a href="javascript:void(0)" onclick="this.parentNode.submit();" style=" height:200px;">
				<img src="../team19/resources/get_image/${m.get("i")}" style="width:180px; height:250px; clear:both; ">
				</a>
			<input value=${m.get("book_id")} type="hidden" name="book_id">
			</form>
			</div>
		</c:forEach>
	</div>

	<div class="num2">
		<h1>おすすめ本</h1>
	</div>
	<div class="center">
		<div class="con">
			<form action="details" method="post" style="text-align:center;">
				<a href="javascript:void(0)" onclick="this.parentNode.submit();" style=" height:200px;">
				<img src="../team19/resources/image/aws.jpg" style="width:180px; height:250px; clear:both; ">
				</a>
			</form>
		</div>
		<div class="con">
			<form action="details" method="post" style="text-align:center;">
				<a href="javascript:void(0)" onclick="this.parentNode.submit();" style=" height:200px;">
				<img src="../team19/resources/image/java.jpg" style="width:180px; height:250px; clear:both; ">
				</a>
			</form>
		</div>
		<div class="con">
				<form action="details" method="post" style="text-align:center;">
					<a href="javascript:void(0)" onclick="this.parentNode.submit();" style=" height:200px;">
					<img src="../team19/resources/image/web1.jpg" style="width:180px; height:250px; clear:both; ">
					</a>
				</form>
		</div>
	</div>

	<div class="num1">
		<h1>キングダム</h1>
	</div>
	<div class="mains">
		<c:forEach var="k" begin="0" end="15" items="${t}">
			<div class="contents">
			<form action="details" method="post" style="text-align:center;">
				<a href="javascript:void(0)" onclick="this.parentNode.submit();" style=" height:200px;">
				<img src="../team19/resources/get_image/${k.get("images")}" style="width:180px; height:250px; clear:both; ">
				</a>
			<input value=${k.get("book_id")} type="hidden" name="book_id">
			</form>
			</div>
		</c:forEach>
	</div>
  </div>

<footer style="height:230px; background-color:#191960;">

</footer>
</body>
</html>