<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>
<style>
	#searchForm .s5 .row .s3,
	#searchForm .s7 .row .s2,
	#registModal .row .s2 {
		background-color: #e8f5e9;
		height: 3rem;
	}
	
	#searchForm .s5 .row .s3 h6,
	#searchForm .s7 .row .s2 h6,
	#registModal .row .s2 h6 {
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
		text-align: center;
	}
	
	#ledgerListTable tr:hover {
		background-color: rgba(222, 222, 222, 0.5);
	}
	
	.select-dropdown {
		text-align: center;
	}
	
	.modal {
		min-width: 500px;
	}
	
	#in, #out {
		display: none;
	}
	
	#ledgerListTable th {
		background-color: #e8f5e9;
	}
	
	#ledgerListTable td {
		text-align: center;
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
							<select id="inOut" name="inOut">
								<option value="A" selected>전체</option>
								<option value="in">수입</option>
								<option value="out">지출</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col s3">
							<h6>분류</h6>
						</div>
						<div id="all" class="col s8">
							<select id="allCategory" name="category">
								<option value="A" selected>전체</option>
								<option value="월급">월급</option>
								<option value="용돈">용돈</option>
								<option value="부수입">부수입</option>
								<option value="상여">상여</option>
								<option value="이자">이자</option>
								<option value="식비">식비</option>
								<option value="교통비">교통비</option>
								<option value="쇼핑">쇼핑</option>
								<option value="생활용품">생활용품</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div id="in" class="col s8">
							<select id="inCategory" name="category">
								<option value="A" selected>전체</option>
								<option value="월급">월급</option>
								<option value="용돈">용돈</option>
								<option value="부수입">부수입</option>
								<option value="상여">상여</option>
								<option value="이자">이자</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div id="out" class="col s8">
							<select id="outCategory" name="category">
								<option value="A" selected>전체</option>
								<option value="식비">식비</option>
								<option value="교통비">교통비</option>
								<option value="쇼핑">쇼핑</option>
								<option value="생활용품">생활용품</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col s3">
							<h6>자산</h6>
						</div>
						<div class="col s8">
							<select id="asset" name="asset">
								<option value="A" selected>전체</option>
								<option value="현금">현금</option>
								<option value="계좌">계좌</option>
								<option value="카드">카드</option>
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
								<input type="text" id="startDate" name="startDate" class="datepicker center-align" placeholder="시작 날짜">
							</div>
							<div class="col s1 center-align">
								<span  style="font-size: 1.8rem;">~</span>
							</div>
							<div class="col s5">
								<input type="text" id="endDate" name="endDate" class="datepicker center-align" placeholder="종료 날짜">
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col s2">
							<h6>금액 범위</h6>
						</div>
						<div class="col s10">
							<div class="col s5">
								<input type="number" id="startAmount" name="startAmount" class="center-align" min=0 placeholder="최소 0원">
							</div>
							<div class="col s1 center-align">
								<span style="font-size: 1.8rem;">~</span>
							</div>
							<div class="col s5">
								<input type="number" id="endAmount" name="endAmount" class="center-align">
							</div>
						</div>			
					</div>			
					<div class="row">
						<div class="col s2">
							<h6>검색 단어</h6>
						</div>
						<div class="col s10">
							<div class="col s8">
								<input type="text" id="keyword" name="keyword">
							</div>
							<div class="col s3 hide-on-med-and-down">
								<a id="searchBtn" class="waves-effect waves-light btn right">검색</a>						
							</div>
							<div class="col s3 hide-on-large-only">
								<a id="searchBtn" class="waves-effect waves-light btn right"><i class="material-icons">search</i></a>
							</div>
						</div>			
					</div>			
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col s10">
				<h5><i class="material-icons">dvr</i> 가계부 목록</h5>
			</div>
			<div class="col s2">
				<a href="#registModal" class="waves-effect waves-light btn-floating btn-large tooltipped light-blue modal-trigger right" data-position="top" data-tooltip="가계부 등록">
					<i class="material-icons">add</i>
				</a>
			</div>
		</div>
		<div class="row">
			<table id="ledgerListTable" class="responsive-table highlight">
				<thead>
					<tr>
						<th>날짜</th>
						<th>내용</th>
						<th>수입/지출</th>
						<th>분류</th>
						<th>금액</th>
						<th>자산</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ledger" items="${ledgerList}">
						<tr>
							<td><fmt:formatDate value="${ledger.addDate}" pattern="yyyy-MM-dd" /></td>
							<td><a href="#!">${ledger.content}</a></td>
							<td>${ledger.inOut}</td>
							<td>${ledger.category}</td>
							<td>${ledger.amount}</td>
							<td>${ledger.asset}</td>
						</tr>					
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<h5>2021.07.12 이후 예정사항</h5>
			1. 검색 기간 유효성 검사(시작날짜, 종료날짜 비교해서 예외처리 vs 시작날짜 선택 시 종료날짜 >= 시작날짜)
			<br>
			2. 검색 -> ajax -> 목록 갱신
			<br>
			3. 상세 기능 - 목록에서 클릭하면 모달로 상세 띄우기 - 상세에 수정, 삭제 기능 추가
			<br>			
			4. 페이지네이션
		</div>
	</div>
	
	<!-- Modal Structure -->
	<div id="registModal" class="modal">
		<div class="modal-content">
			<div class="row">
				<h5>가계부 등록</h5>
			</div>
			<form id="registForm" method="POST" action="/ledger">
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>날짜</h6>
					</div>
					<div class="col s4">
						<input type="text" id="addDate" name="addDate" class="datepicker center-align" placeholder="날짜 선택">
					</div>
				</div>
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>금액</h6>
					</div>
					<div class="col s4">
						<input type="number" id="amount" name="amount" class="center-align" min=0 placeholder="금액 입력">
					</div>
				</div>
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>내용</h6>
					</div>
					<div class="col s4">
						<input type="text" id="content" name="content" class="center-align" placeholder="내용 입력">
					</div>
				</div>
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>수입/지출</h6>
					</div>
					<div class="col s4">
						<select id="inOut" name="inOut">
							<option value="" disabled selected>수입/지출 선택</option>
							<option value="in">수입</option>
							<option value="out">지출</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>분류</h6>
					</div>
					<div id="in" class="col s4">
						<select id="inCategory" name="category">
							<option value="N" disabled="disabled" selected="selected">수입 선택</option>
							<option value="월급">월급</option>
							<option value="용돈">용돈</option>
							<option value="부수입">부수입</option>
							<option value="상여">상여</option>
							<option value="이자">이자</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div id="out" class="col s4">
						<select id="outCategory" name="category">
							<option value="N" disabled selected>지출 선택</option>
							<option value="식비">식비</option>
							<option value="교통비">교통비</option>
							<option value="쇼핑">쇼핑</option>
							<option value="생활용품">생활용품</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>자산</h6>
					</div>
					<div class="col s4">
						<select id="asset" name="asset">
							<option value="N" disabled selected>자산 선택</option>
							<option value="현금">현금</option>
							<option value="계좌">계좌</option>
							<option value="카드">카드</option>
						</select>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a id="registBtn" class="waves-effect waves-light btn light-blue">등록</a>
			<a class="modal-close waves-effect waves-light btn">취소</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var datepicker = document.querySelectorAll('.datepicker');
		var datepickerInstances = M.Datepicker.init(datepicker, {
			format: 'yyyy-mm-dd',
			maxDate: new Date(),
			showMonthAfterYear: true,
			showClearBtn: true			
		});
		var dropdown = document.querySelectorAll('.dropdown-trigger');
		var dropdownInstances = M.Dropdown.init(dropdown);
		var select = document.querySelectorAll('select');
		var selectInstances = M.FormSelect.init(select);
		var modal = document.querySelectorAll(".modal");
		var modalInstances = M.Modal.init(modal);
	    var tooltip = document.querySelectorAll('.tooltipped');
	    var tooltipInstances = M.Tooltip.init(tooltip);
	});

	$(document).ready(function() {
		
		//가계부 등록 모달
		var registModal = M.Modal.getInstance($("#registModal"));
		
		var amount = 0;
		var startAmount = 0;
		var endAmount = 0;
		
		//session에 담긴 user
		var user = "${user}";
		
		//비로그인 -> 내보내기
		if (user === "") {
			alert("로그인 후 이용해주세요.");
			location.href = "/";
		}
		
		//금액 -> 세자리 콤마 + "원"
		$("#amount").focusout(function() {
			amount = parseInt($("#amount").val());
			$("#amount").prop("type", "text");
			$("#amount").val($("#amount").val().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
		})
		
		$("#startAmount").focusout(function() {
			startAmount = parseInt($("#startAmount").val());
			if (endAmount !== 0) {
				if (startAmount > endAmount) {
					alert("최소 금액이 최대 금액보다 클 수 없습니다.");
					startAmount = 0;
					$("#startAmount").val(startAmount);
					$("#startAmount").focus();
					return;
				}				
			}
			$("#startAmount").prop("type", "text");
			$("#startAmount").val($("#startAmount").val().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
		})
		
		$("#endAmount").focusout(function() {
			endAmount = parseInt($("#endAmount").val());
			if (endAmount !== 0) {
				if (startAmount > endAmount) {
					alert("최대 금액이 최소 금액보다 작을 수 없습니다.");
					endAmount = 0;
					$("#endAmount").val(endAmount);
					$("#endAmount").focus();
					return;
				}				
			}
			$("#endAmount").prop("type", "text");
			$("#endAmount").val($("#endAmount").val().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
		})
		
		//금액 원래대로
		$("#amount").focusin(function() {
			$("#amount").val(amount);
			$("#amount").prop("type", "number");
			$(this).select();
		})
		
		$("#startAmount").focusin(function() {
			$("#startAmount").val(startAmount);
			$("#startAmount").prop("type", "number");
			$(this).select();
		})
		
		$("#endAmount").focusin(function() {
			$("#endAmount").val(endAmount);
			$("#endAmount").prop("type", "number");
			$(this).select();
		})
		
		//가계부 검색 -> 수입/지출 변경시
		$("#searchForm #inOut").change(function() {
			if ($(this).val() == "A") {
				$("#searchForm #all").show();
				$("#searchForm #in").hide();
				$("#searchForm #out").hide();
			}
			if ($(this).val() == "in") {
				$("#searchForm #all").hide();
				$("#searchForm #in").show();
				$("#searchForm #out").hide();
			}
			if ($(this).val() == "out") {
				$("#searchForm #all").hide();
				$("#searchForm #in").hide();
				$("#searchForm #out").show();
			}
		})
		
		//가계부 등록 모달 -> 수입/지출 변경시
		$("#inOut").change(function() {
			if ($(this).val() == "in") {
				$("#in").show();
				$("#out").hide();
			}
			if ($(this).val() == "out") {
				$("#in").hide();
				$("#out").show();
			}
		})
		
		//가계부 등록 버튼 클릭
		$("#registBtn").click(function() {
			var addDate = $("#addDate").val();
			//String -> Date
			$("#addDate").val(new Date($("#addDate").val()));
			
			//registForm data formatting
			var queryString = $("#registForm").serialize();
			
			//go to String
			$("#addDate").val(addDate);
			
			$.ajax({
				type: "post",
				url: "/ledger",
				data: queryString,
				success: function(res) {
					//registForm data reset
					$("#registForm")[0].reset();
					//성공유무 확인
					alert(res.message);
					//모달 닫기
					registModal.close();
				},
				error: function(err) {
					console.log(err);
				}
			})
		})
		
	});

</script>
</html>