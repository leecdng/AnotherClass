<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- 데이트피커 
	<script type="text/javascript" src="<%=request.getContextPath()%>/css/user/classCalendar/jquery-ui.min.js"></script>-->  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/classCalendar/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk=" crossorigin="anonymous"></script> 

<style>
	div{margin:0;padding:0; box-sizing:border-box;}
	a:link, a:hover, a:visited{text-decoration:none; color:#333;}
	#Bcotainer{margin:0 auto; width:1200px; height:auto; display:flex;margin-top:50px;} /* 모든걸감싸는 큰박스*/	
	#leftdiv{width:800px;margin:0;}	
	#rightdiv{width:398px; position:relative;}	
	#calssintro{width:100%;} /* 클래스대표사진 + 소개 컨테이너 */
	/*==================#leftdiv==================*/	
	/* 클래스이미지 div */
	#d1{width:100%;height:430px;overflow:hidden;margin-bottom:10px;} /*높이,배경색 수정*/
	#d1>img{width:100%;height:100%;object-fit:cover;border-radius:12px;} /*object-fit:cover ? fill?  ;*/	
	/* 클래스소개 div*/
	#d2{width:95%;overflow:auto;padding-bottom:10px;margin:0 auto;} 
	#d2>ul>li{padding-bottom:5px;} /* ===지울것===*/
	#d2 li:nth-child(1){margin-top:5px;font-weight:bold;color:#ff385c;} 
	#d2 li:nth-child(2){font-size:1.5rem; font-weight:bold;margin:5px 0 5px 0;}
	#d2 li:nth-child(3){font-size:1rem;padding-bottom:0px;white-space: pre-line;}	
	#d2 li:nth-child(4)>div{width:100%;height:26px;}/*overflow:auto;*/
	#d2 li:nth-child(4)>div>div{float :left;}/*좋아요버튼+좋아요수*/	
	#d2 li:nth-child(4)>div>div:nth-child(1){width:88%; text-align:right; height:100%;} /*좋아요버튼 , 이미지*/
	#d2 li:nth-child(4)>div>div:nth-child(1)>img{width:24px;height:90%;}
	#d2 li:nth-child(4)>div>div:nth-child(2){width:7%; height:100%;color:#666;font-size:18px;padding-left:10px;} /*좋아요 수 */	
	#d2 li:nth-child(5){width:100%;height:100%;color:#999;text-align:right;}	
	#d2 li:nth-child(6){overflow:auto; border:1px solid red;} /*공유*/
	#d2 li:nth-child(6)>div{text-align:right;}	
	/*강사이미지프로필 + 강사닉네임*/
	#d3{width:100%; height:105px; overflow:auto;border-bottom:1px solid #ddd;border-top:1px solid #ddd;}
	#d3>div{float:left;}
	#d3 div:nth-child(1){width:15%;height:100%; overflow:hidden; padding:2%;} /*overflow:hidden : 선택시 네모로 안보이겡*/
	#d3 div:nth-child(1)>img{width:100%;height:100%;border-radius:100%;object-fit:fill;}
	#d3 div:nth-child(2){width:80%;height:100%;padding-left:2%;}  /* height..흠*  -> 가운데로 정렬*/ 	
	#d3 div:nth-child(2) a:link,  a:visited{text-decoration:none; color:#333;}
	#d3 div:nth-child(2) a:hover{color:#ff385c;}
	#d3 div:nth-child(2)>*{display:block;width:100%;}
	#d3 div:nth-child(2)>a{font-size:1.2rem;padding-top:25px;font-weight:bold;}
	#d3 div:nth-child(2)>span{padding-top:5px;padding-left:1px;color:#666;font-size:0.9rem;}	
	/* 메뉴바 */
	#d4{width:100%;height:auto;overflow:auto;position:sticky;top:78px;background-color:white;z-index:500;}
	#d4>ul{width:100%;height:auto;overflow:auto;}
	#d4 li{float:left; width:20%;height:50px;line-height:50px; text-align:center;border-bottom:1px solid #ddd;}		
	/*클레스 상세페이지 메뉴*/
	.menu{width:100%; min-height:500px;height:100%; border-bottom:1px solid #ddd; overflow:auto;padding-bottom:30px;} /*min-height*/	
	.menutitle{height:70px;line-height:70px;font-size:1.2rem;font-weight:bold;}	
	#d5>div:nth-child(1)>span{display:inline-block;box-shadow:inset -11px #ff385c;}
	#d5>div:nth-child(2){ white-space: pre-line;text-align:center;}/*클래스소개*/
	#d5>div:nth-child(2) img{width:100%;height:500px;object-fit:fill;margin:20px 0 20px 0;}	
	#d6>div:nth-child(2){white-space: pre-line}
	#d6>div:nth-child(2)>img{max-width:100%;max-height:500px;margin:20px 0 20px 0;}	
	#d7>div:nth-child(2){margin:10px 0 10px 0;}
	#d9{width:100%;height:auto;}
	#d9>div{width:100%;height:100%;}
	#d9_2{padding: 15px;} /*fff0f5 ffe4e4*/
	#d9>div:nth-child(2n+1){margin-bottom:20px;}/*제목div*/		
	#creatormemberoneask{width:100%;height:auto;}/*overflow:auto;*/
	#creatormemberoneask>li{width:100%;}
	#creatormemberoneask>li>div{width:100%;height:137px;margin-bottom:15px;overflow:auto;}
	#creatormemberoneask>li>div>div{float:left;height:100%;}
	#creatormemberoneask>li>div>div:nth-child(2n+1){width:12%;height:100%;}
	#creatormemberoneask>li>div>div:nth-child(2n+1)>img{width:80%;height:64%;border-radius:100%;display: inline-block;margin-left: 4px;margin-top: 3px;}
	#creatormemberoneask>li>div>div:nth-child(2n+2){width:88%;height:100%;}
	#creatormemberoneask>li>div>div:nth-child(2n+2)>div{width:100%;}	
	#creatormemberoneask>li>div>div>div{width:100%;height:auto;}
	#creatormemberoneask>li>div>div>div:nth-child(2){overflow:auto;word-break:break-all;}/*텍스트줄바굼*/
	#creatormemberoneask>li>div>div>div:nth-child(1)>label{display:inline-block;margin:5px 0 10px 15px;font-size:0.8rem;color:#666;word-break:break-all;}	
	#creatormemberoneask>li>div>div>div:nth-child(2)>label{display:inline-block;margin-left:15px;width:96%;color:#333;font-size:0.9rem;margin-bottom: 5px;}	
	#creatormemberoneask>li>div>div>div:nth-child(3)>label{display:inline-block;margin-left:15px;width:96%;color:#333;font-size:0.9rem;}
	#d9>div:nth-child(3){width:100%;height:100%;border:2px solid #ddd;margin:20px 0 20px 0;padding:10px 0 10px 0; }
	#d9>div:nth-child(3)>span{display:block;margin:0 0 10px 36px;font-size:0.9rem;color:#333;}
	#d9>div:nth-child(3)>form>div{text-align:center;}/*padding-left:26px;*/
	#classMainAskTa{width:90%;height:100px;resize:none;overflow:auto;border-color:#ddd;}/*댓글작성하는부분*/
	#d9>div:nth-child(3)>form>input[type=button]{margin: 10px 0 0 656px;background-color:#ff385c;border:none;border-radius:5px;color:white;width:100px;padding-top:5px;padding-bottom:5px;}
	textarea::placeholder {color:#999;}	
	.askdiv909{border:1px solid #f0f0f0;padding:10px;}/*회원배경:회색*/
	.askdiv808{background-color: #f0f0f0;padding:10px;}/*강사배경 : 연핑크 or 연하늘*/
	/*==================#rightDiv==================*/	
	/*rightDiv*/
	#rightConBox{width:96%;margin-left:10px; min-height:540px;height:auto; box-shadow: 0 0 8px rgba(0,0,0,0.3);position:sticky;top:80px;border-radius: 10px;}
	#rightConBox div{margin:0 auto;}	
	/*달력 width:350px;*/	
	#datepicker{padding-top:25px;}	
	/*클래스옵션목록*/
	#selectdateBB{width:350px;height:auto;border:1px solid #f0f0f0;}
	#selectClassListd{width:320px;min-height:10px;height:auto;} /*border:1px solid #f0f0f0;*/	
	.oneclassdiv{width:320px;height:auto;border:1px solid #ff385c;padding:10px;border-radius: 14px;}/*border:1px solid #f0f0f0;*/
	.startdiv{width:275px;font-size:22px;}
	.enddiv{width:276px;}
	.headcountdiv{width:276px;}
	.classoptionno{display:none;}
	.ckdiv{width:276px;}
	.inend{color:#ff385c;}	
	/*버튼감싸고 있는div*/
	#buttonhomec{width:350px;display:flex;width:350px;}
	#buttonhomec input[type=button]{border:none;}
	#gobasketB{width:119px;height:50px;font-size:20px;margin:10px 30px 0 0;boder:1px solid #ddd;background-color:#616060;color:#fff;}
	#gopayB{width:200px;height:50px;font-size:20px;margin:10px 0 0 0;boder:1px solid #ddd;background-color:#616060;color:#fff;}
	
	/*word-break:break-all;*/
	
	.menu_title_container{z-index:1000;}/*메뉴바*/
	
	#morebtn{
		background: #ff385c;
	    font-size: 16px;
	    border: none;
	    color: white;
	    padding: 3px 7px;
	    border-radius: 5px;
    }
	
</style>
<script>

		

$(document).ready(function(){		
	

		var logid = "${userId}"; 
		var maxheadcount = "${vo.max_headcount}"; //이 클래스의 최대인원				

	    $(function(){//달력
	         $('.datepicker').datepicker({
	        	 dateFormat: 'yy-mm-dd'
	        	 ,dayNamesMin: ['일','월','화','수','목','금','토']
	         	 ,minDate: "-0M" 
	             ,maxDate: "+5M" 
	         });	         
	         $('.datepicker').datepicker('setDate', 'today');
	      })

	    //달력 Ajax	
	    $('#datepicker').on("change", function() { 	
	    	$("#selectClassListd").empty();    	
	    	var url ="/another/classDetailDatePick";	
	    	var params = {"datedate" : $(this).val(),"no":${vo.class_no }}
	    	console.log($(this).val()+ " , "+${vo.class_no });	    	
	    	$.ajax({	    		
	    		url:url,
	    		data:params,
	    		success:function(r){
	    			var rr = $(r)
	    			var tag ="";
	    			rr.each(function(idx,vo4){	 	    				 
	    				tag += "<div class='oneclassdiv' style='margin-bottom:10px;'>";	    				
	    				tag +="<div class='startdiv'>"+vo4.start_date+ "</div>";
	    				//tag +="<div class='enddㅓㅓㅓiv'>"+vo4.end_date+ "</div>"; //vo에서 셀렉트할때 데이트형식 -> 종료시간만 꺼내게 가져왓음
	    				tag +="<div class='headcountdiv'> 최대인원 : "+maxheadcount+"&nbsp;&nbsp;&nbsp;신청인원 : "+vo4.all_headcount+"</div>";
	    				tag +="<div class='classoptionno'>"+vo4.class_option_no+"</div>";
	    				
	    				if(maxheadcount != vo4.all_headcount){//name변경 checkedclassoption
	    					tag +="<div class='ckdiv'><label style='color:#ff385c;'>클래스선택</label>&nbsp;&nbsp;<input type='checkbox' class='checkbb' name='classNoPayList' value='"+vo4.class_option_no +"'  /></div>";
	    					var a = vo4.class_option_no;	 	    					
	    				   }else{
	    					tag +="<div class='inend'>신청마감</div>";  
	    				}	    				
	    				tag +="</div>";
	    				 $("#selectClassListd").html(tag);		    				
	    			});
	    		} 
	    	});	    
	    }); 	    
	    function LikeCount(){ 
	    	
	    	var lUrl ="/another/classDetailLikeCount";
			var lParam ="no=${vo.class_no}";
			console.log(${vo.class_no });
			$.ajax({
				url : lUrl,
				data : lParam,
				success:function(t){
	    			var tt = $(t)	    			
	    			tt.each(function(idx,vo3){	    				
	    				$("#likelikecount").html(vo3.class_count);	    				
	    				if(vo3.class_like_check==0){
	    					//빈하트 //likeimgbox2
	    					$("#likeimgbox2").attr("src", "img/jisu/ff385bigborderheart.png");
	    					// ...............................................
	    					$("#likelikecountnum").val(vo3.class_like_check);
	    					
	    				}else if(vo3.class_like_check==1){
	    					//꽉찬하트
	    					$("#likeimgbox2").attr("src", "img/jisu/ff385bigcheart.png");
	    					$("#likelikecountnum").val(vo3.class_like_check);
	    				}	    			
	    			});
	    		}			
			})
		}	    	    
	    function like_func(){	
	    	var hUrl ="/another/classDetailLikeFun";
	    	var hParam ="no=${vo.class_no}";
	    	$.ajax({
	    		url : hUrl,
				data : hParam,
				success:function(){
					LikeCount(); 
				}
	    	})	    	
	    }	   	    
	    function  login_need(){
	    	alert("로그인 후 좋아요 가능합니다.");
	    }	    	    
	    $('#likeimgbox2').click(function(){
	    	var logid = "${userId}";
	    	console.log(logid);
			if(logid=== null || logid=== ""){
				alert("로그인후 좋아요 가능합니다");
			}else{
				like_func();
			}	    	
	    });
	    function AskList(){ //문의글 다 가져오는 리스트함수	    	
	    	var aUrl ="/another/classDetailAskList";
	    	var aParam = {"no":${vo.class_no }}	    	
	    	$.ajax({
	    		url:aUrl,
	    		data:aParam,
	    		success:function(a){
	    			var listCnt = 5;
	    			var aa = $(a)
	    			$('#creatormemberoneask').html('');
	    			var tag =""; 	    			
					aa.each(function(idx,vo4){
	    					//문의글	
						if( idx <= (listCnt-1)){
	    					tag ="<li>";
	    					tag +="<div class='askdiv909' id='a"+vo4.class_qna_no+"'>";
	    					tag +="<div><img src='"+vo4.member_img+"'/></div>"; //작성자이미지  member_img
	    					tag +="<div>";
	    					tag +="<div><label>"+ vo4.classqna_member_id+" | "+ vo4.classqna_writedate+" 작성</label></div>"; // 멤버아이디가 나일때 ->글 수정 삭제 버튼 보이게....    					
	    					tag +="<div><label>"+ vo4.classqna_content+"</label>"; //내용	  
	    					if(logid == vo4.classqna_member_id){	    						
	    						tag +="<label><button class='ediBtn' style='float:right;border-radius:7px;margin-left: 8px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;'>수정";
	    						tag +="<input type='hidden' value='"+vo4.class_qna_no+"'></button>";
	    						tag +="<button class='delBtn' style='float:right;border-radius: 7px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;'>삭제";
	    						tag +="<input type='hidden' value='"+vo4.class_qna_no+"'></button></label>";	    								
	    					}else{
	    						tag+="<label></label>";
	    					}
	    					if(vo4.replycheck==1){
	    						tag +=	"<label><input type='button' value='답변확인' style='float: right;font-size: 0.8rem;background-color:#ff385c;border: none;border-radius:5px;color:white; padding: 2px 5px 2px 5px;' class='"+vo4.class_qna_no+"' id='replyshow' ></label>";
	    					}else{
	    						tag += "<label><input type='button' value='미답변' style='float: right;font-size: 0.8rem;background-color:#ff385c;border: none;border-radius:5px;color:white; padding: 2px 5px 2px 5px;' ></label>";
	    					}	
	    					tag += "</div></div> ";
	    					tag += "</div> ";    			    					
	    					if(vo4.replycheck==1){
	    						tag +="<div class='askdiv808' id='"+vo4.class_qna_no+"' style='display:none;'></div>";	    					 					
	    					}    				
		    				tag +="</li>";	 
		    				//수정폼		    			
		    				tag +="<li style='display:none' id='b"+vo4.class_qna_no+"'>";//style='display:none'
	    					tag +="<div class='askdiv909 editaskdiv909'>";
	    					tag +="<div><img src='"+vo4.member_img+"'/></div>"; //작성자이미지  vo4.member_img
	    					tag +="<div>";
	    					tag +="<div><label>"+ vo4.classqna_member_id+" | "+ vo4.classqna_writedate+" 작성</label></div>"; // 멤버아이디가 나일때 ->글 수정 삭제 버튼 보이게....    					
	    					tag += "<form method='post' >"
	    					tag +="<div><textarea name='classqna_content' style='width:640px;height:50px;resize:none;margin-left: 13px;'>"+ vo4.classqna_content+"</textarea>"; //내용	    					
	    					tag +="<label style='display:block;'><input type='submit' id='c"+vo4.class_qna_no+"' value='수정완료' class='edit' style='float:right;border-radius:7px;margin-left: 8px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;'>";
	    					tag +="<input type='hidden' name='class_qna_no' value='"+vo4.class_qna_no+"'>";
	    					tag +="</form>";
	    					tag +="<button  class='cancel' style='float:right;border-radius: 7px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;display:none;'>취소"; //display:none;
	    					tag +="<input type='hidden' value='"+vo4.class_qna_no+"'></button></label>";
	    					tag +="<label></label>";
	    					tag += "</div></div> ";
	    					tag += "</div> ";
		    				tag +="</li>";
		    				$("#creatormemberoneask").append(tag);    
		    				
		    				$('.more').show(); // 더보기 버튼 보이기
			                 if(idx >= aa.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
			                    $('.more').hide();
			                }
						
						
						}//idx if문
						var n=1;
						$('.more > button').click(function(){
							n++; 
							if( idx >= listCnt*(n-1) && idx <= (listCnt*n-1) ){
								
								tag ="<li>";
		    					tag +="<div class='askdiv909' id='a"+vo4.class_qna_no+"'>";
		    					tag +="<div><img src='"+vo4.member_img+"'/></div>"; //작성자이미지  member_img
		    					tag +="<div>";
		    					tag +="<div><label>"+ vo4.classqna_member_id+" | "+ vo4.classqna_writedate+" 작성</label></div>"; // 멤버아이디가 나일때 ->글 수정 삭제 버튼 보이게....    					
		    					tag +="<div><label>"+ vo4.classqna_content+"</label>"; //내용	  
		    					if(logid == vo4.classqna_member_id){	    						
		    						tag +="<label><button class='ediBtn' style='float:right;border-radius:7px;margin-left: 8px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;'>수정";
		    						tag +="<input type='hidden' value='"+vo4.class_qna_no+"'></button>";
		    						tag +="<button class='delBtn' style='float:right;border-radius: 7px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;'>삭제";
		    						tag +="<input type='hidden' value='"+vo4.class_qna_no+"'></button></label>";	    								
		    					}else{
		    						tag+="<label></label>";
		    					}
		    					if(vo4.replycheck==1){
		    						tag +=	"<label><input type='button' value='답변확인' style='float: right;font-size: 0.8rem;background-color:#ff385c;border: none;border-radius:5px;color:white; padding: 2px 5px 2px 5px;' class='"+vo4.class_qna_no+"' id='replyshow' ></label>";
		    					}else{
		    						tag += "<label><input type='button' value='미답변' style='float: right;font-size: 0.8rem;background-color:#ff385c;border: none;border-radius:5px;color:white; padding: 2px 5px 2px 5px;' ></label>";
		    					}	
		    					tag += "</div></div> ";
		    					tag += "</div> ";    			    					
		    					if(vo4.replycheck==1){
		    						tag +="<div class='askdiv808' id='"+vo4.class_qna_no+"' style='display:none;'></div>";	    					 					
		    					}    				
			    				tag +="</li>";	 
			    				//수정폼		    			
			    				tag +="<li style='display:none' id='b"+vo4.class_qna_no+"'>";//style='display:none'
		    					tag +="<div class='askdiv909 editaskdiv909'>";
		    					tag +="<div><img src='"+vo4.member_img+"'/></div>"; //작성자이미지  vo4.member_img
		    					tag +="<div>";
		    					tag +="<div><label>"+ vo4.classqna_member_id+" | "+ vo4.classqna_writedate+" 작성</label></div>"; // 멤버아이디가 나일때 ->글 수정 삭제 버튼 보이게....    					
		    					tag += "<form method='post' >"
		    					tag +="<div><textarea name='classqna_content' style='width:640px;height:50px;resize:none;margin-left: 13px;'>"+ vo4.classqna_content+"</textarea>"; //내용	    					
		    					tag +="<label style='display:block;'><input type='submit' id='c"+vo4.class_qna_no+"' value='수정완료' class='edit' style='float:right;border-radius:7px;margin-left: 8px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;'>";
		    					tag +="<input type='hidden' name='class_qna_no' value='"+vo4.class_qna_no+"'>";
		    					tag +="</form>";
		    					tag +="<button  class='cancel' style='float:right;border-radius: 7px;float: right;font-size: 0.7rem;background-color: white;border: none;border: 1px solid #666; padding: 2px 5px 2px 5px;display:none;'>취소"; //display:none;
		    					tag +="<input type='hidden' value='"+vo4.class_qna_no+"'></button></label>";
		    					tag +="<label></label>";
		    					tag += "</div></div> ";
		    					tag += "</div> ";
			    				tag +="</li>";
			    				$("#creatormemberoneask").append(tag);    
			    				
			    				$('.more').show(); // 더보기 버튼 보이기
				                 if(idx >= aa.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
				                    $('.more').hide();
				                }
								
								
							}
							 
							 
							 
						 });
						
						
						
						
						
	    			});//each문
	    		}	    		
	    	});	    	
	    };	   
	  
	   function AskReply(no){
		  
		  	let imgSeting = document.querySelector('#creator-image-112').src;
		   //var creimg = ${vo.member_img }; //강사이미지
		   var rUrl ="/another/classDetailAskReplyList";
	       var rParam = {"no":no}  
	       
	       $.ajax({
	    		url:rUrl,
	    		data:rParam,
	    		success:function(b){
	    			var bb = $(b)
	    			var tag ="";	    			
	    							
	    			bb.each(function(idx,vo5){	    	
	    				//tag +="<div class='askdiv808'>";
	    				tag += "<div style='display:flex;width:12%;'><label style='display:block;width:20%;height:100%;vertical-align:middle;font-size:2rem;color:#666;'>↳</label><img src='"+imgSeting+"' style='width:80%'/></div> ";
	    				tag +="<div style='width:87%;'>";
	    				tag +="<div><label> "+ vo5.classqnacom_member_id +" | "+vo5.classqnacom_writedate +" 작성</label></div>";
	    				tag +="<div><label>"+vo5.classqnacom_reply +"</label></div>"; 
	    				//tag +="</div>";
	    				$("#"+no).html(tag);  
					});	    			
	    		}	    		
	    	})	   
	   } 
	//답글확인 클릭이벤트
	  $(document).on('click','#replyshow',function(){
		  var no = $(this).attr("class");
		  console.log(no);
		  console.log("답글확인클릭이벤트");
		  //클릭이 되면  class='askdiv808' 이고 id값이 r 인 div		 
		  	  $("#"+no).css('display','block');
			  AskReply(no);  
	  });
	   
	  //문의글작성 ajax
	  $(document).on('click','#replysub',function(){
		  var logid = "${userId}";//세션값에 저장된 로그id		  
		  if($("#classMainAskTa").val()==""){
				alert("댓글을 입력후 등록하세요");
		  }else if(logid=== null || logid=== ""){
			  	alert("로그인후 사용가능합니다")
		  }else{
				var params = $("#replyFrm").serialize();
				$.ajax({
					url:"/another/classDetailAskWritee",
					//type:"POST", //"POST","GET"
					data:params, //coment = gigigigi$no=34;
					success:function(result){ 
						if(result==0){
							alert("댓글등록실패하였습니다");
						}else{
							$("#classMainAskTa").val("");
							alert("댓글 등록 되었습니다");
							AskList(); 
						}
					},error:function(){
						console.log("문의글작성");
					}
				});
			}
	  });
	
	//결제
	$(document).on('click','#gopayB',function(){//select			
		var logid = "${userId}";    	
		if(logid=== null || logid=== ""){
			alert("로그인 후 이용가능합니다");
		}else{			
			if ($("input:checkbox[name='classNoPayList']").is(":checked")==false) {
				alert("적어도 하나는 선택하여 주십시오.");
				return;
			}
			 $("#payfrm").attr("action", "/another/PayPage");			
		     $("#payfrm").submit();
		}	 
	});	
	
	//장바구니
	$(document).on('click','#gobasketB',function(){//insert
		var logid = "${userId}";    	
		if(logid=== null || logid=== ""){
			alert("로그인 후 이용가능합니다");
		}else{
			if ($("input:checkbox[name='classNoPayList']").is(":checked")==false) {
				alert("적어도 하나는 선택하여 주십시오.");
				return;
			}	 			
			 $("#payfrm").attr("action", "/another/InsertBasketDB");			
		     $("#payfrm").submit();
		}		
	});		
	
	//delBtn 문의글삭제
	$(document).on('click','.delBtn',function(){	
		 if(confirm('댓글을 삭제하시겠습니까?')){
             var params = "no="+$(this).children("input").val();
             $.ajax({
               url : "/another/classAskDD", 
               data : params,
               success : function(result){
            	   if(result>0){
            		   alert('삭제되었습니다');
            		   AskList();
            	   }else{
            		   alert("글삭제 실패하였습니다.");
            	   }
               }
             });
          }
	});		
	//문의글수정폼 클릭
	$(document).on('click','.ediBtn',function(){	
		var a = $(this).children("input").val();
		console.log(a);
		$('#a'+a).css('display','none');
		$('#b'+a).css('display','block');
		
	});	
	//수정완료버튼 클릭시	
      $(document).on('submit','.editaskdiv909 form',function(){ 
         var url ="/another/classAskConEdit";
         var params = $(this).serialize(); 
         console.log('수정완료버튼클릭');
         $.ajax({
            url : url,
            data :params,
            type : "POST",
            success : function(result){
            	alert('수정되었습니다');
            	AskList(); 
            }
         });
         return false; 
      });
	
	
	
	$(document).on('click','#classcontent',function(){
		var offset = $("#d5").offset().top;	
		$('html, body').animate({scrollTop : offset-120}, 400);			
		$(this).css('border-bottom','3px solid #ff385c'); 		
		$('#d4 li').not(this).css('border-bottom','1px solid #ddd');	
	});		
	$(document).on('click','#creatorcontent',function(){			
		var offset2 = $("#d6").offset().top;
		$('html, body').animate({scrollTop : offset2-120}, 400);		
		$(this).css('border-bottom','3px solid #ff385c'); 			
		$('#d4 li').not(this).css('border-bottom','1px solid #ddd');	
	});		
	$(document).on('click','#classaddr',function(){			
		var offset3 = $("#d7").offset().top;
		$('html, body').animate({scrollTop : offset3-120}, 400);		
		$(this).css('border-bottom','3px solid #ff385c'); 	
		$('#d4 li').not(this).css('border-bottom','1px solid #ddd');	
	});	
	$(document).on('click','#review',function(){			
		var offset4 = $("#d8").offset().top;
		$('html, body').animate({scrollTop : offset4-120}, 400);		
		$(this).css('border-bottom','3px solid #ff385c'); 		
		$('#d4 li').not(this).css('border-bottom','1px solid #ddd');	
	});	
	$(document).on('click','#classqna',function(){			
		var offset5 = $("#d9").offset().top;
		$('html, body').animate({scrollTop : offset5-120}, 400);	
		$(this).css('border-bottom','3px solid #ff385c'); 	
		$('#d4 li').not(this).css('border-bottom','1px solid #ddd');	
	});	

	LikeCount(); 
	AskList();
	
	
});	

</script>

<div id="Bcotainer">
	<!--  -->
	<div id="leftdiv">
		<div id="calssintro"> <!-- 클래스대표사진+소개글 , 강사프로필+강사닉네임 -->	
			<div id="d1"><img src="${vo.class_thumb}"/></div> <!-- 클래스 이미지 -->
			<div id="d2"> <!-- 클래스 소개 -->
				<ul>
					<li>${vo.category_name }</li> <!-- 위치?대분류? --> <!-- 왼쪽정렬 -->
					<li>${vo.class_name }</li> <!-- 클래스 제목 -->
					<li>${vo.class_info }</li> <!-- 짧은 소개글 *******************pre-wrap 아직 미설정-->
					<li>						
						<div>
							<div><img id="likeimgbox2" src="img/jisu/ff385bigcheart.png"/><input type='hidden' id='likelikecountnum' value=''></div>
							<div id="likelikecount"></div> 
						</div>
					</li>
					<li><img src="img/jisu/smalllocation.png"/>${vo.class_addr1 }</li> <!-- 위치 -->
					<li style="display:none;"><div><input type="button" value="공유"/></div></li> <!-- 공유하기 -->
				</ul>
			</div> 
			<div id="d3"> <!-- 강사프로필 + 강사명 -->
				<div><img src="${vo.member_img}" id="creator-image-112"/></div> <!-- 강사프로필이미지 -->	
				<div> <!-- 강사닉네임 -->	
					<a href="#">${vo.nick }</a>
					<span>클래스 ${vo.creatorclasscount}개 | 좋아요 ${vo.creatorlikecount }개</span>
				</div>
			</div>
			<div id="d4"> <!-- 메뉴 -->					
				<ul class="menu_title_container">
					<li id="classcontent"  >클래스소개</li>
					<li id="creatorcontent" >강사소개</li>
					<li id="classaddr" >위치</li>
					<li id="review" >후기</li>
					<li id="classqna">문의</li>
				</ul>
			</div>			
			<div id="d5" class="menu"> <!-- 클래스소개 -->
				<div class="menutitle"><span>클래스소개</span></div>
				<div>		
					${vo.class_content }				
				</div>				
			</div>
			<div id="d6" class="menu"> <!-- 강사소개 -->
				<div class="menutitle"><span>강사소개</span></div>
				
					<c:set var="creatorimg" value="${vo.creator_content_img }" />	
					<c:if test="${!empty  creatorimg }"> <!-- 널값이아니면 셋팅 -->
					
						<div style='max-width:300px;max-height:300px;'><img src="${vo.creator_content_img }" style='max-width:300px;max-height:300px;object-fit:cover;'/></div>
					</c:if>
					<div>${vo.creator_content }</div>
				
			</div>
			<div id="d7" class="menu" style='border:none;'> <!-- 위치 -->
				<div class="menutitle"><span>위치</span></div>
				<div>${vo.class_addr1 }</div>
				<div style="width:100%;height:100%;">
					<div id="map" style="width:99%;height:400px;"></div>
					<!--
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af2fbed4f8b6d0f0e4535ecf4e023244"></script><!-- 카카오지도api 
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
					 -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af2fbed4f8b6d0f0e4535ecf4e023244&libraries=services"></script> 
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af2fbed4f8b6d0f0e4535ecf4e023244"></script>
					<script>
							var container = document.getElementById('map'); 
							var options = { 
								center: new kakao.maps.LatLng(33.450701, 126.570667), 
								level: 4 
							};
							var map = new kakao.maps.Map(container, options); 
							var geocoder = new kakao.maps.services.Geocoder();							
							geocoder.addressSearch( '${vo.class_addr1 }', function(result, status) {							    
							     if (status === kakao.maps.services.Status.OK) {						
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);							       
							        var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });											       
							        var infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.nick}</div>'
							        });
							        infowindow.open(map, marker);							       
							        map.setCenter(coords);
							    } 
							});  	
					</script>
				</div>
			</div>
			<!-- 후기 -->
			<%@ include file="review.jspf" %>	
				
			<div id="d9" class="menu" style='min-height:360px;'> <!-- 문의 -->
				<div class="menutitle"><span>문의</span></div>
				<div id="d9_2"><!-- 댓글내용 -->
					<ul id="creatormemberoneask">			
					</ul>	
					<!-- 더보기 버튼 -->
					<div class="more" style="display:none;text-align:center;">
      					<button type="button" id="morebtn">+ more</button>
   					</div>						
				</div>
				<div><!-- 댓글작성 -->
					<span>문의 내용 작성</span>
					<form method="post" id="replyFrm">
						<div><textarea name="classqna_content" id="classMainAskTa" placeholder="궁금하신 점 또는 클래스문의등을 자유롭게 작성해 주세요."></textarea></div><!-- classMainAskTa -->
						<input type="button" id="replysub" value="작성완료"/>
						<input type="hidden" name="class_no" value="${vo.class_no }"/><!-- 클래스 번호 --><!-- no -->
					</form>
				</div>
			</div>
		</div>		
	</div>
	<div id="rightdiv">
			<div id="rightConBox">
				<div id="datestr" style="display:none;"><input type="text" value=""/></div><!-- 선택한날짜입력 -->				
				<div id="calendardiv"><!-- 달력 -->					
					<div id="datepicker" class="datepicker"></div>
				</div>						
				<form method="post" id="payfrm" name="payfrm">
					<div id="selectdateBB" style="margin-top:10px;"><!-- 해당날짜에 선택된 강의옵션목록 -->
						<div  style="margin-top:10px;width:300px;color:#666;" id=>개설 된 클래스</div>						
						<div id="selectClassListd"  style="margin-top:10px;">						
						</div>
						<div id="result999"></div>
					</div>		
					<!--  장바구니,결제하기 -> 옵션클래스번호가지고이동  -->		
					<div id="buttonhomec"><input type="button" value="장바구니" id="gobasketB" style="border-radius:5px;"/><input type="button" value="클래스 신청하기" id="gopayB" style="border-radius:5px;"/></div>
				</form>
				<input type="text" id="inputdatebox" style="visibility:hidden;" />
			</div>
	</div>
</div>
