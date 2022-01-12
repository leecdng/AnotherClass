<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href="<%=request.getContextPath()%>/css/user/review.css" rel="stylesheet" type="text/css"/>

<div class="select-class" style="width:800px">
	<select class="select-class-list">
		<c:forEach var="vo" items="${vo}">	
			<option value="${vo.class_no}">[${vo.class_no}] ${vo.class_name} </option>
		</c:forEach>
	</select>

</div>

<div class="review-wrap" style="width:800px">
	<div class="review-list">
		<ul>
		<!-- 후기 목록 -->

		</ul>
	</div> <!-- review-list -->
	<div class="review-paging">
	<!-- 페이징 -->
	</div>
</div>
	

<!-- 후기 -->


<script type="text/javascript">

$(document).ready(function(){
	
	var now_page=1; // 현재 페이지
	var total_page=1; // 총 페이지 수
	var onePageRecord=5; // 한 페이지당 레코드 수
	var nowPageRecord = onePageRecord; // 현재 페이지 레코드 수
	
	var memberId = '${creatorId}'; // 로그인 회원 아이디
	var memberImg = '${creatorImg}'; // 로그인 회원 이미지
	var class_no = $('.select-class-list').val(); // 해당 클래스 번호
	
	$(document).on('change','.select-class-list', function(){
		console.log('v체[인지');
		class_no = $(this).val();
		console.log(class_no);
		setClassReviewPage();
	});
	
	console.log(class_no);
	
	// 페이지 세팅 + 리뷰 목록 불러오기
	function setClassReviewPage(){
		console.log('qmnffkdjrlrlrl');
		// 클래스 후기 페이징 가져오기
		var pageUrl = '<%=request.getContextPath()%>/classReviewPage';
		var params = {'nowPage': now_page, 'class_no': class_no};
		$.ajax({
			url: pageUrl,
			data: params,
			success: function(result){
				var r = $(result);
				total_page = r[0].totalPage;

				var pageTag = '<ul>';
				pageTag += '<li class="page-num" id="prev-page"><a href="#">◀</a></li>';
				for(var i=r[0].groupStartPage; i<=(r[0].groupStartPage + r[0].oneGroupPage-1); i++){
					if(i <= r[0].totalPage){
						pageTag += '<li class="page-num';
						if(now_page==i){ // 현재 페이지 active 클래스 주기
							pageTag += ' active';
						}
						pageTag += '"><a href="#">' + i + '</a></li>';
					} //if
				} // for
				pageTag += '<li class="page-num" id="next-page"><a href="#">▶</a></li></ul>';
				
				$('.review-paging').html(pageTag);
				$('.class-review-cnt').text(r[0].totalRecord);
				
				// 마지막 페이지일 때 남은 레코드 개수만큼만 보이게 설정
				if(r[0].totalPage==r[0].nowPage && r[0].totalRecord % r[0].oneGroupPage != 0){
					nowPageRecord = r[0].totalRecord % r[0].oneGroupPage;
				} else{
					nowPageRecord = onePageRecord;
				}
				
				
				// 클래스 후기 목록 가져오기
				var url = '<%=request.getContextPath()%>/classReviewList';
				var data = {'nowPage': now_page, 'nowPageRecord':nowPageRecord, 'class_no': class_no };
				$.ajax({
					url: url,
					data: data,
					success: function(result2){
						var rr = $(result2);
						console.log(rr);
						var tag = '';
						$('.review-list > ul').html('');
						rr.each(function(idx, rvo){
							tag = `<li class="class-review-content">
							<input type="hidden" class="review_no" name="review_no" value="` + rvo.review_no + `"/>
							<div class="user-review">
							<div class="review-info">
								<div class="user-img"><img src="` + rvo.member_img + `"/></div>
								<div class="user-review-info">
									<p>` + rvo.member_id + `</p>
									<p>` + rvo.writedate + `</p>
								</div>
								<div class="star">
									<div class="back-star">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</div>
									<div class="front-star" style="width:` + (rvo.star/5) * 108 + `px">
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
									` + rvo.content + `
								</div>
							</div>
						</div> <!-- //user-review 리뷰 내용 -->
						
						<div class="review-comment-write">
							<div class="comment-info">
								<div class="user-img"><img src="` + memberImg + `"/></div>
							</div>
							<form class="reviewCommentFrm">
								<input type="hidden" class="review_no" name="review_no" value="` + rvo.review_no + `"/>
								<input type="hidden" class="review_com_no2" name="com_no2" value="0"/>
								<textarea class="review-reply" name="reply" placeholder="댓글을 입력해주세요."></textarea>
								<input class="review-reply-btn" type="button" value="등록"/>
							</form>
						</div> <!-- // review-comment-write 댓글 작성 폼 -->
						<ul class="review-comment-list" style="display:none;"> <!-- 댓글 목록 영역-->
						
						</ul>
					</li>`;
							
							$('.review-list > ul').append(tag);
							
							if($('.class-review-content').eq(idx).children().children().children('.review-text').height() > 120){
								var more = `<div class="more-btn"><input type="button" value="더 보기" /></div>`;
							}
							$('.class-review-content').eq(idx).children('.user-review').append(more);
							
							// 후기 댓글 조회
							selectReviewComment(rvo.review_no, 0);
							
						}); // each
						
					}, error: function(e){
						console.log('클래스 후기 불러오기 에러');
					}
				}); // ajax 나의 후기 목록
				
				
				
			}, error: function(e){
				console.log('클래스 후기 페이지 불러오기 에러');
			}
		}); // ajax 나의 후기 페이징
	
	} // setClassReviewPage() // 페이지 세팅 + 리뷰 목록 불러오기

	
	setClassReviewPage(); // 페이지 세팅 + 리뷰 목록 불러오기------------------
	
	// 페이지 번호 클릭 이벤트
	$(document).on('click','.page-num > a', function(){
	
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
		setClassReviewPage(); // 페이지 세팅 + 리뷰 목록 불러오기
	});
	
	
	
	
	
	// 후기 댓글 조회
	function selectReviewComment(review_num, review_com_num){
		
		var url = '<%=request.getContextPath()%>/selectReviewComment';
		var data = {'review_no': review_num, 'review_com_no': review_com_num };
		$.ajax({
			url: url,
			data: data,
			success: function(result){
				var re = $(result);
				console.log(re);
				var comTag = '';
				
				re.each(function(idx, com){
					if(com.com_no2 == 0){ // 원댓글이면
						comTag = `<li class="review-comment">
						<input type="hidden" class="review_com_no" name="review_com_no" value="` + com.review_com_no + `" />
							<div class="comment-item">
								<div class="comment-info">
									<div class="user-img"><img src="` + com.member_img + `"/></div>
								</div>
								
								<div class="comment-text">
									<span class="user-review-info">` + com.member_id + `</span>`;
									if(com.delete_sort==0){
										comTag += com.reply;
									} else{
										comTag += `<span class="delete-comment">삭제된 댓글입니다.</span>`;
									}
									
									comTag += `<div class="comment-menu">
										<span class="write-date">` + com.writedate + `</span>
										<a class="write-re-comment-btn" href="javascript:void(0);">답글 쓰기</a>`;
										if(com.member_id == memberId){
											comTag += `<a class="comment-delete" href="javascript:void(0);">삭제</a>`;
										}
									comTag += `</div>
								</div>
							</div>
							<ul class="comment-reply" style="display:none;">
							
							</ul> <!-- // comment-reply 대댓글 목록 영역 -->
						</li> <!-- //review-comment 댓글 1개 -->`;
						
						
						$('.class-review-content').each(function(){
							if($(this).children('.review_no').val()==com.review_no){
								$(this).children('.review-comment-list').append(comTag);
								$(this).children('.review-comment-list').show();
							}
						});
					} else if(com.com_no2 == 1){ // 대댓글이면
						comTag = `<li class="reply-item comment-item">
							<input type="hidden" class="review_com_no" name="review_com_no" value="` + com.review_com_no + `" />
							<div class="comment-info">
								<div class="user-img"><img src="` + com.member_img + `"/></div>
							</div> <!-- 대댓글 프로필 이미지 -->
							
							<div class="reply-text" >
								<span class="user-review-info">` + com.member_id + `</span>`
								+ com.reply +
								`<div class="comment-menu">
								<span class="write-date">` + com.writedate + `</span>`;
								if(com.member_id == memberId){
									comTag += `<a class="comment-delete" href="javascript:void(0);">삭제</a>`;
								}
							comTag += `</div>
							</div>
						</li> <!-- //comment-reply 대댓글 1개 -->`;
						
						
						$('.review-comment').each(function(){
							console.log('dd');
							if($(this).children('.review_com_no').val() == com.com_no1){
								console.log('ddddd');
								$(this).children('.comment-reply').append(comTag);
								$(this).children('.comment-reply').show();
							}
						});

					} // if
					
				}); // each
			}, error: function(e){
				console.log('클래스 후기 댓글 조회 에러');
			}
		});

	}
	
	
	
	// 댓글 등록 버튼 클릭 시
	$(document).on('click', '.review-reply-btn', function(){
		var review_no = $(this).parent().children('.review_no').val(); // 후기 번호
		var com_no1; // 원댓글 번호
		var com_no2 = $(this).parent().children('.review_com_no2').val(); // 원댓 대댓 구분 번호
		var review_reply = $(this).parent().children('.review-reply').val(); // 댓글 내용
		var review_comment_write = $(this).parent().parent(); // 대댓글 작성창
		
		if(memberId==null || memberId==''){
			alert('댓글 작성은 로그인 후 이용하실 수 있습니다.');
			return false;
		} else if(review_reply == ''){
			alert('댓글 내용을 입력해 주세요.');
			return false;
		}
		
		if(com_no2 == 1){ // 대댓글 등록 시
			com_no1 = $(this).parent().parent().parent().children('.review_com_no').val();
			review_no = $(this).parent().parent().parent().parent().parent().children('.review_no').val();
		}
		
		// 후기 댓글 등록	
		var url = '<%=request.getContextPath()%>/writeReviewComment';
		var data = {'review_no': review_no, 'com_no1':com_no1, 'com_no2':com_no2, 'member_id': memberId, 'reply': review_reply };
		$.ajax({
			url: url,
			data: data,
			success: function(result){
				var review_com_no = parseInt($(result)[0]); // 방금 등록한 댓글 번호 가져오기
				if(review_com_no > 0){ //  댓글 등록 성공 시
					// alert('댓 등록 성공');
					selectReviewComment(review_no, review_com_no); // 후기 댓글 조회 - 방금 등록한 댓글만 추가됨
				} else{
					alert('댓글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.');
				}
			}, error: function(e){
				console.log('클래스 후기 댓글 등록 에러');
			}
		}); // ajax 후기 댓글 등록
		
		if(com_no2 == 0){ // 원댓글 등록 시
			$(this).parent().children('.review-reply').val(''); // review_reply 댓글 내용 지우기
		} else if(com_no2 == 1){ // 대댓글 등록 시
			review_comment_write.prev().children('.comment-text').children('.comment-menu').children('.write-re-comment-btn').text('답글 쓰기');
			review_comment_write.remove(); // 대댓글 작성창 제거
		}
		
	}); // -- 댓글 등록 버튼 클릭 이벤트

	
	
	// 삭제 버튼 클릭 시
	$(document).on('click', '.comment-delete', function(){
		if($(this).parent().parent().children('.delete-comment').text()!=''){ // 삭제된 댓글인지 확인
			alert('이미 삭제된 댓글입니다.');
			return false;
		}
		
		var delCheck = confirm("댓글을 정말 삭제하시겠습니까?");
		if(delCheck == true){
			var review_no = $(this).parents('.class-review-content').children('.review_no').val();
			var review_com_no = $(this).parents('.reply-item').children('.review_com_no').val(); // 대댓글 번호 담기
			if(typeof review_com_no == "undefined" || review_com_no == "" || review_com_no == null){ // 원댓글 번호 담기
				review_com_no = $(this).parents('.review-comment').children('.review_com_no').val();
			}
			var review_com = $(this).parents('.review-comment-list');
			// 해당 댓글에 대댓글 있나 확인하고 삭제하기
			var url = '<%=request.getContextPath()%>/deleteReviewComment';
			var data = {'review_com_no': review_com_no, 'member_id': memberId };
			$.ajax({
				url: url,
				data: data,
				success: function(result){
					var result = $(result);
					review_com.html('');
					selectReviewComment(review_no, 0); 
				}, error: function(e){
					console.log('클래스 후기 댓글 삭제 에러');
				}
			}); // ajax 후기 댓글 삭제
		
		} // confirm
	
	});
	
	
	
	
	
	// 답댓글 쓰기 폼
	var writeTag = `<div class="review-comment-write">
						<div class="comment-info">
							<div class="user-img"><img src="` + memberImg + `"/></div>
						</div>
						<form class="replyFrm">
							<input type="hidden" class="review_com_no2" name="com_no2" value="1"/>
							<textarea class="review-reply" name="reply" placeholder="댓글을 입력해주세요."></textarea>
							<input class="review-reply-btn" type="button" value="등록"/>
						</form>
					</div> <!-- // review-comment-write 댓글 작성 폼 // 답글쓰기 클릭 시 -->`;
	// 답글 쓰기 버튼 클릭 시
	$(document).on('click', '.write-re-comment-btn', function(){
		if($(this).text() == '답글 쓰기'){
			$(this).parent().parent().parent().after(writeTag);
			$(this).text('답글 쓰기 취소');
		} else{
			$(this).parent().parent().parent().next('.review-comment-write').remove();
			$(this).text('답글 쓰기');
		}
	});
	
	
	
	// 댓글 텍스트 '더 보기' 버튼 클릭 시
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
