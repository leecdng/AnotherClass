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
	#cQnATul>>li:nth-child(1){border-top:3px solid #333;padding-top:8px;}
	#labelforv1, #labelforv2, #labelforv3{background-color:rgb(125,125,125);color:white;padding:5px 8px 5px 8px;}

	
	
	#cQnAWriteSubview{width:90%;background-color:#fff;border:none;height:45px;font-size:1.2rem;}/*제목텍스트박스*/
	#cQnAWriteConview{width:90%;min-height:300px;background-color:#f0f0f0;border:none;resize:none;overflow:auto;font-size:1.2rem;}/*문의내용텍스트아리아*/
	/*파일첨부*/
	#cQnAButview{border:none;justify-content:center;}/*취소 수정 목록 버튼*/
	#cQnAWList {margin:30px 20px 30px 0;width:150px;height:50px;font-size:20px;}
	
	
	#classMainAskTa{width:90%;height:130px;resize:none;overflow:auto;border-color:#ddd;}/*댓글작성하는부분*/
	#replysub{margin: 10px 0 15px 1057px;background-color:white;border:none;border:1px solid #999;width:100px;padding-top:5px;padding-bottom:5px;}
	#cQnAWriteConviewReply{width:90%;min-height:150px;background-color:#f0f0f0;border:none;resize:none;overflow:auto;font-size:1.2rem;}
</style>
<script>
	$(()=>{		
		
		
		
		
	});
</script>


<div id="cQnAWriteD20">
	<!-- <div class="hQnAT">클래스문의</div> <!-- 페이지 타이틀 -->
	
		<div class="cQnATWT20" >홈페이지문의글보기</div>
		<c:set var="board_no2" value="${vo.board_no2}" />
		
			<ul id="cQnATul">
				<li>
					<div>작성자</div>
					<div>${vo.member_id }</div>	
				</li>
				<li>
					<div>작성일자</div>
					<div>${vo.writedate }</div>	
				</li>
				<c:if test="${board_no2 eq 0 }">
				<li>
					<div>제목</div>
					<div><input type="text"  id="cQnAWriteSubview" readonly disabled value="${vo.title }"></div>	
				</li>
				</c:if>
				<c:if test="${board_no2 eq 1 }">
				<li>
					<div>제목</div>
					<div><input type="text"  id="cQnAWriteSubview" readonly disabled value="답변입니다"></div>	
				</li>
				</c:if>
				<c:if test="${board_no2 eq 0 }">
				<li>
					<div>문의내용</div>
					<div><textarea  id="cQnAWriteConview" readonly disabled >${vo.content }</textarea></div>	
				</li>
				</c:if>
				<c:if test="${board_no2 eq 1 }">
				<li>
					<div>답변내용</div>
					<div><textarea  id="cQnAWriteConview" readonly disabled >${vo.content }</textarea></div>	
				</li>
				</c:if>
				
				<!-- 답변 -->
					
				
			<div id="cQnAButview">				
			<!-- onclick="location.href='/HomeQnA';" -->
					<input type="button" name="cQnAWList" id="cQnAWList" style='margin-left:405px' onclick="location.href='<%=request.getContextPath()%>/admin/HomeQnA';" value="목록"/>
					
				
					<input type="button" name="cQnAWListc" style='width:150px;height: 50px;font-size: 20px' id="cQnAWListt"  onclick="location.href='<%=request.getContextPath()%>/admin/HomeQnA3?no=${vo.user_qna_no}';" value="답글달기"/>
					
			</div>
				
			
			<div style="display:none">${vo.user_qna_no }</div><!-- 글번호 -->
			
</div>
