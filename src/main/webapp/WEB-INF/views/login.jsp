<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>Household Ledger</title>

<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<!-- jQuery -->
<script src="js/jquery-1.12.4.min.js"></script>

<style>
	button {
		margin-bottom: 10px;
	}
</style>

</head>
<body class="grey lighten-5">	
	<div class="container">
		<h2 class="center-align">Household Ledger</h2>
		<div class="row">
			<div class="col s4 offset-s4">
				<form method="POST" action="/login" id="loginForm">
					<div class="row">
						<div class="input-field">
							<input placeholder="아이디를 입력하세요" id="id" name="id" type="text" class="validate">
							<label for="id">ID</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field">
							<input placeholder="비밀번호를 입력하세요" id="pw" name="pw" type="password" class="validate">
							<label for="pw">PASSWORD</label>
						</div>
					</div>
					<p>
						<label>
							<input type="checkbox" class="filled-in" id="isRememberId" name="isRememberId">
							<span>아이디 기억하기</span>
						</label>
					</p>
				</form>
				<button class="waves-effect waves-light btn col s12" id="btnLogin">
					<i class="material-icons right">arrow_forward</i>로그인
				</button>
				<button class="waves-effect waves-light indigo accent-3 btn col s12" id="btnJoin">
					<i class="material-icons right">person_add</i>회원가입
				</button>
				<button class="waves-effect waves-light grey darken-3 btn col s12" id="btnFindIdOrPw">
					<i class="material-icons right">search</i>아이디/비밀번호 찾기
				</button>
			</div>			
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		
		//get cookie
		var id = getCookie('id');
		
		//id is not empty
		if (id != "") {
			$("#isRememberId").prop("checked", true);
			$("input[name=id]").val(id);
		}
		
		//login button click
		$("#btnLogin").click(function() {
			if ($("#isRememberId").prop("checked")) {
				id = $("input[name=id]").val();
				setCookie('id', id, 7);
			} else {
				deleteCookie('id');
			}			
		})
		
		//setCookie function
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			
			exdate.setDate(exdate.getDate() + exdays);
			
			var cookieValue = escape(value) + ((exdays == null) ? "" : ";expires=" + exdate.toGMTString());
			
			document.cookie = cookieName + "=" + cookieValue;
		}
		
		//deleteCookie function
		function deleteCookie(cookieName) {
			var expireDate = new Date();
			
			expireDate.setDate(expireDate.getDate() - 1);
			
			document.cookie = cookieName + "=" + ";expires=" + expireDate.toGMTString();
		}
		
		//getCookie function
		function getCookie(cookieName) {
			cookieName = cookieName + "=";
			
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = "";
			
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1) end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			
			return unescape(cookieValue);
		}	
		
		//focus
		if ($("#id").val() == "") {
			$("#id").focus();			
		} else {
			$("#pw").focus();
		}
		
		//login
		$("#btnLogin").click(function() {
			onLoginBtnClick();
		})
		
		//login
		$("#pw").keyup(function() {
			if (event.keyCode == 13) {
				onLoginBtnClick();
			}
		})
		
		//onLoginBtnClick function
		function onLoginBtnClick() {
			var loginForm = $("#loginForm");
			$.ajax({
				url: "/login",
				method: "post",
				data: {
					id: $("#id").val(),
					pw: $("#pw").val()
				},
				success: function(res) {
					loginForm.html("");
					loginForm.append("<input type='hidden' name='no' value='"+ res.data.no +"'>");
					loginForm.append("<input type='hidden' name='id' value='"+ res.data.id +"'>");
					loginForm.append("<input type='hidden' name='name' value='"+ res.data.name +"'>");
					loginForm.append("<input type='hidden' name='email' value='"+ res.data.email +"'>");
					loginForm.append("<input type='hidden' name='registDate' value='"+ res.data.registDate +"'>");
					loginForm.attr("action", "/main");
					loginForm.submit();
				},
				error: function(err) {
					alert(err.responseJSON.message);
				}
			})
		}
	})
</script>
</html>