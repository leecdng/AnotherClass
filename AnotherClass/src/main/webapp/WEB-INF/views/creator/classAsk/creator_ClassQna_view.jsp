<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	/*제일겉에있는 Div*/
	#cQnAWriteD20{width:1200px;height:auto;margin:0 auto;}
	.cQnAT{width:100%;text-align:center;font-size:32px;font-weight: bold;color:#333;margin:40px 0 40px 0;}
	.cQnATWT20{width:100%;text-align:left;font-size:30px;font-weight: bold;color:#333;margin: 40px 0 20px 0;}	
	#cQnATWT20 ul,li{margin:0;padding:0;list-style-type:none;}
	#cQnATul{width:100%;height:auto;margin:0 auto;overflow:auto;} /*border:1px solid black;*/
	#cQnATul>li{width:100%;height:auto;float:left;display:flex;font-size:20px;margin:10px 0 10px 0;padding:8px 0px 15px 0px;;border-bottom:1px solid #ddd;}
	#cQnATul>li>div:nth-child(1){width:15%;}
	#cQnATul>li>div:nth-child(2){width:85%;}
	#cQnATul>li:nth-child(1){border-top:3px solid #333;padding-top:8px;}
	#labelforv1, #labelforv2, #labelforv3{background-color:rgb(125,125,125);color:white;padding:5px 8px 5px 8px;}	
	#cQnAWriteSubview{width:90%;background-color:#fff;border:none;height:45px;font-size:1.2rem;}/*제목텍스트박스*/
	#cQnAWriteConview{width:90%;min-height:300px;background-color:#f0f0f0;border:none;resize:none;overflow:auto;font-size:1.2rem;}/*문의내용텍스트아리아*/
	/*파일첨부*/
	#cQnAButview{border:none;justify-content:center;}/*취소 수정 목록 버튼*/
	#cQnAWList {margin:45px 0 20px 504px;width:150px;height:50px;font-size:20px;}	
	#classMainAskTa{width:90%;height:130px;resize:none;overflow:auto;border-color:#ddd;}/*댓글작성하는부분*/
	#replysub{margin: 10px 0 15px 1040px;background-color:white;border:none;border:1px solid #999;width:100px;padding-top:5px;padding-bottom:5px;}
	#cQnAWriteConviewReply{width:90%;min-height:150px;background-color:#f0f0f0;border:none;resize:none;overflow:auto;font-size:1.2rem;}
</style>

<script>
$(()=>{		
		
	
	var a = ${vo.replycheck}
	
	function AskReply(){
		
		
		var rUrl ="/another/creatorAskReplyList";
		var rParam = "no=${vo.class_qna_no}";
			$.ajax({
				
		    	url:rUrl,
		    	data:rParam,
		    	success:function(b){
		    	var bb = $(b)
		    	
		    	var tag ="";	    		    								
		    	bb.each(function(idx,vo2){
		    		tag +="<div id='aa'>";
		    		tag +="<div style='width:100%;'>";
					tag +="<div style='margin-bottom:10px;'>댓글</div>";	  
					tag +="	<textarea  id='cQnAWriteConviewReply' readonly disabled style='width:91%;padding-left: 20px;padding-top:14px;'>"+vo2.classqnacom_reply+"</textarea>";
					tag +="<div style='text-align:right;width:90%;'>"
					tag +="<button id='ediBtn' style='background:#ff385c;color:#fff;border:none;border-radius:5px;padding:3px 14px;margin:3px 7px 0 0;font-size:15px;'>수정</button>	";
		    		tag +="<button id='delBtn' style='background:#ff385c;color:#fff;border:none;border-radius:5px;padding:3px 14px;margin-top:3px;font-size:15px;'>삭제";
		    		tag +="<input type='hidden' value='"+vo2.class_qna_com_no+"'></button>	"
		    		tag +="</div></div></div>";
		    		
		    		//수정폼
		    		tag +="<li id='bb' style='display:none'>";
		    		tag +="<div style='width:100%;'>";
		    		tag +="<div style='margin-bottom:10px;'>댓글수정</div>";
		    		tag +="<form id='bbFrm'>";
		    		tag +="<textarea  id='cQnAWriteConviewReply' style='width:91%;padding-left: 20px;padding-top:14px;' name='classqnacom_reply'>"+vo2.classqnacom_reply+"</textarea>";
		    		tag +="<div style='text-align:right;width:90%;'>";
		    		tag +="<button style='height:auto;background:#ff385c;color:#fff;border:none;border-radius:5px;padding:3px 14px;margin-top:3px;font-size:15px;'>수정완료</button>";
		    		tag +="<input type='hidden' name='class_qna_no' value='"+vo2.class_qna_no+"'>"
		    		tag +="</div></form></div></div>";	
		    		
		    		if(a>=1){//답변이있을때
		    			$("#replyDivv").html(tag);  
		    		}
		    	});	    			
		    }	    		
		})	 	    	
	} 
	
	//문의글수정폼 클릭
	$(document).on('click','#ediBtn',function(){	
		
		$('#aa').css('display','none');
		$('#bb').css('display','block');
		
	});	
	
	//수정완료버튼 클릭시	
    $(document).on('submit','#bbFrm',function(){ 
       var url ="/another/creatorAskReplyListEdit";
       var params = $(this).serialize(); 
     
       $.ajax({
          url : url,
          data :params,
          type : "POST",
          success : function(result){
          	alert('수정되었습니다');
          	AskReply();
          }
       });
       return false; 
    });	
  //delBtn 문의글삭제
	$(document).on('click','#delBtn',function(){	
		 
		if(confirm('댓글을 삭제하시겠습니까?')){
			 //class_qna_com_no
             var params = "no="+$(this).children("input").val();
			
             $.ajax({
               url : "/another/creatorAskReplyDel", 
               data : params,
               success : function(result){
            	  
            		   alert('삭제되었습니다');
            		   $( "#replyDivv" ).empty();	
	           		   	 
            		  
            	  
               }
             });
          }
	});		
	
	//댓글작성 ajax
	  $(document).on('click','#replysub',function(){
	
				var params = $("#replyFrm").serialize();
				$.ajax({
					url:"/another/creatorAskReplyWritee",					
					data:params, 
					success:function(result){ 
					
							$("#classMainAskTa").val("");
							alert("댓글 등록 되었습니다");
							a = 1;
							AskReply();
						
					},error:function(){
						
					}
				});
			
	  });
	
	
	
	
	
	
	
	
	AskReply();
		
});
</script>


<div id="cQnAWriteD20">
		<div class="cQnATWT20" >클래스문의글보기</div>		
			<ul id="cQnATul">
				<li>
					<div>작성자</div>
					<div>${vo.classqna_member_id }</div>	
				</li>
				<li>
					<div>작성일자</div>
					<div>${vo.classqna_writedate }</div>	
				</li>
				<li>
					<div>클래스명</div>
					<div><input type="text"  id="cQnAWriteSubview" readonly disabled value="${vo.class_name }"></div>	
				</li>				
				<li>
					<div>문의내용</div>
					<div><textarea  id="cQnAWriteConview" readonly disabled >${vo.classqna_content }</textarea></div>	
				</li>			
			</ul>
			<div id="replyDivv">					
			</div>			
			
			<div style='border:1px solid #ddd;margin-top:100px;width:100%;'> <!-- 댓글작성 -->
					<span style='display: inline-block;margin: 18px 20px 15px 43px;'>문의 내용 댓글작성</span>
					<form method="post" id="replyFrm">
						<div style='text-align:center;'><textarea name="classqnacom_reply" id="classMainAskTa" placeholder="궁금하신 점 또는 클래스문의등을 자유롭게 작성해 주세요."></textarea></div><!-- classMainAskTa -->
						<input type="button" id="replysub" value="작성완료"/>
						<input type="hidden" name="class_qna_no" value="${vo.class_qna_no }"/><!-- 클래스 번호 --><!-- no -->
						<input type="hidden" name="classqnacom_member_id" value="${creatorId}"/>
					</form>
			</div>			
			
			<div id="cQnAButview">				
					<button id="cQnAWList" onclick="location.href='classAskManage';" style="background-color: #ff385c;color:#fff;border: none;border-radius: 5px;">목록</button>
			</div>
			<div style="display:none">${vo.class_qna_no }</div><!-- 글번호 -->
			
</div>
