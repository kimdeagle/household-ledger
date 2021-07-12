<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>
<style>
	#searchForm .s5 .row .s3,
	#searchForm .s7 .row .s2,
	#addModal .row .s2 {
		background-color: #e8f5e9;
		height: 3rem;
	}
	
	#searchForm .s5 .row .s3 h6,
	#searchForm .s7 .row .s2 h6,
	#addModal .row .s2 h6 {
		font-size: 1rem;
		line-height: inherit;
		text-align: center;	
	}
	
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	
	table th {
		vertical-align: middle;
	}
	
	.select-dropdown {
		text-align: center;
	}
	
	.modal {
		min-width: 500px;
	}
	
</style>
	<div class="col s9">
		<div class="row">
			<h4><i class="material-icons">event_note</i> 가계부 관리</h4>				
		</div>
		<div class="row">
			<h5><i class="material-icons">search</i> 가계부 검색</h5>
		</div>
		<div class="row">
			<form id="searchForm">
				<div class="col s5">
					<div class="row">
						<div class="col s3">
							<h6>수입/지출</h6>
						</div>
						<div class="col s8">
							<select>
								<option value="A" selected>전체</option>
								<option value="1">수입</option>
								<option value="2">지출</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col s3">
							<h6>분류</h6>
						</div>
						<div class="col s8">
							<!-- 셀렉트박스(수입 : 전체, 월급, 용돈, 부수입, 상여, 이자, 기타 // 지출 : 전체, 식비, 교통비, 쇼핑, 생활용품, 기타) -->
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
					<div class="row">
						<div class="col s3">
							<h6>자산</h6>
						</div>
						<div class="col s8">
							<select>
								<option value="A" selected>전체</option>
								<option value="1">현금</option>
								<option value="2">계좌</option>
								<option value="3">카드</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col s7">
					<div class="row">
						<div class="col s2">
							<h6>검색 기간</h6>
						</div>
						<div class="col s10">
							<div class="col s5">
								<input type="text" class="datepicker center-align" placeholder="시작 날짜">
							</div>
							<div class="col s1 center-align">
								<span  style="font-size: 1.8rem;">~</span>
							</div>
							<div class="col s5">
								<input type="text" class="datepicker center-align" placeholder="종료 날짜">
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col s2">
							<h6>금액 범위</h6>
						</div>
						<div class="col s10">
							<div class="col s5">
								<input type="number" min=0 class="center-align" placeholder="최소 0원">
							</div>
							<div class="col s1 center-align">
								<span style="font-size: 1.8rem;">~</span>
							</div>
							<div class="col s5">
								<input type="number" class="center-align">
							</div>
						</div>			
					</div>			
					<div class="row">
						<div class="col s2">
							<h6>검색 단어</h6>
						</div>
						<div class="col s10">
							<div class="col s8">
								<input type="text">
							</div>
							<div class="col s3 hide-on-med-and-down">
								<a class="waves-effect waves-light btn right">검색</a>						
							</div>
							<div class="col s3 hide-on-large-only">
								<a class="waves-effect waves-light btn right"><i class="material-icons">search</i></a>						
							</div>
						</div>			
					</div>			
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col s12">
				<h5><i class="material-icons">dvr</i> 가계부 목록</h5>
			</div>
		</div>
		<div class="row">
			<div class="col s11">
				<a class="waves-effect waves-light btn-floating btn-large red modal-trigger right" href="#addModal">
					<i class="material-icons">add</i>
				</a>
			</div>
		</div>
		<div class="row">
			<h5>2021.07.11 이후 예정사항</h5>
			1. SY_LEDGER 테이블 생성 (필요한 컬럼 생각)
			<br>
			2. 가계부 목록(검색 결과) 그리드 생성
			<br>
			3. 검색 기능
			<br>
			4. 추가 기능 (디자인 완료)
			<br>
			5. 상세 기능 - 목록에서 클릭하면 모달로 상세 띄우기 - 상세에 수정, 삭제 기능 추가
			<br>			
			6. 페이지네이션
		</div>
	</div>
	
	<!-- Modal Structure -->
	<div id="addModal" class="modal">
		<div class="modal-content">
			<div class="row">
				<h5>가계부 추가</h5>
			</div>
			<div class="row">
				<div class="col s2 offset-s3">
					<h6>날짜</h6>
				</div>
				<div class="col s4">
					<input type="text" class="datepicker center-align" placeholder="날짜 선택">
				</div>
			</div>
			<div class="row">
				<div class="col s2 offset-s3">
					<h6>내용</h6>
				</div>
				<div class="col s4">
					<input type="text" class="center-align" placeholder="내용 입력">
				</div>
			</div>
			<div class="row">
				<div class="col s2 offset-s3">
					<h6>금액</h6>
				</div>
				<div class="col s4">
					<input type="number" min=0 class="center-align" placeholder="금액 입력">
				</div>
			</div>
			<div class="row">
				<div class="col s2 offset-s3">
					<h6>수입/지출</h6>
				</div>
				<div class="col s4">
					<select>
						<option value="1">수입</option>
						<option value="2">지출</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col s2 offset-s3">
					<h6>분류</h6>
				</div>
				<div class="col s4">
					<select>
						<option value="1">월급</option>
						<option value="2">용돈</option>
						<option value="3">부수입</option>
						<option value="4">상여</option>
						<option value="5">이자</option>
						<option value="6">기타</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col s2 offset-s3">
					<h6>자산</h6>
				</div>
				<div class="col s4">
					<select>
						<option value="1">현금</option>
						<option value="2">계좌</option>
						<option value="3">카드</option>
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class="waves-effect waves-green btn">등록</a>
			<a href="#!" class="modal-close waves-effect waves-green btn">취소</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var user = "${user}";
		if (user === "") {
			alert("로그인 후 이용해주세요.");
			location.href = "/";
		}
	});

	document.addEventListener('DOMContentLoaded', function() {
		var datepicker = document.querySelectorAll('.datepicker');
		var datepickerInstance = M.Datepicker.init(datepicker, {
			format : 'yyyy-mm-dd',
			maxDate : new Date(),
			showMonthAfterYear : true,
			showClearBtn : true,
			
		});
		var dropdown = document.querySelectorAll('.dropdown-trigger');
		var dropdownInstance = M.Dropdown.init(dropdown);
		var select = document.querySelectorAll('select');
		var selectInstance = M.FormSelect.init(select);
		var modal = document.querySelectorAll('.modal');
		var modalInstance = M.Modal.init(modal);
	});
</script>
</html>