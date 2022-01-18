<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	
	#cQnAD{width:1200px;height:auto;margin:0 auto}/*;*/
	.cQnAT{width:100%;text-align:left;font-size:32px;font-weight: bold;color:#333;margin-top:20px;}/*margin:40px 0 40px 0;*/
	
	/*리스트*/

	#cQnWrite{width:100%;margin:0 auto;}
	#cQnAList{width:100%;height:auto;margin:0 auto;overflow:auto;}
	#cQnAListUl{width:100%;text-align:center;height:auto;overflow:auto;}
	
	.cQnAListFli10,.cQnAListFli{float:left;width:10%;height:60px;line-height:60px;border-bottom:1px solid #ddd;}
	.cQnAListFli1,.cQnAListFli101{width:10%} /*클래스번호 넣을거면 7로변경*/
	.cQnAListFli2,.cQnAListFli102{width:56%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;text-align:left;}
	.cQnAListFli4,.cQnAListFli104{width:14%}/*클래스번호 넣을거면 14로변경*/
	
	.cQnAListFli{border-bottom:1px solid black;margin-top:10px;background-color:#f0f0f0;font-weight:bold;font-size:1.1rem;} /*리스트타이틀*/	

	#cQnWrite{height:auto;text-align:right;margin-bottom:15px;margin-top:10px;padding-right:7px;}/*글쓰기 버튼div*/
	#cQnWritelab{padding:5px 22px 5px 22px;background-color:#ff385c;font-size:18px;border-radius:5px;}/*글쓰기 버튼div*/

	.replySubject{text-align:left;}	
	
	.cQnAList-button>a:hover{color:ff385c;}
	.cQnAList-button>a:active{color:ff385c;}
	
	
	.paging{display:flex;justify-content:center;margin:30px 0;font-size:1.2em;}
    .paging>li{margin:0 10px;}
    .now>a{font-weight:bold;text-decoration:underline solid #00A3EF;color:#382E2C;font-size:1.1em}
	
</style>
<script>


</script>
<!-- class_qna_no, class_no, classQna_member_id, classqna_content, to_char(a.classqna_writedate,'YY-MM-DD') classqna_writedate, class_name -->
	
	
	<div id="cQnAD">
	<div class="cQnAT">클래스문의</div> <!-- 페이지 타이틀 -->
	
	<div id="cQnWrite"><!-- 검색 -->
		<form method="post" action="classAskManage" id="listform">
			<div>         
	            <input type="text" id="searchWord" name="searchWord" placeholder="클래스명을 입력해 주세요." style="padding-left: 16px;border-radius: 19px;height: 39px;margin-right: 24px;"/><button id="cQnWritelab" style="border:none;color:white;">검색</button>       
	         </div>	
			
		</form> 
	</div> 
	
	<div id="cQnAList"> <!-- 게시판리스트 -->
		<ul id="cQnAListUl">
			<li  class="cQnAListFli cQnAListFli1">No.</li>
			<!-- <li  class="hQnAListFli hQnAListFli1">클래스번호</li> -->
			<li  class="cQnAListFli cQnAListFli2" style="text-align:center">클래스명</li>
			<li  class="cQnAListFli cQnAListFli3">작성자</li>
			<li  class="cQnAListFli cQnAListFli4">작성일자</li>
			<li  class="cQnAListFli cQnAListFli5">답변여부</li>
		
		<c:forEach var="vo" items="${list }">	
		
			<!-- 글번호 -->
			
			<li class="cQnAListFli10 cQnAListFli101">${vo.class_qna_no}</li>			
			
			<li class="cQnAListFli10 cQnAListFli102" style='text-align:center;'>
				<a href="<%=request.getContextPath()%>/creator/classAskManage2?no=${vo.class_qna_no}" style='cursor:pointer;'>${vo.class_name}</a>
				<input type="hidden" value="${vo.class_no}">
			</li>
	
		
			<li class="cQnAListFli10 cQnAListFli103">${vo.classqna_member_id }</li>
			<li class="cQnAListFli10 cQnAListFli104">${vo.classqna_writedate}</li>
			
			
			
			
			<c:set var="replycount" value="${vo.replycheck}" />							
			<c:if test="${replycount eq 0 }"> 
				<li class="cQnAListFli10 cQnAListFli105">미답변</li>
			</c:if>
			<c:if test="${replycount ne 0 }"> 
				<li class="cQnAListFli10 cQnAListFli105">답변</li>
			</c:if>
		
			
		</c:forEach>
		</ul>
			<div class="hQnAList-button" style='text-align:center;margin-top:50px;'>
				<!-- 페이징 -->
			</div>
			
		<!-- 페이징 -->
		<ul class="paging">
         <c:if test="${pVo.nowPage>1}">
            <li><a href="<%=request.getContextPath()%>/creator/classAskManage?nowPage=${pVo.nowPage-1}<c:if test='${searchWord != null}'>&searchWord=${pVo.searchKeyword}</c:if>" class="fas fa-angle-left">Prev</a>
         </c:if>
         <c:if test="${pVo.nowPage==1}">
      		<li class='page-item'><a href="#" class='page-link'>Prev</a></li>
      	</c:if>
      
      <!-- 시작페이지부터 5개의 페이지를 출력한다. -->
         <!-- 6,7,8,9,10 -->
         <c:forEach var="i" begin="${pVo.startPage }" end="${pVo.startPage+pVo.onePageNumCount-1 }">
         <!-- 출력할 페이지번호 총페이지수보다 작을때만 출력한다. -->
         <c:if test="${i<=pVo.totalPage }">
            <c:if test="${i==pVo.nowPage }">
               <li class="now">
            </c:if>
            <c:if test="${i!=pVo.nowPage }">
               <li>
            </c:if>
            <a href="<%=request.getContextPath()%>/creator/classAskManage?nowPage=${i}<c:if test='${searchWord != null}'>&searchWord=${pVo.searchWord}</c:if>">${i}</a>
         </c:if>
         
         </c:forEach>
         <c:if test="${pVo.nowPage<pVo.totalPage}">
            <li class='page-item'><a href="<%=request.getContextPath()%>/creator/classAskManage?nowPage=${pVo.nowPage+1 }<c:if test='${searchWord != null}'>&searchWord=${pVo.searchWord}</c:if>" class="fas fa-angle-right">Next</a></li>
         </c:if>   
      </ul>

		
		
	</div>
	
</div>
