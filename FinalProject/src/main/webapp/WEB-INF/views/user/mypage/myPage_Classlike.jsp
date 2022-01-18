<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

	#likedClassList{width:90%;height:auto;overflow:auto;margin:0 auto;}/*height:auto;*//*좋아요크리에이터 리스트 감싸고 있는 div*/
	.main_container{ background-color:;
	width:100%;
	height:auto;
	margin:0 auto;
	overflow:hidden;
}
.top_container{ background-color:;
	width:100%;
	height:130px;
	margin-top:30px;
}
.page_name a{
	background-color:; 
	border:1px dotted lightgray;
	border-radius:8px;
	width:64%;
	height:100px;
	float: left;
	text-align: center;
	color:#333;
	display: table-cell;
	font-weight: 500;
	font-size: 1.6em;
	line-height: 100px;
}
.select_boxes{background-color:;
	width:35%;
	height:100px;
	margin:0px 10px 0px 0;
	float: right;
}
.select_boxes>input[type=text]{background-color:white;
 	border:1px dotted gray;
	height:30px;
	width:100%;
	border-radius:8px;
	font-weight: 500;
	color:gray;
	text-align: center;
}
/*.select_boxes>select>option:nth-child(1){
	text-align: center;
}
.select_boxes>select>option{
	background-color: white;
}
*/
.select_range{background-color:;
 	width:420px;
 	height:30px;
}
.select_range li{
	float:left;
}
.priceRangeBox{ 
	border:1px dotted gray;
	width:100px;
	height:30px;
	text-align: center;
	border-radius:8px;
	font-weight: 500;
	background-color:white;
	margin-top:5px;
	color:gray;
}

input[type=button]{
	color:#FF385C;
	cursor: pointer;
	float: right;
	width:100%;
}
input[type=button]:hover{
	background-color:#FF385C;
	color:white;
}
#slider-range{background-color:; 
	margin:10px 5px 0 5px;
	width:210px;
	height:10px;
	
}
.ui-slider-range{
	background-color:#FF385C;
	color:red;
}
.middle_container{ background-color:;
	width:100%;
	height:auto;
}
.middle_top_select{ background-color:;
	border-top:2px solid lightgray;
	height:35px;
	widht:100%;
}
.middle_top_select>ul{background-color:;
	
	height:30px;
	float: right;
}.middle_top_select>ul>li{
	text-align: center;
	float: right;
	font-size: 0.8em;
	font-weight: 500;
	line-height: 40px;
	color:gray;
}

.middle_top_select>ul>li:not(:nth-child(2)){
	width:100px;
}
.class_div{ border:1px solid lightgray;
	float:left;
	width:30%;
	height:400px;
	margin:1% 1% 1% 1%;
	border-radius:8px;
	padding:5px 5px 5px 5px;
}
.img_div{
	width:100%;
	height:70%;
	border-radius:8px;
	margin:0 auto;
	overflow:hidden;
	
}
.img_size{
	width:100%;
	heigth:100%;
	object-fit:cover;
}
.info_div{/* 정보 div */
	width:100%;
	height:30%;
	padding:5px 5px 5px 5px;    
	border-radius:8px;
	
}
.info_div>ul{background-color:;
	float:right;
	width:100%;
}
.info_div li:not(:nth-child(1)){
	text-align:right;
	width:100%;
	
}
.info_div>ul>li:nth-child(1)>div {
	 /* 카테고리 정보 div */
	font-weight: bold;
	display:inline-block;
	padding:3px 5px 3px 5px;
	color:#FF385C;
	font-size:0.9rem;
}
.info_div>ul>li:nth-child(2) {
	/*font-weight: 500;*/
	word-break:break-all;
	text-align:left;
	display:inline-block;
	padding:3px 5px 3px 5px;
	max-height: 24px;
	color:#333;
}
.info_div>ul>li:nth-child(3) {
	font-weight: 400;	
	font-size:0.9rem;
	color:#666;	
	overflow: hidden;
	height:28px;
}
.info_div>ul>li:nth-child(4) {
	font-weight: 500;
	color:gray;
	color:#FF385C;
}
.info_div>ul>li:nth-child(5) {
	font-weight: 500;
	color:gray;
}
.info_div>ul>li:nth-child(6) { /* 클래스 넘버 숨겨둠*/
	display: none;
}
.price_sort, .apply_sort{
	cursor: pointer;
}

	#morebtn{
	font-size: 24px;
    padding: 5px 12px;
    border: none;
    color: #fff;
    background-color: #ff385c;
    border-radius: 10px;
    margin-top: 22px;
	
	}
</style>
<script>
$(function(){
		var logid = "${userId}";		
		 // 목록에서 한 번에 보여줄 클래스 개수	
		//vo.creator_nick2 : 강사명
		function getLikedListClass(){
			console.log("강의좋아요함수들어옴");
			var url = "/another/LikedListClass";
			var params = {"logid":logid}
			$.ajax({
			url : url,
			data : params,
			async:false,
			success:function(r){
				
			var listCnt = 3;
			var rr=$(r);		
			console.log(rr);
			var classDiv = '';
			$('.middle_container').html('');//원래있던거지우고새로
			rr.each(function(idx,vo){						 	
					if( idx <= (listCnt-1) ){						
					classDiv  = '<div class="class_div">';
					classDiv += '<div class="img_div">';				
					classDiv +=	'<img style="height:100%;" class="img_size" src="'+vo.class_thumb+'">';					
					classDiv += '</div>';
					classDiv +=	'<div class="info_div">';
					classDiv += '<ul>';
					classDiv += '<li><div>['+ vo.category_name+']</div></li>';
					classDiv += '<li><a href="<%=request.getContextPath()%>/classDetailView?no=' + vo.class_no + '" target="">'+vo.class_name+'</a></li>';
					classDiv +=	'<li>'+vo.creator_nick2+'</li>';
					classDiv +=	'<li style="border:none;"><div class="heartImg" id="'+vo.class_like_no+'"><img class="likeimgbox91" style="width:8%;margin-right:8px;" src="/another/img/jisu/ff385bigcheart.png"/></div></li>';					
					//classDiv +=	'<li>'+하트+'원</li>';
					classDiv += '</ul>';
					classDiv +='</div>';
					classDiv +='</div>';
					$('.middle_container').append(classDiv);
					$('.no-result-txt').hide(); // 결과 없음 내용 숨기기
					$('.more').show(); // 더보기 버튼 보이기
					if(idx >= rr.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
						$('.more').hide();
					}
				}
				var n=1;
				$('.more > button').click(function(){
					n++;
					if( idx >= listCnt*(n-1) && idx <= (listCnt*n-1) ){
						classDiv  = '<div class="class_div">';
						classDiv += '<div class="img_div">';
						classDiv += '<a href="<%=request.getContextPath()%>/classDetailView?no=' + vo.class_no + '" target="">'
						classDiv +=	'<img style="height:100%;" class="img_size" src="'+vo.class_thumb+'">';
						classDiv += '</a>'
						classDiv += '</div>';
						classDiv +=	'<div class="info_div">';
						classDiv += '<ul>';
						classDiv += '<li><div>['+ vo.category_name+']</div></li>';
						classDiv += '<li>'+vo.class_name+'</li>';
						classDiv +=	'<li>'+vo.creator_nick2+'</li>';
						classDiv +=	'<li  style="border:none;"><div class="heartImg" id="'+vo.class_like_no+'"><img class="likeimgbox91" style="width:8%;margin-right:8px;" src="/another/img/jisu/ff385bigcheart.png"/></div></li>';
						//classDiv +=	'<li>'+하트+'</li>';
						//classDiv +=	'<li>'+하트+'원</li>';
						classDiv += '</ul>';
						classDiv +='</div>';
						classDiv +='</div>';
						$('.middle_container').append(classDiv);
						$('.no-result-txt').hide(); // 결과 없음 내용 숨기기
						 $('.more').show();
	                 	 if(idx >= rr.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
	                        $('.more').hide();
		                     }
		              }
	           }); ////////클릭이벤트
			});//each
		}//success
	});//ajax	
		
	};//function

	$(document).on('click','.likeimgbox91',function(){	//좋아요취소				
		var no = $(this).parent().attr('id');	
		console.log("no"+no);
		var cUrl ="/another/cancelLikedListClass";
		var cParam = {"no":no}
		$.ajax({
			url :cUrl ,
			data :cParam ,
			success:function(c){//c에 int result값이 들어있다			
				getLikedListClass();//함수리스트 보여줌....				
			}			
		})
		
	});
	
	//하트이미지변경
	$(document).on('mouseenter','.likeimgbox91',function(){					
			
			$(this).attr("src", "/another/img/jisu/ff385bigborderheart.png");
			;
		});
		$(document).on('mouseout','.likeimgbox91',function(){					
			
			$(this).attr("src", "/another/img/jisu/ff385bigcheart.png");
			
		});
		
	
	
	
	
	
	
	getLikedListClass();
});

</script>

<%@ include file="myPageTop.jspf" %>

<div id="likedClassList" class="bigTitle"><span class="h1style">♥ 클래스</span></div>

<div >

	<div class="main_container">
			
	
		<div class="middle_container">
			<!-- 클래스목록 -->							
		</div>
			
		
	</div>
	<div class="more" style="display:none;text-align:center;">
			<button type="button" id="morebtn">+ more</button>
	</div>
				

		
</div>
	
	
	
<%@ include file="myPageBottom.jspf" %>