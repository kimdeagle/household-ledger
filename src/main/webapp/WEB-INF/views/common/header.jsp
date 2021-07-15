<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>${title}</title>

<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/lnb.css">

<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<!-- jQuery -->
<!-- <script src="js/jquery-1.12.4.min.js"></script> -->
<script src="js/jquery-3.6.0.min.js"></script>

</head>
<body class="grey lighten-5">
<header>
	<nav style="margin-bottom: 30px;">
		<div class="nav-wrapper">
			<a href="/main" class="brand-logo center">Kimdeagle Project</a>
			<ul class="right hide-on-med-and-down">
				<li>로그인 시간 : <fmt:formatDate value="${user.lastLoginDate}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
				<li><a class="waves-effect waves-light grey darken-1 btn" href="/logout">로그아웃</a></li>
			</ul>
		</div>
	</nav>	
</header>