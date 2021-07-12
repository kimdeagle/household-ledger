<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>

	<div class="col s9">
		<img class="responsive-img" src="img/main2.jpg">
		<span style="position: fixed; top: 40%; left: 40%; font-size: 5em; color: midnightblue;">메인 준비중입니다.</span>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var user = "${user}";
			if (user === "") {
				alert("로그인 후 이용해주세요.");
				location.href = "/";
			}
		})
	</script>

<%@ include file="common/footer.jsp" %>