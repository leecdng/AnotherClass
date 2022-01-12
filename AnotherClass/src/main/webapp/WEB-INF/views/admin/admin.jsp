<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="<%=request.getContextPath()%>/css/creator/dashboard.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/creator/Chart.min.css" rel="stylesheet" type="text/css"/>


<style>
/* 통계 정보 */

#incomeInfo{
	width:100%;
}

.income-info-box{
	width:32%;
}

</style>

	<article id="container" style="background-color:#fff; width:100%; height:1000px; margin:0 auto; padding: 0 20px;">
		<section class="top-notice">
			<div class="top-notice-title">
				2021년 1월 (20년도 제2기) 부가세신고 관련하여 안내 드립니다. 2021.01.04
			</div>
		</section>
		<div class="income-top">
			<section id="incomeInfo">
				<div class="income-info-box">
					<div class="income-sub-title">답변대기 문의</div>
					<div class="income-info-view">
						<ul>
							<li>
								<p class="incomn-attr">고객 문의</p>
								<p class="income-val">22 건</p>
							</li>
							<li>
								<p class="incomn-attr">크리에이터 문의</p>
								<p class="income-val">15 건</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="income-info-box">
					<div class="income-sub-title">총 강의 현황</div>
					<div class="income-info-view">
						<ul>
							<li>
								<p class="incomn-attr">오늘 날짜</p>
								<p class="income-val">2021년 10월 29일</p>
							</li>
							<li>
								<p class="incomn-attr">수강인원</p>
								<p class="income-val">230 명</p>
							</li>
							<li>
								<p class="incomn-attr">수강률</p>
								<p class="income-val">78%</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="income-info-box">
					<div class="income-sub-title">정산 관리</div>
					<div class="income-info-view">
						<ul>
							<li>
								<p class="incomn-attr">정산 예정</p>
								<p class="income-val">3,720,000원</p>
							</li>
							<li>
								<p class="incomn-attr">총 정산</p>
								<p class="income-val">122,340,000원</p>
							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
		
		<section id="incomeChart">
			<div class="income-chart-wrap">
				<div class="income-sub-title">총 수익 통계</div>
				<div class="income-chart-select">
					<ul>
						<li>수강건수</li>
						<li>일별수익</li>
						<li class="on">월별수익</li>
					</ul>
				</div>
				<div class="income-chart-view">
					<canvas id="chart2"></canvas>
				</div>
			</div>
		
		</section>
	
	
	
	</article>
	
<script src="<%=request.getContextPath()%>/js/Chart.min.js"></script>

<script>
	const MONTHS = [
	  '1월',
	  '2월',
	  '3월',
	  '4월',
	  '5월',
	  '6월',
	  '7월',
	  '8월',
	  '9월',
	  '10월',
	  '11월',
	  '12월'
	];

	function months(config) {
	  var cfg = config || {};
	  var count = cfg.count || 12;
	  var section = cfg.section;
	  var values = [];
	  var i, value;

	  for (i = 0; i < count; ++i) {
	    value = MONTHS[Math.ceil(i) % 12];
	    values.push(value.substring(0, section));
	  }

	  return values;
	}
	
	
	// chart2
	var ctx = document.getElementById('chart2').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: months({count: 12}),
	        datasets: [{
	            label: '만원',
	            data: [789, 794, 735, 756, 780, 812, 820, 884, 910, 820],
	            backgroundColor: 'rgba(255, 99, 132, 0.3)',
	            borderColor: 'rgba(255, 99, 132, 0.1)',
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	maintainAspectRatio: false,
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});


</script>

