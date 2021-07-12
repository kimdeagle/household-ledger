<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.toast {
	background-color: #039be5;
}
</style>
<div class="row">
	<div id ="lnb" class="col s2">
		<ul>
			<li>
				<div class="col s12 center-align">
					<div class="card blue-grey darken-1">
						<div class="card-content white-text">
							<span class="card-title"><a href="#!"><b>${user.name}</b></a><small>님</small></span>
							<p>반갑습니다.</p>
							<div style="margin-top: 20px;">
								<p><small>가입일 : <fmt:formatDate value="${user.registDate}" pattern="yyyy-MM-dd" /></small></p>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<a id="ledger" class="waves-effect waves-light blue-grey btn-large col s12">
					<i class="material-icons left">event_note</i>
					가계부
					<i class="material-icons right">arrow_drop_down</i>
				</a>
			</li>
			<li>
				<div id="ledgerMenu">
					<a id="ledgerManage" href="/ledger" class="waves-effect waves-light blue-grey lighten-1 btn col s12">
						가계부 관리
						<i class="material-icons right">event_available</i>
					</a>
					<a id="ledgerStat" class="waves-effect waves-light blue-grey lighten-1 btn col s12">
						가계부 통계
						<i class="material-icons right">equalizer</i>
					</a>
				</div>
			</li>
			<li>
				<a class="waves-effect waves-light blue-grey btn-large col s12" onclick="M.toast({html: '메뉴 준비중', classes: 'rounded'})">
					메뉴2
					<i class="material-icons right">arrow_drop_down</i>
				</a>
			</li>
			<li>
				<a class="waves-effect waves-light blue-grey btn-large col s12">
					메뉴3
					<i class="material-icons right">arrow_drop_down</i>
				</a>
			</li>
		</ul>
	</div>
	
	<script type="text/javascript">
		$("#ledger").click(function() {
			$("#ledgerMenu").toggle();
		})
	</script>