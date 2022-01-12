<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link href="<%=request.getContextPath()%>/css/user/review.css" rel="stylesheet" type="text/css"/>
<style>
	body{box-sizing:content;}
	  
	/*타이틀+리스트*/
	.orderDiv{width:100%;height:auto;margin-top:80px;}/*border:1px solid red;*/
	
	/*주문내역 타이틀*/
	.orderListTitle{margin:0 auto;width:100%; height:50px; line-height:50px;margin-bottom:20px;
					padding-left:20px;border-bottom:2px solid #333;}
	/*주문내역 리스트*/
	.orderDiv>ul{width:100%;height:auto;}
	.orderDiv>ul>li{width:100%;height:165px;position:flex;margin-top:30px;} /*주문한줄*/
	.orderDiv>ul>li>div{float:left;height:100%;border-bottom:1px solid #ddd;} /*주문이미지+주문내역+주문상태에따른버튼들자리*/
	
	.orderDiv>ul>li>div:nth-child(3n+1){width:20%;}/*이미지*/
	.orderDiv>ul>li>div:nth-child(3n+1) img{width:97%;height:94%;object-fit:cover;text-align:center;}/*주문이미지*/
	.orderDiv>ul>li>div:nth-child(3n+2){width:65%;padding-left:15px;}/*주문상세내역정보*/
	.orderDiv>ul>li>div:nth-child(3n+2)>*{display:block;width:100%;margin-bottom:3px;} 
	.orderDiv>ul>li>div:nth-child(3n+2)>a:nth-child(1){font-size:1.3rem;font-weight:bold;padding-bottom:10px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}/*주문상세내역정보-클래스명*/
	.orderDiv>ul>li>div:nth-child(3n+2)>span{color:#999;}
	.orderDiv>ul>li>div:nth-child(3n+3){width:15%;height:100%;display:flex;align-items:center;}/*각종버튼자리*/
	.orderDiv>ul>li>div:nth-child(3n+3)>div{width:100%;}/*버튼div 안에서 버튼을감싸고있는작은div*/
	.orderDiv>ul>li>div:nth-child(3n+3)>div>a{display:block;width:100%;padding:20px 0 20px 0;text-align:center;}/*버튼*/
	.orderDiv>ul>li>div:nth-child(3n+3)>div>a span{background-color:#666;padding:5px 13px 5px 13px;text-align:center;color:white;} /*이벤트줘야함 -> 이벤트오버시 글자색바뀌게*/
	.orderDiv>ul>li>div:nth-child(3n+3)>div>button{border:none;background-color:#fff;display:block;width:100%;padding:20px 0 20px 0;text-align:center;}/*버튼*/
	.orderDiv>ul>li>div:nth-child(3n+3)>div>button span{background-color:#666;padding:5px 13px 5px 13px;text-align:center;color:white;} /*이벤트줘야함 -> 이벤트오버시 글자색바뀌게*/
	/*h초기화 하고 수정되는 요소들*/
	#reserveListTitle,#finishListTitle,#cancleRefund{margin-block-start: 0;}	
</style>
<script>
$(function(){	
	var logid = "${userId}";

	//주문결제내역
	function OrderFin(){	
		var aUrl ="/another/UserOrderListFin";
		var aParam = {"logid":logid};
		 $.ajax({
	    		url:aUrl,
	    		data:aParam,
	    		success:function(a){
	    			var aa = $(a)
	    			var tag ="";	    			
	    			//order_no,order_date, merchant,class_option_no,start_date,end_date ,class_no, class_name,class_thumb ,class_price			
	    			aa.each(function(idx,vo){	    	
	    				tag +="<li>";
	    				tag +="<div>";
	    				tag +="<img src='"+vo.class_thumb+"'/>"; 
	    				tag +="</div>";
	    				tag +="<div>"
	    				tag +="<a href='<%=request.getContextPath()%>/classDetailView?no=" + vo.class_no + "' target=''>"+vo.class_name+"</a>";
	    				tag +="<span>주문번호 : "+vo.order_no+"</span>";
	    				tag +="<span>상품금액 : "+vo.class_price+"원</span>";
	    				tag +="<span>주문일자 : "+vo.order_date2+"</span>";
	    				tag +="<span>진행상태 : 결제완료</span>"; //order_date,payment_date 로 구분
	    				tag +="</div>";
	    				tag +="<div>";
	    				tag +="<div>";
	    				tag +="<button class='CancelBtn' id='"+vo.order_no+"'><span style='font-size:16px;' >환불신청</span><input type='hidden' vlaue='"+vo.order_no+"'></button>";
	    				console.log(vo.order_no);
	    				tag +="</div>";
	    				tag +="</div>";
	    				tag +="</li>";
	    				$("#orderDivUl").html(tag);
					});	 	    			
	    		}	    		
	    	})			
	}
	//수강완료내역
	function OrderFin2(){			
		var bUrl ="/another/UserOrderListFin2";
		var bParam = {"logid":logid};
		 $.ajax({
	    		url:bUrl,
	    		data:bParam,
	    		success:function(b){
	    			var bb = $(b)
	    			var tag ="";	    			
	    			//order_no,order_date, merchant,class_option_no,start_date,end_date ,class_no, class_name,class_thumb ,class_price			
	    			bb.each(function(idx,vo2){	    	
	    				tag +="<li>";
	    				tag +="<div>";
	    				tag +="<img src='"+vo2.class_thumb+"'/>"; 
	    				tag +="</div>";
	    				tag +="<div>"
	    				tag +="<a href='<%=request.getContextPath()%>/classDetailView?no=" + vo2.class_no + "' target=''>"+vo2.class_name+"</a>";
	    				tag +="<span>주문번호 : "+vo2.order_no+"</span>";
	    				tag +="<span>상품금액 : "+vo2.class_price+"원</span>";
	    				tag +="<span>주문일자 : "+vo2.order_date2+"</span>";
	    				tag +="<span>진행상태 : 수강완료</span>";
	    				tag +="</div>";
	    				tag +="<div>";
	    				tag +="<div>";
	    				if(vo2.reviewChk==0){
	    					tag +="<a href='javascript:void(0);' class='write-review-btn'><span>후기작성</span></a><input type='hidden' value='"+vo2.order_no+"'></a>";
	    				}else{
	    					tag +="<span>후기작성완료</span>"
	    				}
	    				tag +="</div>";
	    				tag +="</div>";
	    				tag +="</li>";
	    				$("#orderDivUl2").html(tag);
					});	 	    			
	    		}	    		
	    	})			
	}	
	//취소,환불내역
	function OrderFin3(){				
			var cUrl ="/another/UserOrderListFin3";
			var cParam = {"logid":logid};
			 $.ajax({
		    		url:cUrl,
		    		data:cParam,
		    		success:function(c){
		    			var cc = $(c)
		    			var tag ="";	    			
		    			//order_no,order_date, merchant,class_option_no,start_date,end_date ,class_no, class_name,class_thumb ,class_price			
		    			cc.each(function(idx,vo3){	    	
		    				tag +="<li>";
		    				tag +="<div>";
		    				tag +="<img src='"+vo3.class_thumb+"'/>"; 
		    				tag +="</div>";
		    				tag +="<div>"
		    				tag +="<a href='<%=request.getContextPath()%>/classDetailView?no=" + vo3.class_no + "' target=''>"+vo3.class_name+"</a>";
		    				tag +="<span>주문번호 : "+vo3.order_no+"</span>";
		    				tag +="<span>상품금액 : "+vo3.class_price+"원</span>";
		    				
		    				if(vo3.refund_date==1){
		    				
		    					tag +="<span>취소일자 : "+vo3.cancel_date2+"</span>";
		    				}else{
		    					tag +="<span>환불일자 : "+vo3.refund_date+"</span>";
		    				}
		    				if(vo3.refund_date==1){
		    					
		    					tag +="<span>진행상태 : 취소완료</span>";
		    				}else{
		    					tag +="<span>진행상태 : 환불완료</span>";
		    				}
		    				tag +="</div>";
		    				tag +="<div>";
		    				tag +="<div>";
		    				//버튼자리
		    				tag +="</div>";
		    				tag +="</div>";
		    				tag +="</li>";
		    				$("#orderDivUl3").html(tag);
						});	 	    			
		    		}	    		
		    	})			
		}
	
	//환불신청버튼
	$(document).on('click','.CancelBtn',function(){
		console.log('환불버튼클릭');
		
		var dUrl ="/another/UserOrderCancleSub";
		var a = Number($(this).attr('id'));
		 var dParam = "no="+a;
		 console.log(dParam)
		 $.ajax({
	            url : dUrl,
	            data :dParam,
	           // type : "POST",
	            success : function(result){
	            	alert("환불 신청 접수되었습니다");
	            	$("#orderDivUl").empty();
	            	 OrderFin();
	            	 OrderFin2();
	            	 OrderFin3();
	            }
	         });
	         //return false; //submit은 action으로 이동하여 페이지가 실행되는 것을 차단한다.
	  });
	
	
	
	
	 OrderFin();
	 OrderFin2();
	 OrderFin3();
	 
	
});	

</script>



<%@ include file="myPageTop.jspf" %>
	
	<div id="orderPageTitle" class="bigTitle"><span class="h1style">주문조회</span></div>	
	
	<!-- 예약내역 -->
	<div class="orderDiv">
		<span id="reserveListTitle" class="orderListTitle h3style">주문내역</span>		
		<ul id="orderDivUl">		
		</ul>
	</div>	
	<!-- 수강완료 -->
	<div class="orderDiv">
		<span id="finishListTitle" class="orderListTitle h3style">수강완료</span>	
		<ul id="orderDivUl2">			
		</ul>
	</div>	
	<!-- 취소,환불 -->
	<div class="orderDiv">
		<span id="cancleRefund" class="orderListTitle h3style">취소/환불내역</span>	
		<ul id="orderDivUl3">			
		</ul>
	</div>

<%@ include file="myPageBottom.jspf" %>

<%@ include file="review_write.jspf" %>