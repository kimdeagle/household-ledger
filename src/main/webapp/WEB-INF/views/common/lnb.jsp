<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Modal Structure -->
<div id="loginHistoryModal" class="modal modal-fixed-footer">
	<div class="modal-content">
		<div class="row">
			<h5><i class="material-icons">history</i> 로그인 이력</h5>
		</div>
		<div class="row">
			<table id="loginHistoryTable" class="responsive-table highlight col s8 offset-s2">
				<thead>
					<tr>
						<th>번호</th>
						<th>로그인</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal-footer">
		<a class="modal-close waves-effect waves-light btn blue-grey darken-1">닫기</a>
	</div>
</div>
<div class="row">
	<div id ="lnb" class="col s2">
		<div class="row">
			<div id="profile" class="col s11 center-align">
				<div class="card blue-grey darken-1">
					<div class="card-content white-text">
						<span class="card-title"><a href="#!"><b>${user.name}</b></a><small>님</small></span>
						<p>반갑습니다.</p>
						<p><small>가입일 : <fmt:formatDate value="${user.registDate}" pattern="yyyy-MM-dd" /></small></p>
						<p><a id="loginHistoryBtn" class="waves-effect waves-light btn-small blue-grey darken-3">로그인 이력</a></p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<ul class="col s11">
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
						<a id="ledgerStat" class="waves-effect waves-light blue-grey lighten-1 btn col s12" onclick="alert('메뉴 준비중');">
							가계부 통계
							<i class="material-icons right">equalizer</i>
						</a>
					</div>
				</li>
				<li>
					<a class="waves-effect waves-light blue-grey btn-large col s12" onclick="alert('메뉴 준비중');">
						메뉴2
						<i class="material-icons right">arrow_drop_down</i>
					</a>
				</li>
				<li>
					<a class="waves-effect waves-light blue-grey btn-large col s12" onclick="alert('메뉴 준비중');">
						메뉴3
						<i class="material-icons right">arrow_drop_down</i>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var modal = document.querySelectorAll(".modal");
			var modalInstances = M.Modal.init(modal);
		});
		
		$(document).ready(function() {
			var loginHistoryModal = M.Modal.getInstance($("#loginHistoryModal"));
			
			$("#ledger").click(function() {
				$("#ledgerMenu").toggle();
			});

			$("#loginHistoryBtn").click(function() {
				//데이터 가져오기(ajax)
				$.ajax({
					method : "get",
					url : "/login/history/${user.no}",
					success : function(res) {
						$("#loginHistoryTable tbody").html("");
						
						//append login history data
						res.data.forEach(function(item, index) {
							
							var str = "";
							
							str += "<tr>";
							str += "<td>" + (index + 1) + "</td>";
							str += "<td>" + item.loginDate + "</td>";
							str += "</tr>";
							
							$("#loginHistoryTable tbody").append(str);
						})
						
						loginHistoryModal.open();
					},
					error : function(err) {
						console.log(err);
					}
				});
			});
		})
	</script>