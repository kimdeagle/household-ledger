<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="common/header.jsp" %>
<%@ include file="common/lnb.jsp" %>
<style>
	#searchForm .s5 .row .s3,
	#searchForm .s7 .row .s2,
	#registForm .row .s2,
	#viewForm .row .s2 {
		background-color: #e8f5e9;
		height: 3rem;
	}
	
	#searchForm .s5 .row .s3 h6,
	#searchForm .s7 .row .s2 h6,
	#registForm .row .s2 h6,
	#viewForm .row .s2 h6 {
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
	
	.content {
		cursor: pointer;
	}
	
	#ledgerListResetBtn {
		display: none;
	}
	
	.small-text {
		font-size: 1.2rem;
	}
	
</style>
	<div class="col s9">
		<div class="row">
			<h4><i class="material-icons">event_note</i> 가계부 관리</h4>				
		</div>
		<div class="row">
			<h5>
				<i class="material-icons">search</i>
				가계부 검색
				<a id="searchFormResetBtn" class="btn-floating btn-small waves-effect waves-light blue-grey darken-1 tooltipped" data-position="right" data-tooltip="검색 조건 초기화"><i class="material-icons">replay</i></a>
			</h5>
		</div>
		<div class="row">
			<form id="searchForm" name="searchForm">
				<div class="col s5">
					<div class="row">
						<div class="col s3">
							<h6>수입/지출</h6>
						</div>
						<div class="col s8">
							<select id="inOut" name="inOut">
								<option value="" selected>전체</option>
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
							<select id="allCategory" name="allCategory">
								<option value="" selected>전체</option>
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
							<select id="inCategory" name="inCategory">
								<option value="" selected>전체</option>
								<option value="월급">월급</option>
								<option value="용돈">용돈</option>
								<option value="부수입">부수입</option>
								<option value="상여">상여</option>
								<option value="이자">이자</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div id="out" class="col s8">
							<select id="outCategory" name="outCategory">
								<option value="" selected>전체</option>
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
								<option value="" selected>전체</option>
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
							<div class="col s4">
								<input type="text" id="startDate" name="startDate" class="datepicker center-align" placeholder="시작 날짜">
							</div>
							<div class="col s1 center-align">
								<span style="font-size: 1.8rem;">~</span>
							</div>
							<div class="col s4">
								<input type="text" id="endDate" name="endDate" class="datepicker center-align" placeholder="종료 날짜">
							</div>
							<div class="col s3">
								<a id="allDateBtn" class="waves-effect waves-light grey darken-2 btn left">전체</a>
								<input type="checkbox" id="allDateCheckbox" name="isCheckAllDate" style="display: none;">
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col s2">
							<h6>금액 범위</h6>
						</div>
						<div class="col s10">
							<div class="col s4">
								<input type="number" id="startAmount" name="startAmount" class="center-align" min=0 placeholder="최소 0원">
							</div>
							<div class="col s1 center-align">
								<span style="font-size: 1.8rem;">~</span>
							</div>
							<div class="col s4">
								<input type="number" id="endAmount" name="endAmount" class="center-align">
							</div>
							<div class="col s3">
								<a id="allAmountBtn" class="waves-effect waves-light grey darken-2 btn left">전체</a>
								<input type="checkbox" id="allAmountCheckbox" name="isCheckAllAmount" style="display: none;">
							</div>
						</div>			
					</div>			
					<div class="row">
						<div class="col s2">
							<h6>검색 단어</h6>
						</div>
						<div class="col s10">
							<div class="col s9">
								<input type="text" id="keyword" name="keyword">
							</div>
							<div class="col s3 hide-on-med-and-down">
								<a id="searchBtn" class="waves-effect waves-light btn left">검색</a>						
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
				<h5>
					<i class="material-icons">dvr</i>
					가계부 목록
					<span id="count" class="small-text"></span>
					<a id="ledgerListResetBtn" class="btn-floating btn-small waves-effect waves-light blue-grey darken-1 tooltipped" data-position="right" data-tooltip="검색 목록 초기화"><i class="material-icons">replay</i></a>
				</h5>
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
						<th width="20%">날짜</th>
						<th width="25%">내용</th>
						<th width="13%">수입/지출</th>
						<th width="13%">분류</th>
						<th width="17%">금액</th>
						<th width="12%">자산</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="row">
			<h5>2021.07.14 이후 예정사항</h5>		
			1. 페이지네이션
		</div>
	</div>
	
	<!-- Modal Structure -->
	<div id="registModal" class="modal">
		<div class="modal-content">
			<div class="row">
				<h5><i class="material-icons">add_to_queue</i> 가계부 등록</h5>
			</div>
			<form id="registForm">
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
							<option value="N" disabled selected>수입/지출 선택</option>
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
						<select id="inCategory" name="inCategory">
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
						<select id="outCategory" name="outCategory">
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
			<a id="cancelBtn" class="modal-close waves-effect waves-light btn blue-grey darken-1">취소</a>
		</div>
	</div>
	
	<!-- Modal Structure -->
	<div id="viewModal" class="modal">
		<div class="modal-content">
			<div class="row">
				<h5><i class="material-icons">laptop_mac</i> 가계부 조회</h5>
			</div>
			<form id="viewForm">
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>날짜</h6>
					</div>
					<div class="col s4">
						<input type="hidden" id="no" name="no">
						<input type="text" id="addDate" name="addDate" class="datepicker center-align" placeholder="날짜 선택">
					</div>
				</div>
				<div class="row">
					<div class="col s2 offset-s3">
						<h6>금액</h6>
					</div>
					<div class="col s4">
						<input type="text" id="amount" name="amount" class="center-align" min=0 placeholder="금액 입력">
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
							<option value="N" disabled>수입/지출 선택</option>
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
						<select id="inCategory" name="inCategory">
							<option value="N" disabled>수입 선택</option>
							<option value="월급">월급</option>
							<option value="용돈">용돈</option>
							<option value="부수입">부수입</option>
							<option value="상여">상여</option>
							<option value="이자">이자</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div id="out" class="col s4">
						<select id="outCategory" name="outCategory">
							<option value="N" disabled>지출 선택</option>
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
							<option value="N" disabled>자산 선택</option>
							<option value="현금">현금</option>
							<option value="계좌">계좌</option>
							<option value="카드">카드</option>
						</select>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a id="updateBtn" class="waves-effect waves-light btn light-blue">저장</a>
			<a id="deleteBtn" class="waves-effect waves-light btn red">삭제</a>
			<a id="cancelBtn" class="modal-close waves-effect waves-light btn blue-grey darken-1">취소</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var datepicker = document.querySelectorAll('.datepicker');
		var datepickerInstances = M.Datepicker.init(datepicker, {
			autoClose: true,
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
		var registModal = M.Modal.init($("#registModal"), {
			onCloseEnd: function() {
				$("#registForm")[0].reset();
			}
		});
	    var tooltip = document.querySelectorAll('.tooltipped');
	    var tooltipInstances = M.Tooltip.init(tooltip);
	});

	$(document).ready(function() {
		
		/* Variable Declaration Start */
		
		//session에 담긴 user
		var user = "${user}";
		//시작, 종료날짜 데이트피커
		var startDatepicker = M.Datepicker.getInstance($("#startDate"));
		var endDatepicker = M.Datepicker.getInstance($("#endDate"));
		//가계부 등록 모달
		var registModal = M.Modal.getInstance($("#registModal"));
		var viewModal = M.Modal.getInstance($("#viewModal"));
		//시작 금액(searchForm)
		var startAmount = 0;
		//종료 금액(searchForm)
		var endAmount = 0;
		
		/* Variable Declaration End */
		
		
		/* Exception Handler Start */
		
		//비로그인 -> 내보내기
		if (user === "") {
			alert("로그인 후 이용해주세요.");
			location.href = "/";
		}
		
		/* Exception Handler End */
		
		
		/* init Method Start */
		
		//가계부 목록 조회
		getLedgerList();
		
		/* init Method End */
		
		
		/* Event Start */
		
		//금액 -> 세자리 콤마 + "원"
		$("#registForm #amount").focusout(function() {
			setCommaAndWon($(this));
		})
		
		$("#viewForm #amount").focusout(function() {
			setCommaAndWon($(this));
		})
		
		$("#startAmount").focusout(function() {
			startAmount = parseInt($(this).val());
			if (endAmount !== 0) {
				if (startAmount > endAmount) {
					alert("최소 금액이 최대 금액보다 클 수 없습니다.");
					startAmount = 0;
					$(this).val(startAmount);
					$(this).focus();
					return;
				}				
			}
			$(this).prop("type", "text");
			setCommaAndWon($(this));
		})
		
		$("#endAmount").focusout(function() {
			endAmount = parseInt($(this).val());
			if (endAmount !== 0) {
				if (startAmount > endAmount) {
					alert("최대 금액이 최소 금액보다 작을 수 없습니다.");
					endAmount = 0;
					$(this).val(endAmount);
					$(this).focus();
					return;
				}				
			}
			$(this).prop("type", "text");
			setCommaAndWon($(this));
		})
	
		//금액 원래대로
		$("#registForm #amount").focusin(function() {
			getOriginAmount($(this));
			$(this).select();
		})
		
		$("#viewForm #amount").focusin(function() {
			getOriginAmount($(this));
			$(this).select();
		})
		
		$("#startAmount").focusin(function() {
			getOriginAmount($(this));
			$(this).select();
		})
		
		$("#endAmount").focusin(function() {
			getOriginAmount($(this));
			$(this).select();
		})
		
		//가계부 검색 -> 수입/지출 변경시
		$("#searchForm #inOut").change(function() {
			if ($(this).val() == "") {
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
		$("#registForm #inOut").change(function() {
			if ($(this).val() == "in") {
				$("#registForm #in").show();
				$("#registForm #out").hide();
			}
			if ($(this).val() == "out") {
				$("#registForm #in").hide();
				$("#registForm #out").show();
			}
		})
		
		//가계부 조회 모달 -> 수입/지출 변경시
		$("#viewForm #inOut").change(function() {
			if ($(this).val() == "in") {
				$("#viewForm #in").show();
				$("#viewForm #out").hide();
			}
			if ($(this).val() == "out") {
				$("#viewForm #in").hide();
				$("#viewForm #out").show();
			}
		})
		
		//가계부 등록 모달 -> 등록 버튼 클릭
		$("#registBtn").click(function() {
			//String -> Date
			$("#registForm #addDate").val(convertStringToDate($("#registForm #addDate").val()));
			
			//String -> Integer
			getOriginAmount($("#registForm #amount"));
			
			//registForm data formatting
			var queryString = $("#registForm").serialize();
			
			registLedger(queryString);
		});
		
		//가계부 조회 모달 -> 수정 버튼 클릭
		$("#updateBtn").click(function() {
			//String -> Date
			$("#viewForm #addDate").val(convertStringToDate($("#viewForm #addDate").val()));
			
			//String -> Integer
			getOriginAmount($("#viewForm #amount"));
			
			//viewForm data formatting
			var queryString = $("#viewForm").serialize();
			
			updateLedger(queryString);
		})
		
		//가계부 조회 모달 -> 삭제 버튼 클릭
		$("#deleteBtn").click(function() {
			if (confirm('삭제하시겠습니까?')) {
				deleteLedger($("#viewForm #no").val());				
			}
		})

		//검색 버튼 클릭
		$("#searchBtn").click(function() {
			//검색 기간 - 전체 선택 아닌 경우
			if (!$("#allDateCheckbox").prop("checked")) {
				//기간 선택 안한 경우
				if ($("#searchForm #startDate").val() == "" || $("#searchForm #endDate").val() == "") {
					alert("검색 기간을 지정해주세요.");
					return;
				}
				//String -> Date
				$("#searchForm #startDate").val(new Date($("#searchForm #startDate").val()));
				$("#searchForm #endDate").val(new Date($("#searchForm #endDate").val()));				
			}
			
			//금액 범위 - 전체 선택 아닌 경우
			if (!$("#allAmountCheckbox").prop("checked")) {
				//금액 입력 안한 경우
				if ($("#searchForm #startAmount").val() == 0 || $("#searchForm #endAmount").val() == 0) {
					alert("금액 범위를 지정해주세요.");
					return;
				}
				//String -> Integer
				$("#searchForm #startAmount").val(startAmount);
				$("#searchForm #endAmount").val(endAmount);				
			}
			
			var queryString = $("#searchForm").serialize();
			
			getSearchLedgerList(queryString);
			
			$("#searchFormResetBtn").css("display", "inline-block");
			$("#ledgerListResetBtn").css("display", "inline-block");
			
		});
		
		//search form reset
		$("#searchFormResetBtn").click(function() {
			searchFormReset();
		})
		
		//ledger list reset
		$("#ledgerListResetBtn").click(function() {
			getLedgerList();
			$(this).hide();
		})
		
		//검색 기간 전체 버튼 클릭
		$("#allDateBtn").click(function() {
			if ($("#allDateCheckbox").prop("checked")) {
				M.toast({
					html: '전체 검색 기간 OFF',
					displayLength: 2000,
					classes: 'rounded grey darken-2'
				});
				//기존 체크O -> 체크X
				$("#allDateCheckbox").removeAttr("checked");
				//remove disabled
				$("#searchForm #startDate").removeAttr("disabled");
				$("#searchForm #endDate").removeAttr("disabled");
				//색 변경
				$(this).addClass("grey darken-2");
				$(this).removeClass("indigo darken-3");
			} else {
				M.toast({
					html: '전체 검색 기간 ON',
					displayLength: 2000,
					classes: 'rounded indigo darken-3'
				});
				//기존 체크X -> 체크O
				$("#allDateCheckbox").attr("checked", true);
				//disabled
				$("#searchForm #startDate").attr("disabled", true);
				$("#searchForm #endDate").attr("disabled", true);
				//색 변경
				$(this).removeClass("grey darken-2");
				$(this).addClass("indigo darken-3");
			}
		})
		
		//금액 범위 전체 버튼 클릭
		$("#allAmountBtn").click(function() {
			if ($("#allAmountCheckbox").prop("checked")) {
				M.toast({
					html: '전체 금액 범위 OFF',
					displayLength: 2000,
					classes: 'rounded grey darken-2'
				});
				//기존 체크O -> 체크X
				$("#allAmountCheckbox").removeAttr("checked");
				//remove disabled
				$("#searchForm #startAmount").removeAttr("disabled");
				$("#searchForm #endAmount").removeAttr("disabled");
				//색 변경
				$(this).addClass("grey darken-2");
				$(this).removeClass("indigo darken-3");
			} else {
				M.toast({
					html: '전체 금액 범위 ON',
					displayLength: 2000,
					classes: 'rounded indigo darken-3'
				});
				//기존 체크X -> 체크O
				$("#allAmountCheckbox").attr("checked", true);
				//disabled
				$("#searchForm #startAmount").attr("disabled", true);
				$("#searchForm #endAmount").attr("disabled", true);
				//색 변경
				$(this).removeClass("grey darken-2");
				$(this).addClass("indigo darken-3");
			}
		})
		
		//가계부 목록에서 내용 클릭
		$(document).on("click", ".content", function() {
			//text 가져오기
			var no = $(this).parent().prev().prev().val();
			var addDate = $(this).parent().prev().text();
			var content = $(this).text();
			var inOut = $(this).parent().next().text();
			var category = $(this).parent().next().next().text();
			var amount = $(this).parent().next().next().next().text();
			var asset = $(this).parent().next().next().next().next().text();
			
			//insert value viewForm
			$("#viewForm #no").val(no);
			$("#viewForm #addDate").val(addDate);
			$("#viewForm #amount").val(amount);
			$("#viewForm #content").val(content);
			$("#viewForm .row:nth-child(4) input").val(inOut);
			if (inOut == '수입') {
				$("#viewForm #inOut option[value=in]").attr("selected", true);
				$("#viewForm #inCategory option[value="+ category +"]").attr("selected", true);
				$("#viewForm #in").show();
				$("#viewForm #out").hide();
			} else {
				$("#viewForm #inOut option[value=out]").attr("selected", true);
				$("#viewForm #outCategory option[value="+ category +"]").attr("selected", true);
				$("#viewForm #in").hide();
				$("#viewForm #out").show();
			}
			$("#viewForm .row:nth-child(5) input").val(category);
			
			$("#viewForm .row:nth-child(6) input").val(asset);
			$("#viewForm #asset option[value="+ asset +"]").attr("selected", true);
			
			viewModal.open();
		})
		
		//시작날짜 최대날짜를 종료날짜로 변경
		$("#startDate").focusin(function() {
			if ($("#endDate").val() != '') {
				startDatepicker.options.maxDate = endDatepicker.date;				
			}
		})
		
		//종료날짜 최소날짜를 시작날짜로 변경
		$("#endDate").focusin(function() {
			endDatepicker.options.minDate = startDatepicker.date;
		})
		
		/* Event End */
		
		
		/* Function List Start */
		
		//가계부 등록 Function
		function registLedger(queryString) {
			$.ajax({
				method: "post",
				url: "/ledger",
				data: queryString,
				success: function(res) {
					//registForm data reset
					$("#registForm")[0].reset();
					//alert
					alert(res.message);
					//reset data and getLedgerList
					$("#ledgerListTable tbody").html("");
					amount = 0;
					getLedgerList();
					//close registModal
					registModal.close();
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
		//가계부 수정 Function
		function updateLedger(queryString) {
			$.ajax({
				method: "put",
				url: "/ledger",
				data: queryString,
				success: function(res) {
					//alert
					alert(res.message);
					//reset data and getLedgerList
					$("#ledgerListTable tbody").html("");
					if ($("#ledgerListResetBtn").css("display") != "none") {
						getSearchLedgerList($("#searchForm").serialize());
					} else {
						getLedgerList();						
					}
					//close viewModal
					viewModal.close();
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
		//가계부 삭제 Function
		function deleteLedger(ledgerNo) {
			$.ajax({
				method: "delete",
				url: "/ledger/" + ledgerNo,
				success: function(res) {
					//alert
					alert(res.message);
					//reset data and getLedgerList
					$("#ledgerListTable tbody").html("");
					if ($("#ledgerListResetBtn").css("display") != "none") {
						getSearchLedgerList($("#searchForm").serialize());
					} else {
						getLedgerList();						
					}
					//close viewModal
					viewModal.close();
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
		//searchForm reset Function
		function searchFormReset() {
			$("#searchForm")[0].reset();
			$("#allDateCheckbox").removeAttr("checked");
			$("#allAmountCheckbox").removeAttr("checked");
			$("#allDateBtn").addClass("grey darken-2");
			$("#allDateBtn").removeClass("indigo darken-3");
			$("#allAmountBtn").addClass("grey darken-2");
			$("#allAmountBtn").removeClass("indigo darken-3");
		}
		
		//검색 결과 조회 Function
		function getSearchLedgerList(queryString) {
			
			$.ajax({
				method: "get",
				url: "/ledger/search?userNo=${user.no}",
				data: queryString,
				success: function(res) {
					//reset ledger list
					$("#ledgerListTable tbody").html("");
					
					appendLedgerListTable(res.data.list);
					var str = "(검색 : "+ res.data.count +"건)";
					$("#count").html(str);
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
		//가계부 목록 조회 Function
		function getLedgerList() {
			$.ajax({
				method: "get",
				url: "/ledger/list?userNo=${user.no}",
				success: function(res) {
					appendLedgerListTable(res.data.list);
					var str = "(전체 : "+ res.data.count +"건)";
					$("#count").html(str);
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
		
		//Date -> String Function
		function convertDateToString(originDate) {
			var year = originDate.getFullYear();
			var month = originDate.getMonth() + 1;
			month = month >= 10 ? month : "0" + month;
			var date = originDate.getDate();
			date = date > 10 ? date : "0" + date;
			
			return year + "-" + month + "-" + date;
		}
		
		//String -> Date Function
		function convertStringToDate(originString) {
			return new Date(originString);
		}
		
		//가계부 목록 테이블에 append Function
		function appendLedgerListTable(ledgerList) {
			//조회 결과가 없을 경우
			if (ledgerList.length == 0) {
				$("#ledgerListTable tbody").append("<tr><td colspan=6>조회 결과가 없습니다.</td></tr>");
				return;
			}
			
			ledgerList.forEach(function(ledger, index) {
				//날짜 형식 변경 Date -> String (yyyy-MM-dd)
				ledger.addDate = convertDateToString(new Date(ledger.addDate));
				//수입/지출 텍스트 변경
				ledger.inOut = ledger.inOut == 'in' ? '수입' : '지출';
				//금액 콤마 + "원"
				ledger.amount = ledger.amount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
				//가계부 목록 테이블에 append
				var str = "";
				
				str += "<tr>";
				str += "<input type='hidden' value='"+ ledger.no +"'>";
				str += "<td>" + ledger.addDate + "</td>";
				str += "<td><a class='content'>" + ledger.content + "</a></td>";
				str += "<td>" + ledger.inOut + "</td>";
				str += "<td>" + ledger.category + "</td>";
				str += "<td>" + ledger.amount + "</td>";
				str += "<td>" + ledger.asset + "</td>";
				str += "</tr>";
				
				$("#ledgerListTable tbody").append(str);
			})	
		}
		
		//세자리 콤마 + "원" Function
		function setCommaAndWon(target) {
			if (target.val() != "") {
				target.val(parseInt(target.val()));
				target.attr("type", "text");
				target.val(target.val().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");				
			}
		}
		
		//원본 금액 조회 Function
		function getOriginAmount(target) {
			if (target.val() != "") {
				target.val(target.val().replaceAll(",", "").replace("원", ""));
				target.attr("type", "number");
			}
		}
		
		/* Function List End */
		
	});

</script>
</html>