<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
	html, body, div, ul, ol, li, dl, dt, dd, header, footer, main, article, section, aside, form, input, textarea, button, select, a, p, h1, h2, h3, h4, h5, h6, span, table, th, td{box-sizing:content-box}

	#payPageContainer{width:1200px;height:auto;margin:0 auto;display:flex;}/*모든걸감싸고있는 div*/	
	#leftdiv{width:900px;margin:0;}/*왼쪽영역*/
	#leftdiv>div{width:100%;height:auto;margin-top:80px;} /*쌓여있는 항목div들*/	
	#payPageTitle{width: 100%;text-align: center;margin-top: 90px;border-bottom: 1px solid black;padding-bottom: 20px;}
    #payPageTitle>span{display:block;font-size:32px;margin-block-start: 0.9rem;margin-block-end:0.9rem; margin-inline-start:0px;
    		margin-inline-end:0px;font-weight: bold;}   
   .secondTitleD{margin: 0 auto;font-size:20px;height:50px;line-height:50px;}	
	/*주문자정보*/
	#paymemberinfo>div{padding:15px 0 15px 0;width:100%;height:auto;overflow:auto;}
	#paymemberinfo>div{border-bottom:1px solid #ddd;}
	#paymemberinfo>div:nth-child(1){border-bottom:2px solid #666;padding:0;}
	#paymemberinfo>div>span{display:block;height:auto;float:left;}
	#paymemberinfo>div>span:nth-child(1){width:30%;padding-left:25px;}
	#paymemberinfo>div>span:nth-child(2){width:65%;}	
	/*주문상품*/
	#payclassinfo>div{padding:15px 0 15px 0;width:100%;height:auto;overflow:auto;border-bottom:1px solid #ddd;}
	#payclassinfo>div:nth-child(1){border-bottom:2px solid #666;padding:0;}
	#payclassinfo>div:nth-child(2)>span{display:block;float:left;width:10%;text-align:center;}	
	#payclassinfo>div:nth-child(2)>span:nth-child(1){width:70%;text-align:center;}	
	.payclassinfoorder{width:100%;height:150px;}/*주문한줄*/
	.payclassinfoorder>div{float:left;width:10%;text-align:center;height:100%;}	
	.orderrest{line-height:150px;color:#666;}
	.payclassinfoorder>div:nth-child(1){width:70%;text-align:center;display:flex;}/*이미지+제목(클래스명+강사명)*/
	.payclassinfoorder>div:nth-child(1)>div:nth-child(1){width:35%;height:100%;}/*이미지*/
	.payclassinfoorder>div:nth-child(1)>div:nth-child(1)>img{width:100%;height:100%;}	
	.payclassinfoorder>div:nth-child(1)>div:nth-child(2){width:65%;padding-left:10px;text-align:left;}/*제목(클래스명+강사명)*/
	.payclassinfoorder>div:nth-child(1)>div:nth-child(2)>div:nth-child(1){width:100%;height:auto;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-weight:bold;}/*클래스명*/
	.payclassinfoorder>div:nth-child(1)>div:nth-child(2)>div:nth-child(2){width:100%;height:auto;margin-top:15px;font-size:0.9rem;color:#999;}/*크레에이터명*/
	.payclassinfoorder>div:nth-child(1)>div:nth-child(2)>div:nth-child(3){width:100%;height:auto;margin-top:15px;font-size:0.9rem;color:#999;}/*선택한 옵션날짜*/		
	/*할인받기*/	
	#paydiscount>div{padding:15px 0 15px 0;width:100%;height:auto;overflow:auto;}
	#paydiscount>div{border-bottom:1px solid #ddd;}
	#paydiscount>div:nth-child(1){border-bottom:2px solid #666;padding:0;}	
	#paydiscount>div>span{display:block;height:auto;float:left;}
	#paydiscount>div>span:nth-child(1){width:30%;padding-left:25px;}
	#paydiscount>div>span:nth-child(2){width:65%;}
	#paydiscount>div:nth-child(3)>span>label{margin-left:15px;color:#666;font-size:0.9rem;}	
	/*결제수단*/	
	
	#paymethod>div{padding:15px 0 15px 0;width:100%;height:auto;overflow:auto;}
	#paymethodselect{width:100%;border:1px solid #333;}/*결제방선택*/	
	#paymethodselect>span{margin:0 15px 0 15px;}	
	#paycardbox{width:100%;height:100px;display:flex;float:left;}/*카드결제선택씨 뜨는 디브*/
	#paycardbox>div:nth-child(1){width:20%;height:100%;background-color:#f0f0f0;color:#666;font-size:0.9rem;}
	#paycardbox>div:nth-child(1)>label{display:block;margin:15px 0 0 15px;}
	#paycardbox>div:nth-child(2){width:80%;height:100%;}
	#paycardbox>div:nth-child(2)>div:nth-child(1){width:100%;height:40%;border-top:1px solid #ddd;}/*카드선택*/
	#paycardbox>div:nth-child(2)>div:nth-child(1)>span{display: inline-block;margin-left:15px;margin-top: 10px;}
	#paycardbox>div:nth-child(2)>div:nth-child(2){width:100%;height:60%;white-space:pre-line;font-size:0.7rem;color:#999;border-top:0.5px dotted #ddd;}/*안내문*/
	#paycardbox>div:nth-child(2)>div:nth-child(2)>label{padding-left:10px;}	
	/*************************************************************************/
	#rightdiv{width:300px;position:relative;}/*오른쪽영역*/
	#payInfoBox{width:280px; height:600px;position:sticky;top:170px;margin-left:20px;} /*결제정보축약박스  border:1px solid red;*/	
	#howmuch{width:100%;height:300px;background-color:#f0f0f0;}
	#howmuch>div:nth-child(1){text-align:center;font-size:1.1rem;font-weight:bold;height:70px;line-height:70px;border-bottom:1px dotted #999;}	
	#howmuch>div:nth-child(2){height:90px;}
	#howmuch>div:nth-child(2)>div{height:45px;display:flex;}
	#howmuch>div:nth-child(2)>div>div{width:50%;float:left;}
	/*#howmuch>div:nth-child(2)>div>div:nth-child(1){text-align:left;}*/
	#howmuch>div:nth-child(2)>div>div:nth-child(1)>label{display:inline-block;padding-left:20px;}/*왼쪽*/
	#howmuch>div:nth-child(2)>div>div:nth-child(2){text-align:right;}
	#howmuch>div:nth-child(2)>div>div:nth-child(2)>label{display:inline-block;padding-right:20px;}/*오른쪽*/	
	#howmuch>div:nth-child(3){height:90px;border-top:1px dotted #999;}
	#howmuch>div:nth-child(3)>div{height:45px;display:flex;}
	#howmuch>div:nth-child(3)>div>div{width:50%;float:left;}
	#howmuch>div:nth-child(3)>div>div:nth-child(1)>label{display:inline-block;padding-left:20px;}/*왼쪽*/
	#howmuch>div:nth-child(3)>div>div:nth-child(2){text-align:right;}
	#howmuch>div:nth-child(3)>div>div:nth-child(2)>label{display:inline-block;padding-right:20px;}/*오른쪽*/
	#howmuch>div:nth-child(3)>div:nth-child(1)>div:nth-child(2){color:#ff385c;font-weight:bold;}	
	#payInfoBox>div:nth-child(2){width:100%;height:250px;border:1px solid #999;margin-top:15px;}    	
     #howmuch2>div:nth-child(1)>div>label{margin-top:15px;}
    #howmuch2>div:nth-child(2)>div>label{margin-top:8px;}
    #howmuch3>div:nth-child(1)>div>label{margin-top:26px;}
    #howmuch3>div:nth-child(2)>div>label{margin-top:37px;}    
    
    /* #payInfoBox>div:nth-child(2)>div{height:62.5px;}  */
    
     #payInfoBox>div:nth-child(2)>div:nth-child(1){height:40.5px;color:#666;border-bottom:0.5px dotted #ddd;}  
     #payInfoBox>div:nth-child(2)>div:nth-child(2){height:62.5px;font-size:12px;border-bottom:0.5px dotted #ddd;}  
     #payInfoBox>div:nth-child(2)>div:nth-child(3){height:52.5px;padding-top:5px;font-size:12px;}  
     #payInfoBox>div:nth-child(2)>div:nth-child(4){height:62.5px;} 
    
    #payEndBtn{width:100%;height:100%;background-color:#333;color:white;font-size:1.1rem;font-weight:bold;text-align:center;border:none;} 
</style>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>


$(function(){
	
	var logid = "${userId}"; // 세션에저장된아이디		
	function memberInfo(){
		var mUrl = "/another/memInfo";
		var mParam = {"logid":logid} 
		$.ajax({
			url:mUrl,
			async:false,
			data :mParam,
			success:function(vo){
				var tag =""; 			
				tag += "<div><span>주문하시는분</span><span id='member_name'>"+vo.member_name+"</span></div>";
				tag += "<div><span>이메일</span><span id='member_email'>"+vo.member_email+"</span></div>";
				tag += "<div><span>휴대폰번호</span><span id='member_tel'>"+vo.member_tel+"</span></div>";
				tag +="<input type='hidden' id='pointbox' value='"+vo.point+"'>"
				tag +="<input type='hidden' id='member_name_val' value='"+vo.member_name+"'>"
				tag +="<input type='hidden' id='member_email_val' value='"+vo.member_email+"'>"
				tag +="<input type='hidden' id='member_tel_val' value='"+vo.member_tel+"'>"
				tag += "</form>"
				$("#paymemberinfo").append(tag);				
			}				
		})			
	}	
	memberInfo();//회원정보ajax셋팅
	point = $("#pointbox").val();
	$("#havePoint").html(point);
	
});	
	var arrayTest = new Array();
</script>
<form method="POST" action=""></form>
<div id="payPageContainer">		
	<div id="leftdiv">
		<div id="payPageTitle"><span>주문결제</span></div><!-- 페이지타이틀 -->		
		<div id="paymemberinfo"><!-- 주문자정보 -->
			<div class="secondTitleD">주문자정보</div>			
		</div>
			<div id="payclassinfo"><!-- 주문상품 -->
			<div class="secondTitleD">주문상품</div>
				<div><span>상품정보</span><span>인원</span><span>총상품금액</span><span>포인트</span></div>					
				<c:forEach var="vo" items="${list}" varStatus="status">
					<div class="payclassinfoorder " style="height:150px;"><!-- 주문한줄.... -->
						<div><!-- 이미지+제목 -->
							<div><img src="${vo.class_thumb }"></div> <!-- 이미지  vo.class_thumb --> 						
							<div><!-- 제목+강사 -->
								<div>${vo.class_name }</div>
								<div>${vo.nick }</div>
								<div>옵션날짜 : ${vo.start_date }</div>
							</div>
						</div>
						<div class="orderN"><label>1</label>명</div><!-- 인원 -->
						<div class="orderP"><label>${vo.class_price }</label>원</div><!-- 총상품금액 -->											
						<div class="orderPP"><label style="display:inline-block;margin-top:4px;">${vo.savePoint }</label></div>						
						<input type='hidden' value='${vo.class_option_no}' >
					</div>
					
					
					
					<script type="text/javascript">
						var testDa = ${vo.class_option_no};
						arrayTest[${status.index}] = testDa;
						console.log(testDa);
						console.log(${status.index});
						console.log(arrayTest[${status.index}]);
					</script>
					
				</c:forEach> 	
		
		
		
		</div>			
		<div id="paydiscount"><!-- 할인받기 -->
			<div class="secondTitleD">할인받기</div>			
			<div><span>결제예정금액</span><span>${sum }원</span></div>			
			<div><span>사용포인트</span><span><input type="text">&nbsp;&nbsp;보유포인트<label id="havePoint"></label>p</span></div>			
		</div>				
		<div id="paymethod"><!-- 결제수단 -->
			<div class="secondTitleD">결제수단</div>
			<div id="paymethodselect">
				<span><input type="radio" name="paymentmethod" value="paycard"/>신용카드</span>
				<!--<span><input type="radio" name="paymentmethod" value="paybank"/>무통장입금</span>  -->
				<span><input type="radio" name="paymentmethod" value="paysimple"/>간편결제</span>
			</div>			
			<div id="paycardbox" style="height:120px;">
				<div><label>신용카드</label></div>
				<div>
					<div><!-- 카드선택 -->						
					  <span><select>
							<option>카드선택</option>
							<option>비씨카드</option>
							<option>국민카드</option>
							<option>삼성카드</option>
							<option>현대카드</option>
							<option>롯데카드</option>
							<option>신한카드</option>
							<option>하나카드</option>
							<option>외한카드</option>
							<option>NH카드</option>
							<option>시티카드</option>
							<option>k뱅크카드</option>
							<option>카카오뱅크카드</option>
						</select></span>
					</div>				
				   <div>				   	
				   		<label>- 할부 최소 금액은 5만원이며 30만원 이상 결제 시에 카드사에 따라공인인증 사용이 요구될 수 있습니다.</label>
						<label>- 청구할인은 카드사에서 제공하며, 결제대금의 청구 시점에 차감 청구되는 할인 방식입니다.</label>
						<label>- BC우리, 수협, 광주, 전북JB,, MG 새마을,우체국, 저축은행 , 산업, 제주, 신협, 현대증권카드는 사용할 수 없습니다.</label>						
					</div>
				</div>
			</div>			
			<div id="paybankbox" style="display:none;">
			</div>			
			<div id="paysimple" style="display:none;">
			</div>
		</div>		
		<!-- ------------------------------- -->
		<div></div><!-- 결제버튼?흠 -->	
	</div>
	
	<!--============================================================================================= -->
	<div id="rightdiv">
		<div id="payInfoBox">			
			<div id="howmuch"><!-- 결제금액 -->
				<div>최종결제금액</div>
				<div id="howmuch2">
					<div>
						<div><label>총 상품금액</label></div><div><label>${sum }</label></div>
					</div>
					<div>
						<div><label>사용포인트</label></div><div><label>p</label></div>
					</div>
				</div>
				<div id="howmuch3">
					<div>
						<div><label>최종결제금액</label></div><div><label>${sum }원</label></div>
					</div>
					<div>
						<div><label>적립예정 포인트</label></div><div><label>${sum2 }p</label></div>
					</div>
				</div>
			</div>			
			<div><!-- 동의+결제하기 -->
				<div style='padding-top:10px;'><label style='padding-left:15px;'><input type="checkbox" name='ckkk' value='kkk'></label><label style='font-size:1.1rem;padding-left:10px;'>전체동의합니다</label></div><!--  style="visibility:hidden;" -->
				<div style='padding-top:10px;'>
					<p style='padding-left:15px;color:#999;'>주문 상품정보에 동의(필수)</p>
					<p style='padding-left:15px;color:#999;'>(전자상거래법 제 8조 제 2항)</p>
					<p style='padding-left:15px;color:#999;'>상품명, 가격, 배송정보, 할인내역을 확인함</p>				
				</div>
				<div style='color:#999;padding-top:10px;'>
					<p style='padding-left:15px;color:#999;'>결제대행서비스 이용을 위한 개인정보</p>
					<p style='padding-left:15px;color:#999;'>제3자 제공 및 위탁 동의(필수)</p>				
				</div>
				<div id="payEndD"><input type="button" name="" id="payEndBtn" value="결제하기"></div>
			</div>
		</div>		
	</div>	  
	 <div style='display:none;'>
	 <form>	 	
	 </form>
	 </div> 
	  
<script>

        $('#payEndBtn').click(function () {            
        	console.log(arrayTest[0]);
        	console.log(arrayTest[1]);
        	if ($("input:checkbox[name='ckkk']").is(":checked")==false) {
				alert("주문 상품정보(전자상거래법 제 8조 제 2항)에 대해 동의해 주세요.(필수)");
				return;
			}	    	
     
            var IMP = window.IMP;
            IMP.init('imp53433684');
            var money = ${sum };
            
            console.log(arrayTest);
            console.log('클래스다'+arrayTest);
            
            name = $("#member_name_val").val();
            tel = $("#member_tel_val").val();
            email = $("#member_email_val").val();
          
            //실패
           <c:forEach var='vo' items="${list}">
           	var classoptionno= Number(${vo.class_option_no});
           </c:forEach>
           
            
            //money1 = parseInt(${sum});
            //money2= parseInt(${vo.savePoint});
            //money3 = money1-money2;
            //console.log("돈돈");
  			//console.log(money3);
            
            IMP.request_pay({
            	pg: 'kcp', // PG사 선택
                pay_method: 'card',  // 지불 수단
                merchant_uid: ${vo.class_name} + new Date().getTime(),
                name: name,
                amount: money,
                buyer_email: email,
                buyer_name: name,
                buyer_tel: tel,
                buyer_addr: '인천광역시 부평구',
                buyer_postcode: '123-456'
            }, function (rsp) { // 결제성공시 imp_uid 와 merchant_uid를 가맹점 서버에 진자로 전달
	               	            	
	            	console.log("결제에 성공하였습니다");
	                console.log(arrayTest);
	           
	                
	               if (rsp.success) { //결제성공시 로직
	                    var msg = '결제가 완료되었습니다.';
	                    msg += '고유ID : ' + rsp.imp_uid;
	                    msg += '상점 거래ID : ' + rsp.merchant_uid;
	                    msg += '결제 금액 : ' + rsp.paid_amount;
	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	                    msg += '결제방법 : ' + rsp.pay_method;
	                    
	                    var purl = "/another/SaveOrder1";
	                    console.log(arrayTest);
	                    
	                    var d = "";
	                    for(var i=0; i<arrayTest.length; i++){
	                    	d += arrayTest[i]+',';
	                    }
	                    console.log(d);
	                    $.ajax({
	                        type: "POST",
	                        url: purl, //컨트롤러보낼 url 설정
	                        //headers: { "Content-Type": "application/json" },
	                        data: {
	                        	 imp_uid: rsp.imp_uid,
	                             merchant_uid: rsp.merchant_uid,
	                             total_price: rsp.paid_amount,
	                             card_num: rsp.apply_num,
	                             //class_option_no: classoptionno
	                            //+총용포인트
	                             test: d
	                        },
	                    });
	                    
	                    //
		          		var a ="user/pay/payEnd"
		          		location.href="/another/payEnd";
	                    
	                } else { //결제실패시 로직
	                    var msg = '결제에 실패하였습니다.';
	                	alert(msg);
	                    msg += '에러내용 : ' + rsp.error_msg;
	                }
	               
	          		
            });
            
            
            
        });
        

</script>
</div>
