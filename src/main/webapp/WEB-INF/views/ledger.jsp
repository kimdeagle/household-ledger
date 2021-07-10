<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>
<style>
	table tr th {
		width: 10%;
		text-align: center;
	}
</style>

	<div class="col s10">
		<h4>가계부 > 가계부 관리</h4>
		<br>
		<table class="response-table">
			<tr>
				<th>검색 기간</th>
				<td>
					<div class="inline">
						<input type="text" class="datepicker col s5">
						<span class="col s2"><i class="material-icons">more_horiz</i></span>
						<input type="text" class="datepicker col s5">					
					</div>
				</td>
				<th>자산</th>
				<td>셀렉트박스(전체, 현금, 계좌, 카드)</td>
			</tr>
			<tr>				
				<th>수입/지출</th>
				<td>셀렉트박스</td>
				<th>분류</th>
				<td>셀렉트박스(수입 : 전체, 월급, 용돈, 부수입, 상여, 이자, 기타 // 지출 : 전체, 식비, 교통비, 쇼핑, 생활용품, 기타)</td>
			</tr>
			<tr>				
				<th>금액 범위</th>
				<td>인풋 ~ 인풋</td>
				<th>검색어</th>
				<td>인풋, 검색버튼</td>
			</tr>
		</table>
		<br>
		테이블 그리드(검색 결과)
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
	});
</script>
</html>