<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>
<style>
	ol li {
		font-size: 1.5rem;
	}
</style>
	<div class="col s9">
		<h4>TODO LIST</h4>
		<ol>
			<li>change anonymous function into arrow function (ledger.jsp)123</li>
			<li>statistics</li>
			<li>main</li>
			<li>footer</li>
		</ol>
	</div>

	<script type="text/javascript">
		$(document).ready(() => {
			var user = "${user}";
			if (user === "") {
				alert("로그인 후 이용해주세요.");
				location.href = "/";
			}
		})
	</script>

<%@ include file="common/footer.jsp" %>