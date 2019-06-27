<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>新規アカウント</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Volkhov&display=swap" rel="stylesheet">
</head>
<body>
	<div class="main-image" style="height:680px;">
		<header>
			<div class="head">
				  	<a href="<%= request.getContextPath()%>/" style="text-decoration:none;">
				  	<p><img src="resources/image/seattle.png" class="icon"></p>
				  	<p class="seattle" style="font-size:25px; font-weight:bold; font-family: 'Volkhov', serif;">SeattleLibrary</p></a>
			</div>
		</header>

		<div class="main">
				<form action="account" method="post" accept-charset="UTF8" >
						<div style="font-size;">
						<input class="newmail" type="text" name="name" placeholder="名前" style="display:block; padding:8px; border:none; margin-top:120px;" required><hr width="80%">
						<input class="newmail" type="email" name="mailname" placeholder="メールアドレス" style="display:block; padding:8px; border:none; margin-top:30px;" required><hr width="80%">
						<input type="password" min="8" name="password1" placeholder="パスワード" style="display:block; padding:8px; border:none; margin-top:30px;" required><hr width="80%">
						<input type="password" min="8" name="password2" placeholder="もう一度パスワードを入力してください" style="display:block; padding:8px; border:none; margin-top:30px;" required><hr width="80%">
						<input type="submit" value="作成" class="logbut" style="background-color:#4682b4; border-radius: 30px; font-size:15px; margin:50px 105px 10px; color:white;">
					</div>
				</form>
			<c:if test="${!empty resultMessage}">
				<div style="color:red;font-weight: bold; ">${resultMessage}</div>
			</c:if>
				<div class="foot1">
					<p><a href="<%= request.getContextPath()%>/" style="font-size:13px;　float:left;">▶︎ログインはこちら︎</a></p>
				</div>
		</div>
	</div>
</body>
</html>