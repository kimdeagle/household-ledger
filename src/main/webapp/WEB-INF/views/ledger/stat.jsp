<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/lnb.jsp" %>

	<div class="col s9">
		<div class="row">
			<h4><i class="material-icons">equalizer</i> 가계부 통계</h4>
		</div>
		<div class="row right-align">
			<a id="today" class="btn waves-effect waves-light">Today</a>
			<a id="monthly" class="btn waves-effect waves-light indigo">월간</a>
			<a id="annual" class="btn waves-effect waves-light deep-orange">연간</a>
			<a id="setDate" class="btn waves-effect waves-light grey">기간 설정</a>
		</div>
		<div class="row">
			<h5 id="title">Today <small>(수입 : ${stat.incomeCnt}건 / 지출 : ${stat.outgoingsCnt}건)</small></h5>
			<div class="right-align">
				<div class="red" style="width: 15px; height: 15px; display: inline-block;"></div>
				수입
				<div class="blue" style="width: 15px; height: 15px; display: inline-block;"></div>
				지출
			</div>
		</div>
		<div class="row">
			<div class="col s10">
				<c:if test="${stat.income == 0 && stat.outgoings == 0}">
					<h5 class="center-align">수입 / 지출 항목이 없습니다.</h5>
				</c:if>
				<div id="income" class="red tooltipped center-align white-text" data-position="top" data-tooltip="<fmt:formatNumber value="${stat.income}" pattern="#,###" />원" style="height: 20px; float: left;"></div>
				<div id="outgoings" class="blue tooltipped center-align white-text" data-position="top" data-tooltip="<fmt:formatNumber value="${stat.outgoings}" pattern="#,###" />원" style="height: 20px; float: left;"></div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var tooltip = document.querySelectorAll('.tooltipped');
			var tooltipInstances = M.Tooltip.init(tooltip);
		});
		
		$(document).ready(function() {
			var incomeTooltip = M.Tooltip.getInstance($("#income"));
			var outgoingsTooltip = M.Tooltip.getInstance($("#outgoings"));
			$(".material-tooltip:first").addClass("red darken-2");
			$(".material-tooltip:last").addClass("blue darken-2");
			
			var income = parseInt(${stat.income});
			var outgoings = parseInt(${stat.outgoings});
			
			var incomeWidth = (income / (income + outgoings) * 100).toFixed(1) + "%";
			var outgoingsWidth = (outgoings / (income + outgoings) * 100).toFixed(1) + "%";
			
			$("#income").css("width", incomeWidth);
			$("#outgoings").css("width", outgoingsWidth);
			
			$("#today").click(function() {
				location.reload();
			});
			
			$("#monthly").click(function() {
				$.ajax({
					method: "get",
					url: "/ledger/stat/monthly",
					success: function(res) {
						console.log(res);
						
						income = parseInt(res.income);
						outgoings = parseInt(res.outgoings);
						
						incomeWidth = (income / (income + outgoings) * 100).toFixed(1) + "%";
						outgoingsWidth = (outgoings / (income + outgoings) * 100).toFixed(1) + "%";
						
						$("#title").html(res.date.substring(0, 4) + "년 " + res.date.substring(5) + "월 <small>(수입 : " + res.incomeCnt + "건 / 지출 : " + res.outgoingsCnt + "건)</small>");
						incomeTooltip.el.dataset.tooltip = income.toLocaleString('ko-KR') + "원";
						outgoingsTooltip.el.dataset.tooltip = outgoings.toLocaleString('ko-KR') + "원";
						
						$("#income").css("width", incomeWidth);
						$("#outgoings").css("width", outgoingsWidth);
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
			
			$("#annual").click(function() {
				$.ajax({
					method: "get",
					url: "/ledger/stat/annual",
					success: function(res) {
						console.log(res);
						
						income = parseInt(res.income);
						outgoings = parseInt(res.outgoings);
						
						incomeWidth = (income / (income + outgoings) * 100).toFixed(1) + "%";
						outgoingsWidth = (outgoings / (income + outgoings) * 100).toFixed(1) + "%";
						
						$("#title").html(res.date + "년 <small>(수입 : " + res.incomeCnt + "건 / 지출 : " + res.outgoingsCnt + "건)</small>");
						incomeTooltip.el.dataset.tooltip = income.toLocaleString('ko-KR') + "원";
						outgoingsTooltip.el.dataset.tooltip = outgoings.toLocaleString('ko-KR') + "원";
						
						$("#income").css("width", incomeWidth);
						$("#outgoings").css("width", outgoingsWidth);
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
			
			$("#setDate").click(function() {
				$.ajax({
					method: "get",
					url: "/ledger/stat/setDate",
					success: function(res) {
						
					},
					error: function(err) {
						
					}
				});
			});
			
		});
		
	</script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>