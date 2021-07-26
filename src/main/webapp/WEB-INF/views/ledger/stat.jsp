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
			<h5>Today <small>(수입 : ${todayStat.incomeCnt}건 / 지출 : ${todayStat.outgoingsCnt}건)</small></h5>
			<div class="right-align">
				<div class="red" style="width: 15px; height: 15px; display: inline-block;"></div>
				수입
				<div class="blue" style="width: 15px; height: 15px; display: inline-block;"></div>
				지출
			</div>
		</div>
		<div class="row">
			<div class="col s10">
				<div id="income" class="red tooltipped center-align white-text" data-position="top" data-tooltip="<fmt:formatNumber value="${todayStat.income}" pattern="#,###" />원" style="height: 20px; float: left;"></div>
				<div id="outgoings" class="blue tooltipped center-align white-text" data-position="top" data-tooltip="<fmt:formatNumber value="${todayStat.outgoings}" pattern="#,###" />원" style="height: 20px; float: left;"></div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var tooltip = document.querySelectorAll('.tooltipped');
			var tooltipInstances = M.Tooltip.init(tooltip);
		});
		
		$(document).ready(function() {
			$(".material-tooltip:first").addClass("red darken-2");
			$(".material-tooltip:last").addClass("blue darken-2");
			
			var income = ${todayStat.income};
			var outgoings = ${todayStat.outgoings};
			
			var incomeWidth = (income / (income + outgoings) * 100).toFixed(1) + "%";
			var outgoingsWidth = (outgoings / (income + outgoings) * 100).toFixed(1) + "%";
			
			$("#income").css("width", incomeWidth);
			$("#outgoings").css("width", outgoingsWidth);
			
		});
		
	</script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>