<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	
	#adminQnAContainter{width:1000px;height:auto;margin:0 auto;}/*모든걸 감싸고 있는 제일큰div*/	
	/*리스트*/	
	#adminQnAListUl a:link, a:visited{text-decoration:none;color:#333;}
	#adminQnAListUl a:hover{color:#ff385c;}	
	#adminQnAList{width:100%;height:auto;margin:0 auto;overflow:auto;}
	#adminQnAListUl{width:100%;text-align:center;}
	#adminQnAListUl>li{float:left;width:10%;margin:7px 0 7px 0;border-bottom:1px solid #ddd;padding-bottom:7px;height:40px;}
	#adminQnAListUl>li:nth-child(5n+1){width:10%}
	#adminQnAListUl>li:nth-child(5n+2){width:56%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;text-align:left;}
	#adminQnAListUl>li:nth-child(5n+4){width:14%}	
	.adminQnAListli{border-bottom:1px solid black;margin-top:10px;padding:8px 0 8px 0;background-color:#ddd;font-weight:bold;} /*리스트타이틀*/	
	.replySubject{text-align:left;}/*답글 제목*/
	
	.paging{display:flex;justify-content:center;margin:30px 0;font-size:1.2em;}
    .paging>li{margin:0 10px;}
    .now>a{font-weight:bold;text-decoration:underline solid  2px #ff385c;color:#382E2C;font-size:1.1em}
	
</style>

<div id="adminQnAContainter">
	
	
	<div id="adminQnAList"> <!-- 게시판리스트 -->
			<div id='bbTitle' style='font-size:28px;'>홈페이지 고객 문의</div>
		
			<div style='height:40px;text-align: right;'>
				<form method="get" id="searchFrm" action="<%=request.getContextPath()%>/admin/HomeQnA" style='height:30px;'>
				   <select name="searchKey" style='height:30px;'>
				      <option value="title">제목</option>
				      <option value="content">글내용</option>
				      <option value="member_id">작성자</option>
				   </select>
				   <input type="text" name="searchWord" id="searchWord" style='height:30px;margin: 0 5px;'/>
				   <input type="submit" value="Search" style='height:30px;background: #ff385c;border: none;color: white;padding: 0 8px;border-radius: 7px;'/>
				</form>
			</div>
		
		
		
		
			<ul id="adminQnAListUl">
				<li  class="adminQnAListli">No.</li>
				<li  class="adminQnAListli" style="text-align:center">글제목</li>
				<li  class="adminQnAListli">작성자</li>
				<li  class="adminQnAListli">작성일자</li>
				<li  class="adminQnAListli">답변여부</li>
				
			<c:forEach var="vo" items="${list}">	
			
					<!-- 글번호 -->
					<c:set var="board_no2" value="${vo.board_no2}" />	
					<c:if test="${board_no2 eq 0 }"> 
						<li class="hQnAListFli10 hQnAListFli101">${vo.user_qna_no}</li>
					</c:if>
					<c:if test="${board_no2 eq 1 }"> 
						<li class="hQnAListFli10 hQnAListFli101"><label style="visibility:hidden;">${vo.user_qna_no}</label></li>
					</c:if>
					<c:if test="${board_no2 eq 0 }">
						<li>
							<a href="<%=request.getContextPath()%>/admin/HomeQnA2?no=${vo.user_qna_no}" style='cursor:pointer;'>${vo.title }</a>
							<input type="hidden" value="${vo.user_qna_no}">	
						</li>
					</c:if>
					<c:if test="${board_no2 eq 1 }">
						<li>
							<a href="<%=request.getContextPath()%>/admin/HomeQnA2?no=${vo.user_qna_no}" style='cursor:pointer;'>&ensp;&ensp;&ensp;<label style="color:blue;">[Re]</label>답변입니다</a>
							<input type="hidden" value="${vo.user_qna_no}">	
						</li>
					</c:if>
					<li>${vo.member_id }</li>
					<li>${vo.writedate }</li>
					
					
					<c:set var="replycount" value="${vo.replycount}" />							
					<c:if test="${replycount eq 2 && board_no2 eq 0 }"> 
						<li>답변완료</li>
					</c:if>
					<c:if test="${replycount eq 2 && board_no2 eq 1 }"> 
						<li></li>
					</c:if>
					<c:if test="${replycount eq 1}"> 
						<li>미답변</li>
					</c:if>
					
			</c:forEach> 	
		
			</ul>
		
			
	
	</div>
<!-- 페이징 -->
			<div style='height:auto;'>
			<ul class="paging">
			         <c:if test="${pVo.nowPage>1}">
			            <li><a href="<%=request.getContextPath()%>/admin/HomeQnA?nowPage=${pVo.nowPage-1}<c:if test='${searchWord != null && pVo.searchKey!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchKeyword}</c:if>" class="fas fa-angle-left">Prev</a>
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
			            <a href="<%=request.getContextPath()%>/admin/HomeQnA?nowPage=${i}<c:if test='${searchWord != null && pVo.searchKey!=null }'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">${i}</a>
			         </c:if>
			         
			         </c:forEach>
			         <c:if test="${pVo.nowPage<pVo.totalPage}">
			            <li class='page-item'><a href="<%=request.getContextPath()%>/admin/HomeQnA?nowPage=${pVo.nowPage+1 }<c:if test='${searchWord != null && pVo.searchKey!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>" class="fas fa-angle-right">Next</a></li>
			         </c:if>   
		      </ul>
			</div>

</div>
