<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>회원가입</title>

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
			<h3 class="page-header">회원가입 <i class="material-icons small">person_add</i></h3>		
		</div>
		<div class="row">
			<div class="col s6 offset-s3">
				<form id="joinForm">
					<div class="row" style="display: flex; align-items: center;">
						<div class="input-field col s9">
							<input placeholder="아이디를 입력하세요" id="id" name="id" type="text">
							<label for="id">ID</label>
						</div>
						<div class="col s3">
							<a class="waves-effect waves-light btn" id="idDuplicationCheckBtn">중복검사</a>
						</div>
					</div>
					<div class="row">
						<div class="col s9" style="margin-top: -30px;">
							<span id="idLengthCount" class="right">(0/15)</span>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s9">
							<input placeholder="비밀번호를 입력하세요" id="pw" name="pw" type="password" class="validate">
							<label for="pw">PASSWORD</label>
						</div>
					</div>
					<div class="row">
						<div class="col s9" style="margin-top: -30px;">
							<span id="pwLengthCount" class="right">(0/20)</span>						
						</div>
					</div>
					<div class="row" style="display: flex; align-items: center;">
						<div class="input-field col s9">
							<input placeholder="비밀번호를 재입력하세요" id="pwValidation" name="pwValidation" type="password" class="validate">
							<label for="pwValidation">PASSWORD 확인</label>
						</div>
						<div class="col s3">
							<b><span id="isEqualPassword"></span></b>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s9">
							<input placeholder="이름을 입력하세요" id="name" name="name" type="text" class="validate">							
							<label for="name">NAME</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s9">
							<input placeholder="이메일을 입력하세요" id="email" name="email" type="email" class="validate">							
							<label for="email">EMAIL</label>
						</div>
					</div>
				</form>
				<div class="row">
					<div class="col s9">
						<button class="waves-effect waves-light indigo accent-3 btn col s12" id="joinBtn">
							<i class="material-icons right">arrow_forward</i>가입하기
						</button>					
					</div>
				</div>
				<div class="row">
					<div class="col s9">
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
		
		$("#idDuplicationCheckBtn").click(() => {
			$.ajax({
				method: "get",
				url: "/join/duplication/" + $("#id").val(),
				success: (res) => {
					alert(res.message);
					if (res.data.isDuplication) {
						$("#id").select();
					} else {
						$("#pw").focus();
					}
				},
				error: (err) => {
					console.log(err);
					alert(err.responseJSON.message);
				}
			})
		});
		
		$("#id").keyup(() => {
			lengthCheck($("#id"), 15);
			$("#idLengthCount").html("("+ $("#id").val().length +"/15)");
		});
		
		$("#pw").keyup(() => {
			lengthCheck($("#pw"), 20);
			$("#pwLengthCount").html("("+ $("#pw").val().length +"/20)");
		});
		
		$("#pwValidation").keyup(() => {
			lengthCheck($("#pwValidation"), 20);
			if ($("#pw").val() == $("#pwValidation").val()) {
				$("#isEqualPassword").text("일치");
				$("#isEqualPassword").css("color", "blue");
			} else {
				$("#isEqualPassword").text("불일치");		
				$("#isEqualPassword").css("color", "red");
			}				
		});
		
		$("#joinBtn").click(() => {
			if ($("#pw").val() != $("#pwValidation").val()) {
				alert("비밀번호를 확인해주세요.");
				return;
			}
			var queryString = $("#joinForm").serialize();
			$.ajax({
				method: "post",
				url: "/join",
				data: queryString,
				success: (res) => {
					alert(res.message);
					location.href = "/";
				},
				error: (err) => {
					console.log(err);
					alert(err.responseJSON.message);
				}
			})
		});
		
		$("#backBtn").click(() => {
			history.back();
		});
		
		function lengthCheck(target, maxLength) {
			if (target.val().length > maxLength) {
				alert(maxLength + "자 이내로 입력해주세요.");
				target.val(target.val().substring(0, maxLength));
				return;
			}
		}

	})
</script>
</html>