<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>	
	
	#askWhat{width:85%;margin:0 auto;text-align:center;display:flex;margin-top:60px;}
	#askWhat>li{width:50%;font-size:22px;padding-top:10px;padding-bottom:10px;}
	#askWhat>li:nth-child(1){background-color:#464646;color:white;}
	#askWhat>li:nth-child(2){background-color:#f0f0f0;color:#464646;}
	
	/*클래스문의,홈페이지문의 자리div*/
	#askBigDiv{width:85%;height:auto;margin:0 auto;margin-top:30px;position:relative}/*border:1px solid black;*/
	.askDiv{width:100%;height:auto;}
	
	/*클래스문의내용*/
	#classAsk{position:relative;display:block;}
	#classAskcontent{width:100%;height:auto;}
	#classAskcontent>li{height:auto;margin-top:15px;margin-bottom:15px;padding-bottom:10px;border-bottom:1px solid #ddd;}
	#classAskcontent>li>div{word-break:break-all;}
	#classAskcontent>li>*{width:100%;margin-bottom:5px;display:inline-block;} /*display:flex*/
	#classAskcontent>li>a:nth-child(1){font-size:1.1rem;font-weight:bold;margin-bottom:12px;}/*문의한 클래스명*/
	#classAskcontent>li>span{font-size:0.8rem;color:#666;padding-left:5px;}/*답변여부,작성일자*/
	#classAskcontent>li>div:nth-child(1){width:100%;}
	#classAskcontent>li>div textarea{width:100%;height:auto;background-color:#f0f0f0;font-size:14px;font-color:#333;border:none;resize:none;overflow:auto;padding:10px 0 10px 0px;margin:7px 0 7px 0;}/*문의내용*/
	.classAskcontentBtn a{background-color:#333;padding:3px 12px 3px 12px;font-size:0.8rem;}/*수정,삭제*/
	.classAskcontentBtn a:link{color:white;}
	.classAskcontentBtn a:visited{color:white;}
	.classAskcontentBtn a:hover{color:#ff385c;}
	.classAskcontentBtn a:nth-child(2){margin-left:20px;}
	
	.classAskcontenttextreplydiv{width:100%;height:auto;overflow:auto;background-color:#999;}/*답변*/
	.classAskcontenttextreplydiv textarea{background-color:#999;}
	.classAskcontenttextreplydiv>div{float:left;min-height:100px;height:auto;word-break:break-all}
	.classAskcontenttextreplydiv>div:nth-child(1){width:12%; padding:2%;}/*강사이미지*/
	.classAskcontenttextreplydiv>div:nth-child(1) img{width:100%;border-radius:100%;}
	.classAskcontenttextreplydiv>div:nth-child(2){width:88%;overflow:auto;}/*강사가 작성한 답변내용*//*auto?scroll세로?*/
	.classAskcontenttextreplydiv>div:nth-child(2)>span{display:block;margin-top:3px;padding-top: 12px;padding-bottom: 8px;}
	.classAskcontenttextreplydiv>div:nth-child(2)>span:nth-child(2){font-size:0.8rem;color:#666;}
	
	/*홈페이지문의내용*/
	#homepageAsk{display:none;}/*position:absolute;*/
	.homeAskcontent{width:100%;}
	.homeAskcontent>li{width:20%;float:left;border-bottom:1px solid #ddd;height:50px;padding:10px 0 10px 0;text-align:center;}
	.homeAskcontent>.homeAskTli{border-bottom:2px solid #999;}
	/*.homeAskcontent>li:nth-child(4n+1){width:10%;}
	.homeAskcontent>li:nth-child(4n+2){width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;}
	.homeAskcontent>li:nth-child(4n+3){width:15%;}
	.homeAskcontent>li:nth-child(4n+4){width:15%;}
	/*.classAskTbl{background-color:#ff385c;}*/
	
	.morebtn{
		background: #ff385c;
	    font-size: 24px;
	    border: none;
	    color: white;
	    padding: 3px 9px;
	    border-radius: 5px;
	        margin-top: 20px;
    }
	
</style>
<script>
$(function(){ 
		var logid = "${userId}"; // 세션에저장된아이디		
		
	  $("#classAskT").on({			
			click:function(){				
				getClassAsk();
				//마우스오버가 발생하면 실행할 실행문
				$(this).css('color','#ff385c');
				$("#classAsk").css("display","block");				
				$("#homepageAskT").css('color','#464646');
				$("#homepageAsk").css("display","none");			
			}			
		});
	
	  $("#homepageAskT").on({			
			click:function(){				
				getHomeAsk();//홈페이지리스트가져오는 함수문					
				//마우스오버가 발생하면 실행할 실행문
			
				$(this).css('color','#ff385c');
				$("#homepageAsk").css("display","block");			
				$("#classAskT").css('color','#fff');
				$("#classAsk").css("display","none");					
			}			
		});

		// 홈페이지문의 목록 가져오기
		function getHomeAsk(){
			var hUrl ="/another/HomeAskReplyList999";
			var hParam = {"logid":logid} 
			var tag =""; 	
			
			//$('#homeAskcontent').html(''); //위치 상관잇나
			$.ajax({
				url:hUrl,
				data :hParam,
				success:function(h){
					
					var listCnt = 5;
					
					var hh = $(h)
	    			
						tag +="<li class='homeAskTli' style='width:10%;background-color:#f0f0f0;'>No.</li>";
						tag +="<li class='homeAskTli' style='width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;background-color:#f0f0f0;'>제목</li>";
						tag +="<li class='homeAskTli' style='width:15%;background-color:#f0f0f0;'>작성일자</li>";
						tag +="<li class='homeAskTli'  style='width:15%;background-color:#f0f0f0;'>답변여부</li>";
					
					//$('#homeAskcontent').html('');//원래있던거지우고새로
					hh.each(function(idx,vo){		
						
					if( idx <= (listCnt-1) ){			
						tag ="<li style='width:10%;padding-top:17px;'>"+vo.user_qna_no+"</li>";	
						tag +="<li class='title' style='width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding-top: 14px;'>"+vo.title+"<input type='hidden' value='"+vo.user_qna_no+"' ></li>"; //제목
						tag +="<li style='width:15%;padding-top:17px;'>"+vo.writedate+"</li>";
						if(vo.replycount == 1){
							tag +="<li style='width:15%;padding-top: 14px;'>미답변</li>";
						}else{
							tag +="<li style='width:15%;padding-top: 14px;'>답변완료</li>";
						}
						tag+="<li  id='a"+vo.user_qna_no+"' class='conconli' style='border: none;width:100%;min-height:100px;height:auto;background-color:#f0f0f0;display:none;'>";//id값,안보이게........display:none;						
						tag +="<div  id='aa"+vo.user_qna_no+"' style='width:100%;word-break:break-all;padding-left:62px;text-align:left;min-height:57px;height:auto;'>"+vo.content+"</div>";// ->토글로						
						tag +="<div  style='width:100%;text-align:right;'><a href='#' style='margin-right:25px;border: 1px solid #999;padding: 5px 10px 5px 10px;color: #666;font-size:0.8rem;' class='hediBtn'>수정<input type='hidden' value='"+vo.user_qna_no+"'></a>";
						tag += "<a  style='margin-right:25px;border: 1px solid #999;padding: 5px 10px 5px 10px;color: #666;font-size:0.8rem;' class='hdelBtn'>삭제<input type='hidden' value='"+vo.user_qna_no+"'></a></div>";// ->토글로						
						tag +="</li>"						
						//수정폼
						tag +="<form id='MyPagehomeqnaEdiF'>"
						tag +="<li id='b"+vo.user_qna_no+"' class='conconli' style='display:none;border: none;width:100%;min-height:100px;height:auto;background-color:#f0f0f0;'>";//id값,안보이게........display:none;						
						tag +="<textarea  style='width:100%;word-break:break-all;padding-left:62px;text-align:left;min-height:57px;height:auto;resize:none;background-color:#f0f0f0;border:none;' name='content'>"+vo.content+"</textarea>";// ->토글로						
						tag +="<div  style='width:100%;text-align:right;'><button style='margin-right:25px;border: 1px solid #999;padding: 5px 10px 5px 10px;color: #666;font-size:0.8rem;' >수정완료<input type='hidden' value='"+vo.user_qna_no+"' name='user_qna_no'></button>";
						tag += "</div>";					
						tag +="</li>"
						tag +="</form>"					
						if(vo.replycount ==2){
								//답글
							tag+="<li id='bb"+vo.user_qna_no+"' class='reprepli' style='width:100%;min-height:100px;height:auto;display:none;'>";//display:none;
							tag +="<div  style='width:100%;word-break:break-all;padding-left:62px;text-align:left;'>[<label style='color:blue;'>Re</label>]&nbsp;"+vo.replyContent+"</div>";
							tag +="</li>"
						}					
						$("#homeAskcontent").append(tag);  
						$('.no-result-txt').hide(); // 결과 없음 내용 숨기기
						$('.more').show(); // 더보기 버튼 보이기
						if(idx >= hh.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
							$('.more').hide();
						}
					}//if문종료
					var n=1;
					$('.more > button').click(function(){
						n++;
					if( idx >= listCnt*(n-1) && idx <= (listCnt*n-1) ){
						tag ="<li style='width:10%;padding-top:17px;'>"+vo.user_qna_no+"</li>";	
						tag +="<li class='title' style='width:60%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding-top: 14px;'>"+vo.title+"<input type='hidden' value='"+vo.user_qna_no+"' ></li>"; //제목
						tag +="<li style='width:15%;padding-top:17px;'>"+vo.writedate+"</li>";
						if(vo.replycount == 1){
							tag +="<li style='width:15%;padding-top: 14px;'>미답변</li>";
						}else{
							tag +="<li style='width:15%;padding-top: 14px;'>답변완료</li>";
						}
						tag+="<li  id='a"+vo.user_qna_no+"' class='conconli' style='border: none;width:100%;min-height:100px;height:auto;background-color:#f0f0f0;display:none;'>";//id값,안보이게........display:none;						
						tag +="<div  id='aa"+vo.user_qna_no+"' style='width:100%;word-break:break-all;padding-left:62px;text-align:left;min-height:57px;height:auto;'>"+vo.content+"</div>";// ->토글로						
						tag +="<div  style='width:100%;text-align:right;'><a href='#' style='margin-right:25px;border: 1px solid #999;padding: 5px 10px 5px 10px;color: #666;font-size:0.8rem;' class='hediBtn'>수정<input type='hidden' value='"+vo.user_qna_no+"'></a>";
						tag += "<a  style='margin-right:25px;border: 1px solid #999;padding: 5px 10px 5px 10px;color: #666;font-size:0.8rem;' class='hdelBtn'>삭제<input type='hidden' value='"+vo.user_qna_no+"'></a></div>";// ->토글로						
						tag +="</li>"						
						//수정폼
						tag +="<form id='MyPagehomeqnaEdiF'>"
						tag +="<li id='b"+vo.user_qna_no+"' class='conconli' style='display:none;border: none;width:100%;min-height:100px;height:auto;background-color:#f0f0f0;'>";//id값,안보이게........display:none;						
						tag +="<textarea  style='width:100%;word-break:break-all;padding-left:62px;text-align:left;min-height:57px;height:auto;resize:none;background-color:#f0f0f0;border:none;' name='content'>"+vo.content+"</textarea>";// ->토글로						
						tag +="<div  style='width:100%;text-align:right;'><button style='margin-right:25px;border: 1px solid #999;padding: 5px 10px 5px 10px;color: #666;font-size:0.8rem;' >수정완료<input type='hidden' value='"+vo.user_qna_no+"' name='user_qna_no'></button>";
						tag += "</div>";					
						tag +="</li>"
						tag +="</form>"					
						if(vo.replycount ==2){
								//답글
							tag+="<li id='bb"+vo.user_qna_no+"' class='reprepli' style='width:100%;min-height:100px;height:auto;display:none;'>";//display:none;
							tag +="<div  style='width:100%;word-break:break-all;padding-left:62px;text-align:left;'>[<label style='color:blue;'>Re</label>]&nbsp;"+vo.replyContent+"</div>";
							tag +="</li>"
						}					
						$("#homeAskcontent").append(tag);  
						$('.no-result-txt').hide(); // 결과 없음 내용 숨기기
						$('.more').show(); // 더보기 버튼 보이기
						if(idx >= hh.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
							$('.more').hide();
						}
					 
					}
					 }); ////////클릭이벤트
					
					
					});	//each
				}
			})
	  }
		//클래스문의 목록 
	function getClassAsk(){
			var cUrl ="/another/ClassAskReplyList999";
			var cParam = {"logid":logid}
			$.ajax({
				url:cUrl,
				data : cParam,
				success:function(c){
					var listCnt = 3; 
					var cc = $(c)
	    			var tag =""; 	
					$('#classAskcontent').html('');
					cc.each(function(idx,vo){//vo -> 
					
					if( idx <= (listCnt-1) ){	
						tag ="<li>";
						tag +="<a href='<%=request.getContextPath()%>/classDetailView?no="+vo.class_no+"'>[ "+vo.category_name +" ] "+vo.class_name+"</a>";
						
						if(vo.replycheck == 0){
							tag +="<span>미답변</span>";
						}else{
							tag +="<span>답변완료</span>";
						}
						
						tag +="<span>"+vo.classqna_writedate+" 작성</span>";
						//////////////////////////////////////////////////
						tag +="<div id='a"+vo.class_qna_no+"'>";
						tag +="<textarea  style='padding-left:25px;min-height:110px;height:auto;' name='classAskcontenttext' readonly disabled >"+vo.classqna_content+"</textarea>";						
						
						if(vo.replycheck == 0){
							tag +="<div style='text-align:right;display:inline-block;width:100%;'><button class='CAedit' style='margin-right:25px;border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>수정";
							tag +="<input type='hidden' value='"+vo.class_qna_no+"'></button>";
							tag +="<button class='CAdel' style=' border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>삭제";
							tag +="<input type='hidden' value='"+vo.class_qna_no+"'></button></div>"
						}else{
							tag +="<div style='text-align:right;display:inline-block;width:100%;margin-bottom:10px;'><button class='CAdel' style=' border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>삭제<input type='hidden' value='"+vo.class_qna_no+"'></button></div>"; //style='display:none;'
						}
						tag +="</div>";
						//////////////////////////////////////////////////수정폼
					
						tag +="<div id='b"+vo.class_qna_no+"' style='display:none;' class='editqnaform'>";
						tag += "<form method='post'> "
						tag +="<textarea style='padding-left:25px;min-height:110px;height:auto;resize:none;width:100%;border:none;background-color:#f0f0f0;padding-top:11px;' name='classqna_content'>"+vo.classqna_content+"</textarea>";
						tag +="<input type='hidden' value='"+vo.class_qna_no+"' name='class_qna_no'>"
						tag +="<div style='text-align:right;display:inline-block;width:100%;margin-bottom:10px;'><button class='CAEdF' style=' border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>수정완료</button></div>"; 
						tag +="</form>"
						tag +="</div>";
						
						if(vo.replycheck == 1){
							tag +="<div class='classAskcontenttextreplydiv'>";
							tag +="<div><a href='#'><img src='"+vo.creator_img+"'/></a></div>";//vo.creator_img
							
							tag +="<div>";
							tag +="<span>"+vo.creator_nick+"</span>";
							tag +="<span>"+vo.classqnacom_writedate+"</span>";
							tag +="<textarea name='classAskcontenttextreply' readonly disabled style='background-color:#999;'>"+vo.creator_reply+"</textarea>";
							tag +="</div>";
							tag +="</div>";
							tag +="</li>";
						}
						$("#classAskcontent").append(tag); 
						
						$('.more').show(); // 더보기 버튼 보이기
						if(idx >= cc.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
							$('.more').hide();
						}
					}//listcnt if문
					
					var n=1;
					$('.more > button').click(function(){
						n++;
						if( idx >= listCnt*(n-1) && idx <= (listCnt*n-1) ){
							tag ="<li>";
							tag +="<a href='#'>[ "+vo.category_name +" ] "+vo.class_name+"</a>";
							
							if(vo.replycheck == 0){
								tag +="<span>미답변</span>";
							}else{
								tag +="<span>답변완료</span>";
							}
							
							tag +="<span>"+vo.classqna_writedate+" 작성</span>";
							//////////////////////////////////////////////////
							tag +="<div id='a"+vo.class_qna_no+"'>";
							tag +="<textarea  style='padding-left:25px;min-height:110px;height:auto;' name='classAskcontenttext' readonly disabled >"+vo.classqna_content+"</textarea>";						
							
							if(vo.replycheck == 0){
								tag +="<div style='text-align:right;display:inline-block;width:100%;'><button class='CAedit' style='margin-right:25px;border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>수정";
								tag +="<input type='hidden' value='"+vo.class_qna_no+"'></button>";
								tag +="<button class='CAdel' style=' border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>삭제";
								tag +="<input type='hidden' value='"+vo.class_qna_no+"'></button></div>"
							}else{
								tag +="<div style='text-align:right;display:inline-block;width:100%;margin-bottom:10px;'><button class='CAdel' style=' border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>삭제<input type='hidden' value='"+vo.class_qna_no+"'></button></div>"; //style='display:none;'
							}
							tag +="</div>";
							//////////////////////////////////////////////////수정폼
						
							tag +="<div id='b"+vo.class_qna_no+"' style='display:none;' class='editqnaform'>";
							tag += "<form method='post'> "
							tag +="<textarea style='padding-left:25px;min-height:110px;height:auto;resize:none;width:100%;border:none;background-color:#f0f0f0;padding-top:11px;' name='classqna_content'>"+vo.classqna_content+"</textarea>";
							tag +="<input type='hidden' value='"+vo.class_qna_no+"' name='class_qna_no'>"
							tag +="<div style='text-align:right;display:inline-block;width:100%;margin-bottom:10px;'><button class='CAEdF' style=' border: 1px solid #ddd;padding: 4px 13px 4px 13px;color: #666;font-size:0.8rem;background-color:#fff;'>수정완료</button></div>"; 
							tag +="</form>"
							tag +="</div>";
							
							if(vo.replycheck == 1){
								tag +="<div class='classAskcontenttextreplydiv'>";
								tag +="<div><a href='#'><img src='"+vo.creator_img+"'/></a></div>";//vo.creator_img
								tag +="<div>";
								tag +="<span>"+vo.creator_nick+"</span>";
								tag +="<span>"+vo.classqnacom_writedate+"</span>";
								tag +="<textarea name='classAskcontenttextreply' readonly disabled style='background-color:#999;'>"+vo.creator_reply+"</textarea>";
								tag +="</div>";
								tag +="</div>";
								tag +="</li>";
							}
							$("#classAskcontent").append(tag); 
							
							$('.more').show(); // 더보기 버튼 보이기
							if(idx >= cc.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
								$('.more').hide();
							}
						
						
						}
						
					});//클릭이벤트 
					
					
					});	//each if문					
				}				
			})
		}	
		
		
	//클래스문의글 삭제	
	$(document).on('click','.CAdel',function(){	
		 if(confirm('문의글을 삭제하시겠습니까?')){
             var params = "no="+$(this).children("input").val();
             $.ajax({
               url : "/another/classAskDD", 
               data : params,
               success : function(result){
            	   if(result>0){
            		   getClassAsk(); 
            	   }else{
            		   alert("글삭제 실패하였습니다.");
            	   }
               }
             });
          }	
	});	
		
	//클래스문의글수정
	$(document).on('click','.CAedit',function(){		
		var a = $(this).children("input").val();
		console.log(a);
		$('#a'+a).css('display','none');
		$('#b'+a).css('display','block');
		
	});	
	//수정완료버튼클릭	
      $(document).on('submit','.editqnaform form',function(){ 
         var url ="/another/classAskConEdit";
         var params = $(this).serialize();
         console.log('수정완료버튼클릭');
         $.ajax({
            url : url,
            data :params,
            type : "POST",
            success : function(result){
            	alert('수정되었습니다');
            	getClassAsk();
            }
         });
         return false; 
      });	
	
	//홈페이지 문의글삭제
	$(document).on('click','.hdelBtn',function(){
	
		 if(confirm('문의글을 삭제하시겠습니까?')){
             var params = "no="+$(this).children("input").val();
             $.ajax({
               url : "/another/UserMyHQnADel", 
               data : params,
               success : function(result){
            	   if(result>0){
            		   alert('삭제되었습니다');
            		   $('#homeAskcontent').empty();
            		   getHomeAsk();
            	   }else{
            		   alert("글삭제 실패하였습니다.");
            	   }
               }
             });
          }
	});		

	//홈페이지문의 수정버튼클릭
	$(document).on('click','.hediBtn',function(){	
		var a = $(this).children("input").val();
		console.log(a);
		$('#a'+a).css('display','none');
		$('#b'+a).css('display','block');
		
	});	
	//수정완료버튼클릭
    $(document).on('submit','#MyPagehomeqnaEdiF',function(){ 
       var url ="/another/UserMyHQnAEdit"; 
       var params = $(this).serialize();
       console.log('수정완료버튼클릭');
       $.ajax({
          url : url,
          data :params,
          type : "POST",
          success : function(result){
          	alert('수정되었습니다');
          	$('#homeAskcontent').empty();
          	getHomeAsk();
          }
       });
       return false; 
    });
	
	
	//홈페이문의제목클릭시
	$(document).on('click','.title',function(){		
		var a = $(this).children("input").val();
		console.log(a);
		$('#a'+a).toggle();
		$('#bb'+a).toggle();
	});	
	
    getClassAsk();

});



</script>

<%@ include file="myPageTop.jspf" %>

	<div class="bigTitle"><span class="h1style" >나의 문의</span></div>
	<ul id="askWhat"><li id="classAskT" class="atitlediv">클래스문의</li><li id="homepageAskT" class="atitlediv">홈페이지문의</li></ul>	
	<div id="askBigDiv">		
		<!-- 홈페이지문의  -->
		<div id="homepageAsk" class="askDiv">
			<ul class="homeAskcontent" id="homeAskcontent">
			</ul>
			<div class="more" style="display:none;text-align:center;">
			<button type="button" class="morebtn">+ more</button>
			</div>
		</div>		
		<!--클래스문의 -->
		<div id="classAsk"class="askDiv">
			<ul id="classAskcontent">		
			</ul>
			<div class="more" style="display:block;text-align:center;">
			<button type="button" class="morebtn">+ more</button>
			</div>
		</div>
	</div>	

<%@ include file="myPageBottom.jspf" %>