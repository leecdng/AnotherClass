<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<%=request.getContextPath()%>/css/creator/dashboard.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/creator/Chart.min.css" rel="stylesheet" type="text/css"/>
<!-- Script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>


<style>
/* 통계 정보 */

#incomeInfo{
	width:60%;
}

.income-info-box{
	width:49%;
}

</style>

</head>
<body style="background-color:#eee;">
	<article id="container" style="background-color:#fff; width:100%; height:1000px; margin:0 auto; padding: 0 20px;">
		
		<div class="income-top">
			<section id="incomeInfo">
				<div class="income-info-box">
					<div class="income-sub-title">예정 강의</div>
					<div class="income-info-view">
						<ul>
							<li>
								<p class="incomn-attr">날짜</p>
								<p class="income-val">${ccvo1.start_date}</p>
							</li>
							<li>
								<p class="incomn-attr">수강인원</p>
								<p class="income-val">${ccvo1.headcount} / ${ccvo1.all_headcount} 명</p>
							</li>
							<li>
								<p class="incomn-attr">수강률</p>
								<p class="income-val">${ccvo1.rate} %</p>
							</li>
						</ul>
					</div>
				</div>

				<div class="income-info-box">
					<div class="income-sub-title">수강 관리</div>
					<div class="income-info-view">
						<ul>
							<li>
								<p class="incomn-attr">신규 예약</p>
								<p class="income-val">${ccvo2.new_headcount} 명</p>
							</li>
							<li>
								<p class="incomn-attr">수강 예정 인원</p>
								<p class="income-val">${ccvo2.exp_headcount} 명</p>
							</li>
							<li>
								<p class="incomn-attr">수강 신청률</p>
								<p class="income-val">${ccvo2.rate} %</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="income-info-box">
					<div class="income-sub-title">수익 관리</div>
					<div class="income-info-view">
						<ul>
							<li>
								<p class="incomn-attr">이번 달 수익</p>
								<p class="income-val"><fmt:formatNumber value="${ccvo3.month_total_price}" type="number"/> 원</p>
							</li>
							<li>
								<p class="incomn-attr">총 수익</p>
								<p class="income-val"><fmt:formatNumber value="${ccvo3.all_total_price}" type="number"/> 원</p>
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
								<p class="income-val">720,000원</p>
							</li>
							<li>
								<p class="incomn-attr">총 정산</p>
								<p class="income-val">1,340,000원</p>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<section id="pieChart">
				<div class="income-sub-title">수강생 만족도</div>
				<div class="pie-chart-view">
					<canvas id="chart1"></canvas>
				</div>
			</section>
		</div>
		<section id="incomeChart">
			<div class="income-chart-wrap">
				<div class="income-sub-title">클래스 수익 통계</div>
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
	// chart1
	var ctx = document.getElementById('chart1').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'pie',
	    data: {
	        labels: ['★ 매우 불만족', '★★ 불만족', '★★★ 보통', '★★★★ 만족', '★★★★★ 매우 만족'],
	        datasets: [{
	            label: '# of Votes',
	            data: [1, 1, 10, 50, 42],
	            backgroundColor: [
	                'rgba(54, 162, 235, 0.7)',
	                //'rgba(153, 102, 255, 0.7)',
	                'rgba(255, 159, 64, 0.7)',
	                'rgba(255, 206, 86, 0.7)',
	                'rgba(75, 192, 192, 0.7)',
	                'rgba(255, 99, 132, 0.7)',
	            ],
	            borderColor: [
	                'rgba(54, 162, 235, 0.5)',
	                //'rgba(153, 102, 255, 0.5)',
	                'rgba(255, 159, 64, 0.5)',
	                'rgba(255, 206, 86, 0.5)',
	                'rgba(75, 192, 192, 0.5)',
	                'rgba(255, 99, 132, 0.5)',
	            ],
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
		            data: [12, 19, 3.5, 15.7, 7.8, 30.3, 52, 40, 54, 22, 0, 0],
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
	
</body>
</html>