<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>비밀번호 찾기</title>

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
	
	#foundPw {
		display: none;
	}
</style>

</head>
<body class="grey lighten-5">	
	<div class="container">
		<div class="row">
			<h3 class="page-header">비밀번호 찾기 <i class="material-icons small">search</i></h3>
		</div>
		<div class="row">
			<div class="col s6 offset-s3">
				<form id="findPwForm">
					<div class="row">
						<div class="input-field col s9 offset-s1">
							<input placeholder="아이디를 입력하세요" id="id" name="id" type="text" class="validate">							
							<label for="id">ID</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s9 offset-s1">
							<input placeholder="이름을 입력하세요" id="name" name="name" type="text" class="validate">							
							<label for="name">NAME</label>
						</div>
					</div>
					<div class="row" style="display: flex; align-items: center;">
						<div class="input-field col s9 offset-s1">
							<input placeholder="이메일을 입력하세요" id="email" name="email" type="email" class="validate">							
							<label for="email">EMAIL</label>
						</div>
						<div class="col s2">
							<a class="waves-effect waves-light btn col s12" id="findPwBtn">찾기</a>
						</div>
					</div>
				</form>
				<div class="row">
					<div class="col s9 offset-s1">
						<div class="row center-align">
							<span id="foundPw"></span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s9 offset-s1">
						<button class="waves-effect waves-light grey darken-3 btn col s12" id="backBtn">
							<i class="material-icons right">arrow_back</i>돌아가기
						</button>
					</div>			
				</div>	
			</div>			
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(() => {
		//focus
		$("#id").focus();
		
		$("#findPwBtn").click(() => {
			var queryString = $("#findPwForm").serialize();
			$.ajax({
				method: "get",
				url: "/find",
				data: queryString,
				success: (res) => {
					console.log(res);
					$("#foundPw").html(`검색된 비밀번호는 <b>\${res.data.pw}</b>입니다.`);
					$("#foundPw").show();
				},
				error: (err) => {
					console.log(err);
					$("#foundPw").text(err.responseJSON.message);
					$("#foundPw").show();
				}
			})
		});
		
		$("#backBtn").click(() => {
			history.back();
		});

	})
</script>
</html>