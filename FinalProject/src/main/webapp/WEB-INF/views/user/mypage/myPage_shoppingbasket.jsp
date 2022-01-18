<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>	
	html, body, div, ul, ol, li, dl, dt, dd, header, footer, main, article, section, aside, form, input, textarea, button, select, a, p, h1, h2, h3, h4, h5, h6, span, table, th, td{box-sizing:content-box}
		


	.shoppingBagList{width:100%;height:auto;margin-top:80px;margin:0 auto;} /*쇼핑백 리스트를 감싸고있는 제일큰div border:1px solid red;*/
	.shoppingBagList>span:nth-child(1){margin-bottom:20px;margin-top:70px}
	.shoppingBagList{width:100%;height:auto;}
	.shoppingBagList>ul{width:100%;height:auto;overflow:auto;}
	
	/*쇼핑백리스트 제목*/
	
	#shoppingBagListTitle>li{width:10%;height:30px;float:left;border-top:3px solid #333;border-bottom:1px solid #666;padding:10px 0 10px 0;text-align:center;font-size:1.1rem;font-weight:bold;}	
	#shoppingBagListTitle>li:nth-child(1){width:5%;}
	#shoppingBagListTitle>li:nth-child(2){width:60%;}
	#shoppingBagListTitle>li:nth-child(5){width:15%;}
	
	/*쇼핑백리스트*/
	#shoppingBagListUl{width:100%;height:auto;overflow:auto;}
	#shoppingBagListUl>li{padding:6px 0 6px 0;height:150px;margin-top:10px;}
	#shoppingBagListUl>li>div{width:10%;height:100%;float:left;text-align:center;border-bottom:1px solid #ddd;}/*height -> 100%? auto?*/
	#shoppingBagListUl>li>div:nth-child(5n+1){width:5%;line-height:150px;}
	#shoppingBagListUl>li>div:nth-child(5n+2){width:60%;} /*이미지+상세정보*/
	#shoppingBagListUl>li>div:nth-child(5n+2)>div{width:100%;height:100%;}
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(1){width:40%;height:100%;float:left;padding:2px 2px 2px 2px;}
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(1)>a:nth-child(1){display:block;width:100%;height:100%;}
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(1) img{width:90%;height:90%;object-fit:cover;text-align:center;}
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(2){width:60%;padding-left:9px;float:left;text-align:left;}
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(2)>*{display:block;width:100%;margin-bottom:5px;}
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(2)>a:nth-child(1){font-size:1.1rem;font-weight:bold;padding-bottom:7px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}/*주문상세내역정보-클래스명*/
	#shoppingBagListUl>li>div:nth-child(5n+2)>div>div:nth-child(2)>span{color:#999;}
	#shoppingBagListUl>li>div:nth-child(5n+3){line-height:150px;}
	#shoppingBagListUl>li>div:nth-child(5n+4){line-height:150px;}
	#shoppingBagListUl>li>div:nth-child(5n+5){width:15%;}
	#shoppingBagListUl>li>div:nth-child(5n+5)>div{width:100%;}
	#shoppingBagListUl>li>div:nth-child(5n+5)>div>a{display:block;width:100%;padding:22px 0 5px 0;text-align:center;}/*버튼*/
	#shoppingBagListUl>li>div:nth-child(5n+5)>div>a span{display:inline-block;width:84px;background-color:#666;padding:5px 10px 5px 10px;text-align:center;color:white;} /*이벤트줘야함 -> 이벤트오버시 글자색바뀌게*/
	
	/* 선택상품 - 삭제 ,주문 */
	#shoppingbasketBtn{width:100%;height:auto;margin:0 auto;text-align:center;margin-top:50px;}
	#shoppingbasketBtn>#selectdel{display:inline-block;text-align:center;font-size:20px;border:1px solid #333;margin:0 20px 0 20px;padding:10px 15px 10px 15px;background-color:#fff;}
	#shoppingbasketBtn>#goPay{display:inline-block;text-align:center;font-size:20px;border:1px solid #333;margin:0 20px 0 20px;padding:10px 15px 10px 15px;background-color:#fff;}
</style>
<script>

$(function(){ 
	var logid = "${userId}"; 
	console.log(logid);
	
	 // 전체 선택
    $("#allchk").click(function() {
       $("#payfrmm input").prop("checked", $(this).prop("checked"));
    });    
	
   
	
	//장바구니 전체셋팅
	function getBaList(){		
		var bUrl = "/another/ShoppingBasket";
		var bParam = {"logid":logid} 
		$.ajax({
			url:bUrl,
			data :bParam,
			success:function(b){
				var bb = $(b)
    			var tag =""; 
				bb.each(function(idx,vo){	
					
					tag += "<li>";
					tag += "<div><input type='checkbox' class='checkbb' name='classNoPayList' value='"+vo.class_option_no +"' id='"+vo.class_option_no+"' ></div>";
					tag += "<div>";
					tag += "<div>";
					//var a = vo.class_thumb;
					
					tag += "<div><a href='<%=request.getContextPath()%>/classDetailView?no=" + vo.class_no + "' target=''><img src='"+vo.class_thumb+"'/></a></div>"; 
					tag += "<div>";
					tag += "<a href='#'>"+vo.class_name+"</a>";
					tag += "<span><a href='#'>"+vo.creator_nick2+"</a></span>";
					tag += "<span>옵션날짜 : "+vo.start_date+"</span>";
					tag += "<span>인원 : "+vo.headcount+"명</span>"; //없앨까?
					tag += "</div>";
					tag += "</div>";
					tag += "</div>";
					tag += "<div>"+vo.class_price+"</div>";
					tag += "<div>"+vo.class_price*0.01+"</div>";
					tag += "<div>";
					tag += "<div>";
					tag += "<a href='#'><span class='order'>주문하기</span></a>";
					tag += "<input type='hidden' value='"+vo.class_option_no+"'>";
					//tag += "<a href='#'><span class='heart'>찜하기</span></a>";
					tag += "<a href='#'><span class='del''>삭제</span></a>";
					tag += "<input type='hidden' class='class_option_no_val' value='"+vo.class_option_no+"'>";
					tag += "</div>";
					tag += "</div>";
					tag += "</li>";				
					$("#shoppingBagListUl").html(tag);
				});					
			}
		})
	}
	
	function getBaCount(){
		var dUrl = "/another/BasketCount";
		var dParam = {"logid":logid} 
		$.ajax({
			url:dUrl,
			data :dParam,
			success:function(d){
				var BasketCoun = d;
				$("#num").html(d);
			}
		})
				
	}
	
	//삭제 -> 선택상품삭제 	
	$(document).on('click','#selectdel',function(){//delete
		var logid = "${userId}";    	
	
		if ($("input:checkbox[name='classNoPayList']").is(":checked")==false) {
			alert("삭제할 클래스를 선택해주세요.");
			return;
		}	
		if(confirm('클래스를 삭제하시겠습니까?')){
			$("#payfrmm").attr("action", "/another/DeleteBasketDB");			
		 	$("#payfrmm").submit();		
		 	
		}
	});	
	
	//삭제 -> 개별상품	
	$(document).on('click','.del',function(){//delete
		var logid = "${userId}";    	
		var a =$(".class_option_no_val").val();
		var ddUrl = "/another/delOneClass";
		var ddParam = {"no":a} 
		
		if(confirm('클래스를 삭제하시겠습니까?')){
			$.ajax({// 디비삭제
				url:ddUrl,
				data :ddParam,
				success:function(dd){
					getBaList();
					getBaCount();
					alert('삭제 되었습니다');
					
				}
			})
		}
		
	});	
	
	//주문 -> 선택상품주문 , 주문
	$(document).on('click','#goPay',function(){//delete
		var logid = "${userId}";    	
	
		if ($("input:checkbox[name='classNoPayList']").is(":checked")==false) {
			alert("주문할 클래스를 선택해주세요.");
			return;
		}	 			
			$("#payfrmm").attr("action", "/another/PayPage");			
		 	$("#payfrmm").submit();				
	});	
	//주문페이지이동 -> 장바구니페이지에서삭제?:결제성공하면 삭제하고 아니면 냅둘까?.. 클래스옵션번호가지고
	$(document).on('click','.order',function(){//delete
		var logid = "${userId}";    	
		var a =$(".class_option_no_val").val();
        location.href="/PayPage2";
	});	
			
			
			
			
			
	
	getBaList();//장바구니리스트블러옴
	getBaCount();//장바구니갯수가져옴
});

</script>
<%@ include file="myPageTop.jspf" %>



	<div id="shoppingbasketPageTitle" class="bigTitle"><h1>장바구니</h1></div><!-- style="border:1px solid red" -->
	
	<form  method="post" id="payfrmm" name="payfrmm">	
		
		<div  class="shoppingBagList">
			<span class="h3style">장바구니 상품( <label id="num"></label> )</span>		
			
			<ul id="shoppingBagListTitle">
				<li><input type="checkbox" id="allchk"></li>		
				<li>상품정보</li> <!-- 이미지 + 클래스정보 + 옵션:인원?날짜?... -->
				<li>상품금액</li> <!-- 인원?날짜?... -->
				<li>포인트</li>	
				<li>선택</li> <!-- 주문하기,찜하기,삭제 -->				
			</ul>			
			<ul id="shoppingBagListUl">
			
		
				
			</ul>
		
		</div>
		
		<div id="shoppingbasketBtn">		
			<input type='button' id='selectdel' value='선택상품삭제'>
			<input type='button' id='goPay' value='선택상품주문'>
		
		</div>
		
	</form>
	
	
	
	
<%@ include file="myPageBottom.jspf" %>