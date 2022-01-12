<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- Demo styles -->
<style>
	
	.swiper {
		width: 100%;
	}
	
	.swiper-slide {
		text-align: center;
		font-size: 18px;
		background: #eee;
		/* Center slide text vertically */
		display: -webkit-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		-webkit-align-items: center;
		align-items: center;
	}
	
	.swiper-slide img {
		display: block;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.swiper {
		margin-left: auto;
		margin-right: auto;
	}

</style>


<article id="container">
	<section class="main-slide">
		<!-- Swiper -->
		<div class="swiper mainSwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide v01" style="overflow:hidden;">
					<video src="<%=request.getContextPath()%>/img/visual/visual_01.mp4" loop autoplay muted></video>
					<div class="main-slide-text">
						<div class="inner-lg">
							<p>클래스가 다른 클래스<br/>
							<span class="text700">another class</span>
							</p>
							<div class="main-slide-btn">
								<a href="<%=request.getContextPath()%>/classList">클래스 둘러보기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide v02" style="overflow:hidden;">
					<video src="<%=request.getContextPath()%>/img/visual/visual_02.mp4" loop autoplay muted></video>
					<div class="main-slide-text">
						<div class="inner-lg">
							<p>걸어서 15분 거리<br/>
							우리 동네에도 클래스가 있을까?
							</p>
							<div class="main-slide-btn">
								<a href="<%=request.getContextPath()%>/classMap">내 주변 클래스 찾기</a>
							</div>
						</div>
					</div>
					<div class="black"></div>
				</div>
				<div class="swiper-slide v03" style="overflow:hidden;">
					<video src="<%=request.getContextPath()%>/img/visual/visual_03.mp4" loop autoplay muted></video>
					<div class="main-slide-text">
						<div class="inner-lg">
							<p>한 달에 한 번,<br/>하고 싶은 일 하기<br/>
							<span class="text700">#어나더클래스챌린지</span>
							</p>
							<div class="main-slide-btn">
								<a href="<%=request.getContextPath()%>/CommunityMain">챌린지 참여하기</a>
							</div>
						</div>
					</div>
					<div class="black"></div>
				</div>
				<div class="swiper-slide v04" style="overflow:hidden;">
					<video src="<%=request.getContextPath()%>/img/visual/visual_04.mp4" loop autoplay muted></video>
					<div class="main-slide-text">
						<div class="inner-lg">
							<p>배워보고 싶었던 운동도 이제<br/>어나더클래스 하세요.<br/>
							</p>
							<div class="main-slide-btn">
								<a href="<%=request.getContextPath()%>/classDetailView?no=%201121">스포츠·피트니스 클래스</a>
							</div>
						</div>
					</div>
					<div class="black"></div>
				</div>
				
			</div>
			<div id="main-slide-prev" class="swiper-button-prev"></div>
			<div id="main-slide-next" class="swiper-button-next"></div>
			<div class="swiper-pagination"></div>
		</div>
	</section>

	<div class="contents">
		<div class="inner-lg">
			<section class="main-class-best">
				<h3 class="main-h3 text-h3">POPULAR CLASS</h3>
				<!-- Swiper -->
				<div class="swiper classSwiper1">
					<div class="swiper-wrapper">
						<c:forEach var="pclass" items="${popularClassList}">	
							<div class="swiper-slide">
								<div class="class-list-thumb"><a href="<%=request.getContextPath()%>/classDetailView?no=${pclass.class_no}"><img src="${pclass.class_thumb}"/></a></div>
								<div class="class-list-info">
									<div class="class-category">${pclass.cateL_name} > ${pclass.category_name}</div>
									<div class="class-name"><a href="<%=request.getContextPath()%>/classDetailView?no=${pclass.class_no}">${pclass.class_name}</a></div>
									<div class="class-creator">${pclass.nick}</div>
									<div class="class-point">
										<div class="class-back-star">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</div>
										<div class="class-front-star" style="width:${(pclass.star_avg/5)*80}px">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</div>
										<fmt:formatNumber value="${pclass.star_avg}" pattern="0.0"/>
									</div>
									<div class="class-like">♥ ${pclass.like_cnt}</div>
									<div class="class-price"><fmt:formatNumber value="${pclass.class_price}" type="number"/>원</div>
								</div>
							</div>
							
						</c:forEach>
					</div>
					<div id="class1-slide-prev" class="swiper-button-prev"></div>
					<div id="class1-slide-prev" class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</section>
			
			 
			<section class="main-class-new">
				<h3 class="main-h3 text-h3">NEW CLASS</h3>
				<div class="swiper classSwiper2">
					<div class="swiper-wrapper">
						<c:forEach var="nclass" items="${newClassList}">	
							<div class="swiper-slide">
								<div class="class-list-thumb"><a href="<%=request.getContextPath()%>/classDetailView?no=${nclass.class_no}"><img src="${nclass.class_thumb}"/></a></div>
								<div class="class-list-info">
									<div class="class-category">${nclass.cateL_name} > ${nclass.category_name}</div>
									<div class="class-name"><a href="<%=request.getContextPath()%>/classDetailView?no=${nclass.class_no}">${nclass.class_name}</a></div>
									<div class="class-creator">${nclass.nick}</div>
									<div class="class-point">
										<div class="class-back-star">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</div>
										<div class="class-front-star" style="width:${(nclass.star_avg/5)*80}px">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</div>
										<fmt:formatNumber value="${nclass.star_avg}" pattern="0.0"/>
									</div>
									<div class="class-like">♥ ${nclass.like_cnt}</div>
									<div class="class-price"><fmt:formatNumber value="${nclass.class_price}" type="number"/>원</div>
								</div>
							</div>
							
						</c:forEach>
					</div>
					<div id="class2-slide-prev" class="swiper-button-prev"></div>
					<div id="class2-slide-prev" class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</section> 
		</div>
		
		<div class="main-review-wrap">
			<section class="main-review inner-lg">
				<h3 class="main-h3 text-h3">BEST REVIEW</h3>
				<div class="swiper classSwiper3">
					<div class="swiper-wrapper">
						
						<c:forEach var="review" items="${reviewList}">						
							<div class="swiper-slide">
								<div class="main-review-img">
									<img src="${review.img1 }"/>
								</div>
								<div class="main-review-content">
									<div class="star">
										<div class="back-star">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</div>
										<div class="front-star" style="width: ${review.star/5 * 95 }px">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</div>
									</div>
									<div class="main-review-text">
										${review.content }
									</div>
									<div class="main-review-user">
										<div class="main-review-user-img">
											<img src="${review.member_img }"/>
										</div>
										<div class="main-review-user-info">${review.member_id }</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<div id="class3-slide-prev" class="swiper-button-prev"></div>
					<div id="class3-slide-prev" class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</section>
		</div>
		
		<div class="inner-lg">
			<section class="main-creator-list">
				<h3 class="main-h3 text-h3">POPULAR CREATOR</h3>
				<!-- Swiper -->
				<div class="swiper classSwiper4">
					<div class="swiper-wrapper">
						<c:forEach var="creator" items="${creatorList}">
							<div class="swiper-slide">
								<div class="creator-list-img"><img src="${creator.member_img}"/></div>
								<div class="creator-nick">${creator.nick}</div>
							</div>
						</c:forEach>
					</div>
					<div id="class4-slide-prev" class="swiper-button-prev"></div>
					<div id="class4-slide-prev" class="swiper-button-next"></div>
					<div class="swiper-pagination"></div>
				</div>
			</section>
		</div>
		
	</div>
</article>



<!-- Swiper JS -->
<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
      var swiper = new Swiper(".mainSwiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        autoplay: {
            delay: 16000,
            disableOnInteraction: false,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        effect: 'fade',
        fadeEffect: {
          crossFade: true
        }
      });
      
      
      
      var swiper = new Swiper(".classSwiper1", {
    	  slidesPerView: 4,
          spaceBetween: 30,
          slidesPerGroup: 4,
          loop: true,
          loopFillGroupWithBlank: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }
        });
      
      var swiper = new Swiper(".classSwiper2", {
    	  slidesPerView: 4,
          spaceBetween: 30,
          slidesPerGroup: 4,
          loop: true,
          loopFillGroupWithBlank: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }
        });
      
      var swiper = new Swiper(".classSwiper3", {
    	  slidesPerView: 3,
          spaceBetween: 30,
          slidesPerGroup: 1,
          loop: true,
          loopFillGroupWithBlank: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }
        });
      
      var swiper = new Swiper(".classSwiper4", {
    	  slidesPerView: 5,
          spaceBetween: 30,
          slidesPerGroup: 1,
          loop: true,
          loopFillGroupWithBlank: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }
        });

</script>

