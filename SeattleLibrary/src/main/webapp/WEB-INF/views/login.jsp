<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>ログイン</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Volkhov&display=swap" rel="stylesheet">
</head>
<body>
	<div class="main-image" style="height:580px;">
	  <header>
		  	<div class="head">
			  	<a href="<%= request.getContextPath()%>/" style="text-decoration:none;">
			  	<p><img src="resources/image/seattle.png" class="icon"></p>
			  	<p class="seattle" style="font-size:25px; font-weight:bold; font-family: 'Volkhov', serif;">SeattleLibrary</p></a>
		  	</div>
	  </header>
	<div class="main">
			<form action="login" method="post" accept-charset="UTF8">
				<div style="padding-top:20px; ">
					<input class="mail" type="email"name="mail" placeholder="メールアドレス" autocomplete="off" style="display:block; padding:8px; border:none;" required><hr width="80%">
					<input type="password" name="pass" placeholder="パスワード" style="display:block; padding:8px; border:none; margin-top:40px;" required><hr width="80%">
					<input type="submit" name="login" value="ログイン" class="logbut" style="background-color:#191970; border-radius: 30px; font-size:15px; margin-top:70px; color:white;"></div>
			</form>
		<c:if test="${!empty resultMessage}">
			<div style="color: red; font-weight: bold;">${resultMessage}</div>
		</c:if>
		<div class="foot1">
			<a href="<%= request.getContextPath()%>/makeaccount" style="font-size:13px;　">▶︎︎新規登録はこちら︎</a>
		</div>
	</div>
	</div>
</body>
</html>
