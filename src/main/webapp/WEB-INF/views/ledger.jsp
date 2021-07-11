<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>
<style>
	#searchForm .row .col.s1 {
		background-color: #e8f5e9;
		height: 3rem;
	}
	
	#searchForm .row .col.s1 h6 {
		font-size: 1rem;
		line-height: inherit;
	}
	
</style>

	<div class="col s10">
		<form id="searchForm">
			<div class="row">
				<div class="col s12">
					<h5><i class="material-icons">event_note</i> 가계부 관리</h5>				
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<div class="col s1">
						<h6 class="center-align">검색 기간</h6>
					</div>
					<div class="col s5">
						<div class="col s4">
							<input type="text" class="datepicker center-align" placeholder="시작 날짜">
						</div>
						<div class="col s2 center-align">
							<span  style="font-size: 1.8rem;">~</span>
						</div>
						<div class="col s4">
							<input type="text" class="datepicker center-align" placeholder="종료 날짜">
						</div>
					</div>
					<div class="col s1">
						<h6 class="center-align">금액 범위</h6>
					</div>
					<div class="col s5">
						<div class="col s4">
							<input type="text" class="center-align" placeholder="최소 0원">
						</div>
						<div class="col s2 center-align">
							<span style="font-size: 1.8rem;">~</span>
						</div>
						<div class="col s4">
							<input type="text" class="center-align">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<div class="col s1">
						<h6 class="center-align">수입/지출</h6>
					</div>
					<div class="col s5">
						<div class="col s10">
							<select>
								<option value="A" selected>전체</option>
								<option value="1">수입</option>
								<option value="2">지출</option>
							</select>
						</div>
					</div>
					<div class="col s1">
						<h6 class="center-align">분류</h6>
					</div>
					<div class="col s5">
						<!-- 셀렉트박스(수입 : 전체, 월급, 용돈, 부수입, 상여, 이자, 기타 // 지출 : 전체, 식비, 교통비, 쇼핑, 생활용품, 기타) -->
						<div class="col s10">
							<select>
								<option value="A" selected>전체</option>
								<option value="1">월급</option>
								<option value="2">용돈</option>
								<option value="3">부수입</option>
								<option value="4">상여</option>
								<option value="5">이자</option>
								<option value="6">기타</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
					<div class="col s1">
						<h6 class="center-align">자산</h6>
					</div>
					<div class="col s5">
						<div class="col s10">
							<select>
								<option value="A" selected>전체</option>
								<option value="1">현금</option>
								<option value="2">계좌</option>
								<option value="3">카드</option>
							</select>
						</div>
					</div>
					<div class="col s1">
						<h6 class="center-align">검색어</h6>
					</div>
					<div class="col s5">
						<div class="col s10">
							<input type="text">
						</div>
						<a class="waves-effect waves-light btn right">검색</a>
					</div>
				</div>
			</div>
		</form>
		<div class="row">
		</div>
		<div class="row">
			<div class="col s12">
				<h5><i class="material-icons">dvr</i> 가계부 목록</h5>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<a class="waves-effect waves-light btn right">추가</a>
			</div>		
		</div>
		<br>
		페이지네이션
		<br>
		추가/수정/삭제
		<br>
	</div>
</div>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var datepicker = document.querySelectorAll('.datepicker');
		var datepickerInstance = M.Datepicker.init(datepicker, {
			format: 'yyyy-mm-dd',
			maxDate: new Date(),
			showMonthAfterYear: true,
			showClearBtn: true,
		});
		var dropdown = document.querySelectorAll('.dropdown-trigger');
		var dropdownInstance = M.Dropdown.init(dropdown);
	    var select = document.querySelectorAll('select');
	    var selectInstance = M.FormSelect.init(select);
	});
</script>
</html>