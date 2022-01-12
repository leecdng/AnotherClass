<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/admin/calcu.css" rel="stylesheet" type="text/css"/>

<article id="container" style="width:100%; margin:0 auto; padding: 0 20px;">
	<h3 class="text-h3">정산 관리</h3>
	
	
	
	
	<div class="list-wrap">
	
		<div class="search-box">
			<input type="text" id="searchWord"  placeholder="이름검색"/>
			<input type="date" id="dateSearchFirst" value="2020-10-01"/>
			<label>~</label>
			<input type="date" id="dateSearchLast" value="2021-12-01"/>
			<input type="button" id="serahButton"  value="검색"/>
		</div>
		<ul class="calcu-list calcu-col">
			<li class="c-col col-check"><input type="checkbox" class="select-calcu"/></li>
			<li class="c-col col-creator-id">크리에이터 ID</li>
			<li class="c-col col-end-date">결제 확정일</li>
			<li class="c-col col-calcu-dday">정산 예정일</li>
			<li class="c-col col-calcu-date">정산 완료일</li>
			<li class="c-col col-calcu-price">정산 금액 (A-B)</li>
			<li class="c-col col-sum-price">결제 금액(A)</li>
			<li class="c-col col-sum-charge">수수료 합계(B)</li>
		</ul>
		<ul id="calcuList" class="calcu-list">
			<!-- 
			<li class="c-item col-check"><input type="checkbox" class="select-calcu"/></li>
			<li class="c-item col-creator-id">creator1</li>
			<li class="c-item col-end-date">2021/11/11</li>
			<li class="c-item col-calcu-dday">2021/11/11</li>
			<li class="c-item col-calcu-date">2021/11/11</li>
			<li class="c-item col-calcu-price">1,212,354원</li>
			<li class="c-item col-sum-price">1,212,354원</li>
			<li class="c-item col-sum-charge">1,212,354원</li>
			 -->
		</ul>
		<div class="calcu-btn-wrap"><button type="button" class="calcu-btn">정산하기</button></div>
		<div class="calcu-paging">
			<!-- <ul>
				<li class="page-num" id="prev-page"><a href="#">◀</a></li>
				<li class="page-num"><a href="#">1</a></li>
				<li class="page-num active"><a href="#">2</a></li>
				<li class="page-num"><a href="#">3</a></li>
				<li class="page-num"><a href="#">4</a></li>
				<li class="page-num"><a href="#">5</a></li>
				<li class="page-num" id="next-page"><a href="#">▶</a></li>
			</ul> -->
		</div>
	
	</div>




</article>


<script type="text/javascript">
//금액 숫자 3자리 단위마다 콤마(,) 찍기
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


$(document).ready(function(){
	
	var now_page=1; // 현재 페이지
	var total_page=1; // 총 페이지 수
	var onePageRecord=10; // 한 페이지당 레코드 수
	var nowPageRecord = onePageRecord; // 현재 페이지 레코드 수
	var searchWord;
	var dateSearchFirst;
	var dateSearchLast;
	
	$(document).on('click','#serahButton', function(){
		searchWord = $('#searchWord').val();
		dateSearchFirst = $('#dateSearchFirst').val().replaceAll('-','/');
		dateSearchLast = $('#dateSearchLast').val().replaceAll('-','/');
		console.log(dateSearchFirst);
		
		setPage();
	});
	

	
	// 페이지 세팅 + 목록 불러오기
	function setPage(){
		// 페이징 가져오기
		var pageUrl = '<%=request.getContextPath()%>/adminCalcuPage';
		var params = {'nowPage': now_page, 'searchWord':searchWord, 'dateSearchFirst': dateSearchFirst, 'dateSearchLast': dateSearchLast };
		$.ajax({
			url: pageUrl,
			data: params,
			success: function(result2){
				var rr = $(result2);
				total_page = rr[0].totalPage;
				var pageTag = '<ul>';
				pageTag += '<li class="page-num" id="prev-page"><a href="javascript:void(0);">◀</a></li>';
				for(var i=rr[0].groupStartPage; i<=(rr[0].groupStartPage + rr[0].oneGroupPage-1); i++){
					if(i <= rr[0].totalPage){
						pageTag += '<li class="page-num';
						if(now_page==i){ // 현재 페이지 active 클래스 주기
							pageTag += ' active';
						}
						pageTag += '"><a href="javascript:void(0);">' + i + '</a></li>';
					} //if
				} // for
				pageTag += '<li class="page-num" id="next-page"><a href="javascript:void(0);">▶</a></li></ul>';
			
				$('.calcu-paging').html(pageTag);
				
				// 마지막 페이지일 때 남은 레코드 개수만큼만 보이게 설정
				if(rr[0].totalPage==rr[0].nowPage && rr[0].totalRecord % rr[0].oneGroupPage!=0){
					nowPageRecord = rr[0].totalRecord % rr[0].oneGroupPage;
				} else{
					nowPageRecord = onePageRecord;
				}
				
				// 정산 목록 가져오기
				var url = '<%=request.getContextPath()%>/selectAdminCalcuList';
				var data = {'nowPage': now_page, 'nowPageRecord':nowPageRecord, 'searchWord':searchWord, 'dateSearchFirst': dateSearchFirst, 'dateSearchLast': dateSearchLast };
				$.ajax({
					url: url,
					data: data,
					success: function(result){
						var r = $(result);
						var tag = '';
						$('#calcuList').html('');
						r.each(function(idx, vo){
							tag = `<li class="c-item col-check"><input type="checkbox" class="select-calcu" /></li>
								<li class="c-item col-creator-id">` + vo.member_id + `</li>
								<li class="c-item col-end-date">` + vo.end_date + `</li>
								<li class="c-item col-calcu-dday">` + vo.calcu_dday + `</li>
								<li class="c-item col-calcu-date">` + vo.calcu_date + `</li>
								<li class="c-item col-calcu-price">` + numberWithCommas(vo.calcu_price) + `원</li>
								<li class="c-item col-sum-price">` + numberWithCommas(vo.sum_price) + `원</li>
								<li class="c-item col-sum-charge">` + numberWithCommas(vo.sum_charge) + `원</li>`;
							
							
							$('#calcuList').append(tag);
							
						}); // each
						
					}, error: function(e){
						console.log('정산 목록 불러오기 에러');
					}
				}); // ajax 정산 목록 가져오기
				
				
				
			}, error: function(e){
				console.log('정산 목록 페이지 불러오기 에러');
			}
		}); // ajax 정산 목록 페이징
	
	}

	
	setPage(); // 페이지 세팅 + 정산 목록 불러오기
	
	// 페이지 번호 클릭 이벤트
	$(document).on('click','.page-num > a', function(e){
	
		if($(this).parent().attr('id')=='prev-page'){
			if(now_page>1){
				now_page--;
			} else{
				return false;
			}
		} else if($(this).parent().attr('id')=='next-page'){
			if(now_page < total_page){
				now_page++;
			} else{
				return false;
			}
		} else{
			now_page = parseInt($(this).text());
		}
		setPage(); // 페이지 세팅 + 정산 목록 불러오기
	});
	
	
	
	// 정산 완료일 바꾸기
	$(document).on('click','.calcu-btn', function(){
		console.log('실행1');
		$('.select-calcu').each(function(){
			if($(this).prop('checked')==true){
				var tmp = $(this);
				setTimeout(function() {
					tmp.parent().next().next().next().next().text('2021/10/29');
				}, 1800);
				
			}
		});
		
	});
	
});





</script>
