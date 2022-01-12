<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="myPageTop.jspf" %>

<link href="<%=request.getContextPath()%>/css/user/review.css" rel="stylesheet" type="text/css"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<div id="reviewPageTitle"><span class="h1style">나의후기</span></div>

<section class="page-wrap">
	<!-- 
	<div class="review-tab">
		<div class="review-write-tab">
			작성 가능한 후기
		</div>
		<div class="all-review-tab">
			지난 후기
		</div>
	</div>
	-->
	<div class="review-wrap">
		<div class="review-top">
			베스트순 | 최신순 | 사진리뷰 | 별점
		</div>
		<div class="review-list">
			<ul>
				<!-- 
				<li class="my-review-content">
					<div class="className"><a href="/classDetailView?no=">직접 만들고 선물하는 재미! 서진과 함께 뜨는 코바늘 수세미</a></div>
					<div class="user-review">
						<div class="review-info">
							<div class="user-img"><img src="/img/test/creator_01.PNG"/></div>
							<div class="user-review-info">
								<p>USERID</p>
								<p>2021.10.05</p>
							</div>
							<div class="star">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="far fa-star"></i>
							</div>
						</div>
						<div class="review-content">
							<div class="review-text">
								미션과 강의만 꾸준히 보고 배우면서 노력하다보면 제가 원하는 캐릭터들의 맛을 살릴 수 
								있을거 같아요 선생님의 열정 넘치시는 연기와 몰입도로 너무 <br/>
								재밌게 배우고 있습니다 
								언젠가 제가 연기한 캐릭터 목소리를 들으실 날이 오겠죠?ㅎㅎ<br/>
							</div>
							<div class="review-img">
								<img src="/img/test/06.jpg"/>
							</div>
						</div>
						<div class="more-btn">
							<a href="#">∨ 더 보기</a>
						</div>
					</div>
				</li>
				-->
			</ul>
		</div> <!-- review-list -->
		
		<div class="review-paging">
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
	
	
	
</section>

<script type="text/javascript">

$(document).ready(function(){
	
	var now_page=1; // 현재 페이지
	var total_page=1; // 총 페이지 수
	var onePageRecord=5; // 한 페이지당 레코드 수
	var nowPageRecord = onePageRecord; // 현재 페이지 레코드 수
	
	var userId = '${userId}'; // 로그인 회원 아이디
	
	// 페이지 세팅 + 리뷰 목록 불러오기
	function setMyReviewPage(){
		// 나의 후기 페이징 가져오기
		var pageUrl = '<%=request.getContextPath()%>/myReviewPage';
		var params = {'nowPage': now_page};
		$.ajax({
			url: pageUrl,
			data: params,
			success: function(result){
				var rr = $(result);
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
			
				$('.review-paging').html(pageTag);
				
				// 마지막 페이지일 때 남은 레코드 개수만큼만 보이게 설정
				if(rr[0].totalPage==rr[0].nowPage && rr[0].totalRecord % rr[0].oneGroupPage!=0){
					nowPageRecord = rr[0].totalRecord % rr[0].oneGroupPage;
				} else{
					nowPageRecord = onePageRecord;
				}
				
				
				// 나의 후기 목록 가져오기
				var url = '<%=request.getContextPath()%>/myReview';
				var data = {'nowPage': now_page, 'nowPageRecord':nowPageRecord, 'member_id': userId };
				$.ajax({
					url: url,
					data: data,
					success: function(result2){
						var r = $(result2);
						console.log(r);
						var tag = '';
						$('.review-list > ul').html('');
						r.each(function(idx, vo){
							tag = `<li class="my-review-content">
										<div class="class-name"><a href="<%=request.getContextPath()%>/classDetailView?no=` + vo.class_no + `" target="_blank">` + vo.class_name + `</a></div>
										<div class="user-review">
										<div class="review-info">
										<div class="user-img"><img src="` + vo.member_img + `"/></div>
											<div class="user-review-info">
												<p>` + vo.member_id + `</p>
												<p>` + vo.writedate + `</p>
											</div>
											<div class="star">
												<div class="back-star">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
												<div class="front-star" style="width:` + (vo.star/5) * 95 + `px">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</div>
										</div>
										<div class="review-content">
											<div class="review-text">
												` + vo.content + `
											</div>`;
											if(vo.img1 != ''){
												tag += '<div class="review-img"><img src="' + vo.img1 + '"/></div>';
											}
									tag += '</div></div></li>';
							
							$('.review-list > ul').append(tag);
							
							if($('.my-review-content').eq(idx).children().children().children('.review-text').height() > 120){
								var more = `<div class="more-btn"><input type="button" value="더 보기" /></div>`;
							}
							$('.my-review-content').eq(idx).children('.user-review').append(more);
							
						}); // each
						
					}, error: function(e){
						console.log('나의 후기 불러오기 에러');
					}
				}); // ajax 나의 후기 목록
				
				
				
			}, error: function(e){
				console.log('나의 후기 페이지 불러오기 에러');
			}
		}); // ajax 나의 후기 페이징
	
	}

	
	setMyReviewPage(); // 페이지 세팅 + 리뷰 목록 불러오기
	
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
		setMyReviewPage(); // 페이지 세팅 + 리뷰 목록 불러오기
	});
	
	
	
	$(document).on('click', '.more-btn > input', function(){
		if($(this).val()=='더 보기'){
			$(this).parent().prev().children('.review-text').css({'max-height': '1000px', 'display': 'block', 'overflow': 'visible', 'text-overflow': 'inherit'});
			$(this).val('접기');
		} else{
			$(this).parent().prev().children('.review-text').css({'max-height': '125px', 'display': '-webkit-box', 'overflow': 'hidden', 'text-overflow': 'ellipsis'});
			$(this).val('더 보기');
		}
		return false;
	});
	
	
});





</script>



<%@ include file="myPageBottom.jspf" %>