<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>	
	
	#askWhat{width:85%;margin:0 auto;text-align:center;display:flex;margin-top:60px;}
	#askWhat>li{width:50%;font-size:22px;padding-top:10px;padding-bottom:10px;}
	#askWhat>li:nth-child(1){color:#464646;}
	#askWhat>li:nth-child(2){color:#464646;}
	
	/*클래스문의,홈페이지문의 자리div*/
	#askBigDiv{width:85%;height:auto;margin:0 auto;margin-top:30px;position:relative}/*border:1px solid black;*/
	.askDiv{width:100%;height:auto;}
	.bigTitle {
    width: 100%;
    text-align: center;
    padding-bottom: 20px;
}
.h1style {
    display: block;
    font-size: 32px;
    margin-block-start: 0.9rem;
    margin-block-end: 0.9rem;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
	/*클래스문의내용*/
	#classAsk{position:relative;visibility:hidden;}
	#classAskcontent{width:100%;height:auto;}
	#classAskcontent>li{height:auto;margin-top:15px;margin-bottom:15px;padding-bottom:10px;border-bottom:1px solid #ddd;}
	#classAskcontent>li>*{display:block;width:100%;margin-bottom:5px;}
	#classAskcontent>li>a:nth-child(1){font-size:1.1rem;font-weight:bold;margin-bottom:12px;}/*문의한 클래스명*/
	#classAskcontent>li>span{font-size:0.8rem;color:#666;padding-left:5px;}/*답변여부,작성일자*/
	#classAskcontent>li>div:nth-child(1){width:100%;}
	#classAskcontent>li>div textarea{width:100%;height:auto;background-color:#f0f0f0;font-size:14px;font-color:#333;border:none;resize:none;overflow:auto;padding:10px 0 10px 0px;margin:7px 0 7px 0;}/*문의내용*/
	.classAskcontentBtn a{background-color:#333;padding:3px 12px 3px 12px;font-size:0.8rem;}/*수정,삭제*/
	.classAskcontentBtn a:link{color:white;}
	.classAskcontentBtn a:visited{color:white;}
	.classAskcontentBtn a:hover{color:#ff385c;}
	.classAskcontentBtn a:nth-child(2){margin-left:20px;}
	
	.classAskcontenttextreplydiv{width:100%;height:auto;overflow:auto;background-color:#f0f0f0;}/*답변*/
	.classAskcontenttextreplydiv>div{float:left;min-height:100px;height:auto;word-break:break-all}
	.classAskcontenttextreplydiv>div:nth-child(1){width:12%; padding:2%;}/*강사이미지*/
	.classAskcontenttextreplydiv>div:nth-child(1) img{width:100%;border-radius:100%;}
	.classAskcontenttextreplydiv>div:nth-child(2){width:88%;overflow:auto;}/*강사가 작성한 답변내용*//*auto?scroll세로?*/
	.classAskcontenttextreplydiv>div:nth-child(2)>span{display:block;margin-top:3px;}
	.classAskcontenttextreplydiv>div:nth-child(2)>span:nth-child(2){font-size:0.8rem;color:#666;}
	
	/*홈페이지문의내용*/
	#homepageAsk{position:absolute;visibility:hidden;}
	.homeAskcontent{width:100%;}
	.homeAskcontent>li{width:20%;float:left;border-bottom:1px solid #ddd;height:50px;padding:10px 0 10px 0;text-align:center;}
	.homeAskcontent>.homeAskTli{border-bottom:2px solid #999;}
	/*.homeAskcontent>li:nth-child(4n+1){width:10%;}
	.homeAskcontent>li:nth-child(4n+2){width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;}
	.homeAskcontent>li:nth-child(4n+3){width:15%;}
	.homeAskcontent>li:nth-child(4n+4){width:15%;}
	/*.classAskTbl{background-color:#ff385c;}*/
	
</style>
<script>
	$(function(){ 
		var logid = "${userId}"; // 세션에저장된아이디		
		
	  $("#classAskT").on({			
			click:function(){				
				getClassAsk();
				//마우스오버가 발생하면 실행할 실행문
				$(this).css('color','#ff385c');
				$("#classAsk").css("visibility","visible");				
				$("#homepageAskT").css('color','#464646');
				$("#homepageAsk").css("visibility","hidden");			
			}			
		});
	
	  $("#homepageAskT").on({			
			click:function(){				
				getHomeAsk();//홈페이지리스트가져오는 함수문					
				//마우스오버가 발생하면 실행할 실행문
				$(this).css('color','#ff385c');
				$("#homepageAsk").css("visibility","visible");				
				$("#classAskT").css('color','#464646');
				$("#classAsk").css("visibility","hidden");					
			}			
		});

		//세션아이디기 가지고 회원이 작성한 홈페이지문의 목록 가져오기
		function getHomeAsk(){
			var hUrl ="/another/HomeAskReplyList999";
			var hParam = {"logid":logid} //세션에 저장된 로그인한 회원아이디	    	
			$.ajax({
				url:hUrl,
				data :hParam,
				success:function(h){//hParam가지고 hUrl로 이동해서 h에 데이터가져옴
					var hh = $(h)
	    			var tag =""; 	
						tag +="<li class='homeAskTli' style='width:10%;background-color:#f0f0f0;'>No.</li>";
						tag +="<li class='homeAskTli' style='width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;background-color:#f0f0f0;'>제목</li>";
						tag +="<li class='homeAskTli' style='width:15%;background-color:#f0f0f0;'>작성일자</li>";
						tag +="<li class='homeAskTli'  style='width:15%;background-color:#f0f0f0;'>답변여부</li>";
					hh.each(function(idx,vo){						
						tag +="<li style='width:10%;padding-top:17px;'>"+vo.user_qna_no+"</li>";	
						tag +="<li style='width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>"+vo.title+"</li>";
						tag +="<li style='width:15%;padding-top:17px;'>"+vo.writedate+"</li>";
						if(vo.replycount == 1){
							tag +="<li style='width:15%;'>미답변</li>";
						}else{
							tag +="<li style='width:15%;'>답변완료</li>";
						}
						tag+="<li  class='conconli' style='width:100%;min-height:100px;height:auto;background-color:#f0f0f0;display:none;'>";//id값,안보이게........
						tag +="<div  style='width:100%;word-break:break-all;padding-left:62px;text-align:left;'>"+vo.content+"</div>";// ->토글로
						tag +="</li>"
						if(vo.replycount ==2){
								//답글
							tag+="<li  class='reprepli' style='width:100%;min-height:100px;height:auto;display:none;'>";
							tag +="<div  style='width:100%;word-break:break-all;padding-left:62px;text-align:left;'>"+vo.replyContent+"</div>";
							tag +="</li>"
						}
						//tag +="<li>"
						//<div><input type="button" value="수정"><input type="button" value="삭제"></div> -> 누르면이동
						//tag +="</li>"
						$("#homeAskcontent").html(tag);  
					});	
				}
			})
	  }
		//세션아이디기 가지고 회원이 작성한 클래스문의 목록 가져오기
	function getClassAsk(){
			var cUrl ="/another/ClassAskReplyList999";
			var cParam = {"logid":logid}
			$.ajax({
				url:cUrl,
				data : cParam,
				success:function(c){
					var cc = $(c)
	    			var tag =""; 	
					cc.each(function(idx,vo){//vo -> 
					console.log("클래스문의가져옴");
						tag += "<li>";
						tag +="<a href='#'>[ "+vo.category_name +" ] "+vo.class_name+"</a>";
						//var a = vo.class_no
						//console.log(a);
						if(vo.replycheck == 0){
							tag +="<span>미답변</span>";
						}else{
							tag +="<span>답변완료</span>";
						}
						
						tag +="<span>"+vo.classqna_writedate+" 작성</span>";
						tag +="<div>";
						tag += "<textarea  style='padding-left:25px;' name='classAskcontenttext' readonly disabled >"+vo.classqna_content+"</textarea>";
						tag +="</div>";
						
						if(vo.replycheck == 0){
							tag +="<div'><a href='#'>수정</a><a href='#'>삭제</a></div>"
						}else{
							tag +="<div><a href='#'>삭제</a></div>"; //style='display:none;'
						}
						
						if(vo.replycheck == 1){
							tag +="<div class='classAskcontenttextreplydiv'>";
							tag +="<div><a href='#'><img src='img/jisu/profileimg.jpg'/></a></div>";//vo.creator_img
							tag +="<div>";
							tag +="<span>"+vo.creator_nick+"</span>";
							tag +="<span>"+vo.classqnacom_writedate+"</span>";
							tag+="<textarea name='classAskcontenttextreply' readonly disabled >"+vo.creator_reply+"</textarea>";
							tag+="</div>";
							tag+="</div>";
							tag+="</li>";
						}
						$("#classAskcontent").html(tag);  
					});						
				}				
			})
		}	
		
		
		
		//$().click(function()=>{
			
		//});
	});
</script>



	<div class="bigTitle"><span class="h1style" >자주묻는질문 관리</span></div>
	<ul id="askWhat"><li id="classAskT" class="atitlediv">크리에이터 자주묻는질문</li><li id="homepageAskT" class="atitlediv">고객 자주묻는질문</li></ul>	
	<div id="askBigDiv">		
		<!-- 홈페이지문의  -->
		<div id="homepageAsk" class="askDiv">
			<ul class="homeAskcontent" id="homeAskcontent">
			</ul>
		</div>		
		<!--클래스문의 -->
		<div id="classAsk"class="askDiv">
			<ul id="classAskcontent">					
				
		
			</ul>
		</div>
	</div>	

<style>
	a:link, a:visited{text-decoration:none;color:#333;}
	#hQnAD{width:1200px;height:auto;margin:0 auto;}
	.hQnAT{width:100%;text-align:center;font-size:32px;font-weight: bold;color:#333;margin:40px 0 40px 0;}
	
	/*리스트*/

	#hQnWrite{width:100%;margin:0 auto;}
	#hQnAList{width:100%;height:auto;margin:0 auto;overflow:auto; padding-left:180px;}
	#hQnAListUl{width:100%;text-align:center;height:auto;overflow:auto;}
	
	.hQnAListFli10,.hQnAListFli{float:left;width:10%;height:60px;line-height:60px;border-bottom:1px solid #ddd;}
	.hQnAListFli1,.hQnAListFli101{width:10%}
	.hQnAListFli2,.hQnAListFli102{width:56%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;text-align:left;}
	.hQnAListFli4,.hQnAListFli104{width:14%}
	
	.hQnAListFli{border-bottom:1px solid black;margin-top:10px;background-color:#f0f0f0;font-weight:bold;font-size:1.1rem;} /*리스트타이틀*/	

	#hQnWrite{height:auto;text-align:right;margin-bottom:15px;margin-top:30px;padding-right:205px;}/*글쓰기 버튼div*/
	#hQnWritelab{padding:7px 15px 7px 15px;background-color:#464646;font-size:18px;}/*글쓰기 버튼div*/
	
	/*답변
	.replyNo,.replysort{visibility:hidden;} */
	.replySubject{text-align:left;}
	
	/*리스트

	#hQnWrite{width:100%;margin:0 auto;}
	#hQnAList{width:100%;height:auto;margin:0 auto;overflow:auto;}
	#hQnAListUl{width:100%;text-align:center;height:auto;overflow:auto;}
	
	#hQnAListUl>li{float:left;width:10%;height:60px;line-height:60px;border-bottom:1px solid #ddd;}
	#hQnAListUl>li:nth-child(5n+1){width:10%}
	#hQnAListUl>li:nth-child(5n+2){width:56%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;text-align:left;}
	#hQnAListUl>li:nth-child(5n+4){width:14%}
	
	.hQnAListFli{border-bottom:1px solid black;margin-top:10px;background-color:#f0f0f0;font-weight:bold;font-size:1.1rem;} /*리스트타이틀*/	
/*
	#hQnWrite{height:auto;text-align:right;margin-bottom:15px;margin-top:10px;padding-right:7px;}/*글쓰기 버튼div*/
/*	#hQnWritelab{padding:7px 15px 7px 15px;background-color:#464646;font-size:18px;}/*글쓰기 버튼div*/
	
	/*답변
	
	.replySubject{text-align:left;}*/
	
</style>
<script>

	$(()=>{
		//셋팅된리스트에 답변부분 설정
//		if($("#hQnAListUl>li:nth-child(5n+5)") == 2){
//			$("#hQnAListUl>li:nth-child(5n+5)").html("답변완료");
//		}else if($("#hQnAListUl>li:nth-child(5n+5)") == 1){
//			$("#hQnAListUl>li:nth-child(5n+5)").html("미답변");
//		}
		
		$("#hQnWritelab").click(function(){
			var logid = "${userId}";
	    	console.log(logid);
			if(logid=== null || logid=== ""){
				alert("로그인 후 문의작성 가능합니다");
			}else{
				location.href="/another//HomeQnAAsk/write"
			}	    	
		});
		
	});
	</script>

	<div id="hQnAD">

	<!-- <div id="hQnWrite"><label id="hQnWritelab"><a href="<%=request.getContextPath()%>/HomeQnAAsk/write" style="color:white;">문의하기</a></label></div> <!-- 글쓰기버튼 -->
	
	<div id="hQnAList"> <!-- 게시판리스트 -->
		<ul id="hQnAListUl">
			<li  class="hQnAListFli hQnAListFli1">No.</li>
			<li  class="hQnAListFli hQnAListFli2" style="text-align:center">글제목</li>
			<li  class="hQnAListFli hQnAListFli4">작성일자</li>

		<c:forEach var="vo" items="${list }">	
		
			<!-- 글번호 -->
			<c:set var="board_no2" value="${vo.board_no2}" />	
			<c:if test="${board_no2 eq 0 }"> 
				<li class="hQnAListFli10 hQnAListFli101">${vo.user_qna_no}</li>
			</c:if>
			<c:if test="${board_no2 eq 1 }"> 
				<li class="hQnAListFli10 hQnAListFli101"><label style="visibility:hidden;">${vo.user_qna_no}</label></li>
			</c:if>
			<!-- 글제목 -->
			<c:if test="${board_no2 eq 0 }">
				<li class="hQnAListFli10 hQnAListFli102"><a href="<%=request.getContextPath()%>/HomeQnAAsk/view?no=${vo.user_qna_no}">${vo.title }</a></li>
			</c:if>
			<c:if test="${board_no2 eq 1 }">
				<li class="hQnAListFli10 hQnAListFli102"><a href="<%=request.getContextPath()%>/HomeQnAAsk/view?no=${vo.user_qna_no}">&ensp;&ensp;&ensp;<label style="color:blue;">[Re]</label> ${vo.title }</a></li>
			</c:if>
			
			<li class="hQnAListFli10 hQnAListFli103">${vo.member_id }</li>
			<li class="hQnAListFli10 hQnAListFli104">${vo.writedate }</li>
			
			<!-- 답변여부: 답변완료/미답변 <li class="hQnAListFli10 hQnAListFli105">${vo.replycount}</li> -->
			<c:set var="replycount" value="${vo.replycount}" />							
			<c:if test="${replycount eq 2 && board_no2 eq 0 }"> 
				<li class="hQnAListFli10 hQnAListFli105">답변완료</li>
			</c:if>
			<c:if test="${replycount eq 2 && board_no2 eq 1 }"> 
				<li class="hQnAListFli10 hQnAListFli105"></li>
			</c:if>
			<c:if test="${replycount eq 1}"> 
				<li class="hQnAListFli10 hQnAListFli105">미답변</li>
			</c:if>
			
			
			<input type="hidden" value="${vo.board_no2 }"/>
		</c:forEach>
			
		</ul>
	
	</div>
</div>
<div id="hQnWrite"><label id="hQnWritelab" style="color:white;">새글작성</label></div> <!-- 글쓰기버튼 -->