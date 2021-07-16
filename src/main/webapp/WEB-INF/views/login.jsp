<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>로그인</title>

<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<!-- jQuery -->
<script src="js/jquery-3.6.0.min.js"></script>

<style>
	.page-header {
		text-align: center;
		margin-bottom: 30px;
	}
	
	.row {
		margin-bottom: 10px;
	}
</style>

</head>
<body class="grey lighten-5">	
	<div class="container">
		<div class="row">
			<h2 class="page-header">Household Ledger</h2>		
		</div>
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
				</form>
				<div class="row">
					<label>
						<input type="checkbox" class="filled-in" id="isRememberId" name="isRememberId">
						<span>아이디 기억하기</span>
					</label>
				</div>
				<div class="row">
					<button class="waves-effect waves-light btn col s12" id="loginBtn">
						<i class="material-icons right">arrow_forward</i>로그인
					</button>
				</div>
				<div class="row">
					<button class="waves-effect waves-light indigo accent-3 btn col s12" id="joinBtn">
						<i class="material-icons right">person_add</i>회원가입
					</button>
				</div>
				<div class="row">
					<button class="waves-effect waves-light grey darken-3 btn col s12" id="findIdOrPwBtn">
						<i class="material-icons right">search</i>아이디/비밀번호 찾기
					</button>			
				</div>	
			</div>			
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		
		/* 쿠기 관련 시작 */
		
		//get cookie
		var id = getCookie('id');
		
		//id is not empty
		if (id != "") {
			$("#isRememberId").prop("checked", true);
			$("input[name=id]").val(id);
		}
		
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
		
		/* 쿠키 관련 끝 */
		
		//focus
		if ($("#id").val() == "") {
			$("#id").focus();			
		} else {
			$("#pw").focus();
		}
		
		//loginBtn click -> login process
		$("#loginBtn").click(function() {
			loginValidation();
			
			if ($("#isRememberId").prop("checked")) {
				id = $("input[name=id]").val();
				setCookie('id', id, 7);
			} else {
				deleteCookie('id');
			}
			
			login();
		});
		
		//enter in password input box -> login process
		$("#pw").keyup(function() {
			if (event.keyCode == 13) {
				loginValidation();
				
				if ($("#isRememberId").prop("checked")) {
					id = $("input[name=id]").val();
					setCookie('id', id, 7);
				} else {
					deleteCookie('id');
				}
				
				login();
			}
		});
		
		$("#joinBtn").click(function() {
			location.href = "/join";
		});
		
		//로그인 유효성 검사 Function
		function loginValidation() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				return;
			}			
		}
		
		//로그인 Function
		function login() {
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
					loginForm.append("<input type='hidden' name='registDate' value='"+ new Date(res.data.registDate) +"'>");
					loginForm.append("<input type='hidden' name='lastLoginDate' value='"+ new Date(res.data.lastLoginDate) +"'>");
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