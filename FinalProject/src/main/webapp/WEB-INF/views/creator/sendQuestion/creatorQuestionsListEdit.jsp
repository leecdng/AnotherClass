<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
	/*제일겉에있는 Div*/
	#hQnAWriteD3{width:1200px;height:auto;margin:0 auto;}
	.hQnAT{width:100%;text-align:center;font-size:32px;font-weight: bold;color:#333;margin:40px 0 40px 0;}
	.hQnATWT3{width:100%;text-align:left;font-size:24px;font-weight: bold;color:#333;}
		
	
	#hQnATul2{width:100%;height:auto;margin:0 auto;overflow:auto;} /*border:1px solid black;*/
	#hQnATul2>li{width:100%;height:auto;float:left;display:flex;font-size:20px;margin:10px 0 10px 0;padding:8px 0px 15px 0px;;border-bottom:1px solid #ddd;}
	#hQnATul2>li>div:nth-child(1){width:15%;}
	#hQnATul2>li>div:nth-child(2){width:85%;}
	#hQnATul2>li:nth-child(1){border-top:3px solid #333;padding-top:8px;}
	#labelfolre1, #labelfolre2, #labelfolre3{background-color:rgb(125,125,125);color:white;padding:5px 8px 5px 8px;}
	#fue1 span{margin-left:40px;} #fue2 span{margin-left:40px;} #fue3 span{margin-left:40px;}
	#hQnAWriteFileedit1,#hQnAWriteFileedit2,#hQnAWriteFileedit3{display:none;}
	
	#hQnAWriteSubedit{width:90%;background-color:#f0f0f0;border:none;height:45px;font-size:1.2rem;}/*제목텍스트박스*/
	#hQnAWriteConedit{width:90%;min-height:500px;background-color:#f0f0f0;border:none;resize:none;overflow:auto;font-size:1.2rem;}/*문의내용텍스트아리아*/
	#hQnAWriteFileedit{display:none;}/*파일첨부*/
	#hQnAButedit{border:none;justify-content:center;}/*취소 수정 목록 버튼*/
	#hQnAWEditedit{margin:0 20px 0 20px;width:150px;height:50px;font-size:20px;}
	#hQnAeditSubmit{margin:0 20px 0 20px;width:150px;height:50px;font-size:20px;}
	
</style>
<script>
	
	$(()=>{
		$("#hQnAWriteFileedit1").change(function(event){
	    	var imageFile = event.target.files[0];
	        console.log(imageFile.name);
	        var reader = new FileReader();
	        reader.onload = (e) => {
				$("#fue1").children().attr("src", e.target.result);
	            $("#uploadede1").html(imageFile.name);	              
	        };
	           reader.readAsDataURL(imageFile);           
	    });		
	    $("#hQnAWriteFileedit2").change(function(event){
	    	var imageFile = event.target.files[0];
	        console.log(imageFile.name);
	        var reader = new FileReader();
	        reader.onload = (e) => {
				$("#fue2").children().attr("src", e.target.result);
	            $("#uploadede2").html(imageFile.name);	              
	        };
	           reader.readAsDataURL(imageFile);           
	    });
	    $("#hQnAWriteFileedit3").change(function(event){
	    	var imageFile = event.target.files[0];
	        console.log(imageFile.name);
	        var reader = new FileReader();
	        reader.onload = (e) => {
				$("#fue3").children().attr("src", e.target.result);
	            $("#uploadede3").html(imageFile.name);	              
	        };
	           reader.readAsDataURL(imageFile);           
	    });
		
		
		
		
		//수정 hQnAWEdit
		$("#hQnAeditSubmit").click(()=>{
			$("#homeQnAEFrm").attr("action", "/another/creator/CreatorQuestion/edit" );
			$("#homeQnAEFrm").submit();
		});
		
		//취소 -> 글목록으로이동
		$("#hQnAWEditedit").click(()=>{
			$("#homeQnAEFrm").attr("action", "/another/creator/CreatorQuestion/list" );
			$("#homeQnAEFrm").submit();
		});
		
		
		
	});
</script>
</head>
<body>
<div id="hQnAWriteD3">
	<div class="hQnAT">홈페이지문의</div> <!-- 페이지 타이틀 -->
	
		<div class="hQnATWT3">글수정</div>
		
		<form method="post" id="homeQnAEFrm">
	
			<ul id="hQnATul2">
				<li>
					<div>작성자</div>
					<div>${vo.member_id }</div>	
				</li>
				<li>
					<div>작성일자</div>
					<div>${vo.writedate }</div>	
				</li>
				<li>
					<div>제목</div>
					<div><input type="text" name="title" id="hQnAWriteSubedit" value="${vo.title }"></div>	
				</li>
				<li>
					<div>문의내용</div>
					<div><textarea name="content" id="hQnAWriteConedit">${vo.content }</textarea></div>	
				</li>
				<li id="fue1">
					<div>파일첨부</div>
					<div>
						<input type="file" name="file1" id="hQnAWriteFileedit1">
						<label for="hQnAWriteFileedit1" id="labelfolre1">파일선택</label><span id="uploadede1">${vo.file1 }</span>
					</div>	
				</li>
				<li id="fue2">
					<div>파일첨부</div>
					<div>
						<input type="file" name="file2" id="hQnAWriteFileedit2">
						<label for="hQnAWriteFileedit2" id="labelfolre2">파일선택</label><span id="uploadede2">${vo.file2 }</span>
					</div>	
				</li>
				<li id="fue3">
					<div>파일첨부</div>
					<div>
						<input type="file" name="file3" id="hQnAWriteFileedit3">
						<label for="hQnAWriteFileedit3" id="labelfolre3">파일선택</label><span id="uploadede3">${vo.file3 }</span>
					</div>	
				</li>
				<li>
					<div>답변여부</div>
					<c:set var="replycount" value="${vo.replycount}" />	
					<c:if test="${replycount eq 2}"> 
						<div>답변완료</div>					
					</c:if>
					<c:if test="${replycount eq 1}"> 
						<div>미답변</div>					
					</c:if>	
				</li>
				<li id="hQnAButedit">
					<input type="button" name="hQnAWEditedit" id="hQnAWEditedit" value="취소"/><input type="submit" name="hQnAWeditSubmit" id="hQnAeditSubmit" value="등록"/>
				</li>				
			</ul>
			
			   <input type="hidden" id="hiddennobox" name="user_qna_no" value="${vo.user_qna_no }"><!-- 글번호 -->
		</form>

</div>

