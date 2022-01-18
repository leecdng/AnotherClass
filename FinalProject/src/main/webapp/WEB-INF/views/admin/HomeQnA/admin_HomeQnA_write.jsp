<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	/*제일겉에있는 Div*/
	#adminQnAWriteContainter{width:1000px;height:auto;margin:0 auto;}
	
	
	#adminQnAWriteul{width:100%;height:auto;margin:0 auto;overflow:auto;} /*border:1px solid black;*/
	#adminQnAWriteul>li{width:100%;height:auto;float:left;display:flex;font-size:20px;margin:10px 0 10px 0;padding:8px 0px 15px 0px;;border-bottom:1px solid #ddd;}
	#adminQnAWriteul>li>div:nth-child(1){width:15%;}
	#adminQnAWriteul>li>div:nth-child(2){width:85%;}
	#adminQnAWriteul>li:nth-child(1){border-top:3px solid #333;padding-top:8px;}
	#adminQnAWriteul>li:nth-child(4)>div:nth-child(2)>label{background-color:rgb(125,125,125);color:white;padding:5px 8px 5px 8px;}
	
	#adminQnAWriteSub{width:90%;background-color:#ddd;border:none;height:35px;font-size:1.2rem;}/*제목텍스트박스*/
	#adminQnAWriteCon{width:90%;min-height:500px;background-color:#ddd;border:none;resize:none;overflow:auto;font-size:1.2rem;}/*문의내용텍스트아리아*/
	#adminQnAWriteFile,#adminQnAWriteFile2,#adminQnAWriteFile3{display:none;}/*파일첨부*/
	#adminQnAWriteBtn{border:none;justify-content:center;}/*취소 등록 버튼*/
	#adminQnAWriteCancel{margin:0 20px 0 20px;width:150px;height:50px;font-size:20px;}
	#adminQnAWriteSubmit{margin:0 20px 0 20px;width:150px;height:50px;font-size:20px;}
	
</style>

<div id="adminQnAWriteContainter">
		
		<div id='bbTitle' style='font-size:39px;margin-bottom:35px;'>클래스 고객문의 답변작성</div>
		<form action='<%=request.getContextPath()%>/admin/HomeQnA4'>
			<ul id="adminQnAWriteul">
				<li>
					<div style='height:62px;'>클래스문의 작성아이디</div>
					<div style='line-height:62px;'>${vo.member_id}</div>	
				</li>
				<li>
					<div>제목</div>
					<div><input type="text" name="title" id="adminQnAWriteSub" ></div>	
				</li>
				<li>
					<div>문의내용</div>
					<div><textarea name="content" id="adminQnAWriteCon"></textarea></div>	
				</li>
			
				<li id="adminQnAWriteBtn">
				<input type="button" name="adminQnAWriteCancel" id="adminQnAWriteCancel" value="취소"/><input type="submit" name="adminQnAWriteSubmit" id="adminQnAWriteSubmit" value="등록"/>
				</li>							
			</ul>
			<input type="hidden" name="user_qna_no" value="${vo.user_qna_no }">
		</form>
		
</div>
