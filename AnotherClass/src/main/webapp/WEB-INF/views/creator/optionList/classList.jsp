<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	

	#classListContainter{width:1200px;height:100%;margin:0 auto;} /*모든걸 감싸고 있는 div*/
	
	#classListSearchDiv{width:100%;margin-bottom:20px;}/*클래스 리스트 검색*/
	#classListSubmit{padding:3px 7px 3px 7px;background-color:white;color:#333;border:1px solid #333;}
	
	#classListDiv{width:100%;height:auto;} /*리스트 목록Div*/
	
	.classListUl{width:100%;height:auto;overflow:auto;}/*리스트 목록Ul*/	
	.classListUl>li{width:100%;overflow:auto;padding:10px 0 10px 0;}
	
	/*리스트 타이틀*/	
	#classListFirstLi{border-bottom:2px solid #666;} 
	#classListFirstLi>span{display:block;float:left;}/*리스트 타이틀*/
	#classListFirstLi>span:nth-child(1){width:10%;text-align:center;}
	#classListFirstLi>span:nth-child(2){width:60%;text-align:center;}
	#classListFirstLi>span:nth-child(3){width:15%;text-align:center;}
	#classListFirstLi>span:nth-child(4){width:15%;text-align:center;}
	/*리스트 리스트*/	
	.classListUl2{width:100%;height:auto;}/*리스트 목록Ul*/	
	.classListUl2>li{width:100%;height:180px;padding:15px 0 15px 0;border-bottom:1px solid #ddd;}
	.classListUl2>li>span{display:block;height:100%;float:left;}
	.classListUl2>li>span:nth-child(4n+1){width:10%;text-align:center;line-height:150px;}/*클래스번호*/
	.classListUl2>li>span:nth-child(4n+2){width:60%;}/*클래스정보 : 이미지+클래스상세정보*/
	.classListUl2>li>span:nth-child(4n+2)>span{float:left;height:100%;}
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(1){width:40%;height:100%;}/*클래스이미지*/
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(1)>img{width:90%;height:100%;object-fit:fill;text-align:center;}
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(2){width:60%;height:100%;}/*클래스상세정보*/
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(2)>span{display:block;width:100%;}
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(2)>span:nth-child(1){margin:10px 0 35px 0;font-size:1.1rem;font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}/*클래스명*/
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(2)>span:nth-child(2){margin-bottom:5px;}
	.classListUl2>li>span:nth-child(4n+2)>span:nth-child(2)>span:nth-child(3){margin-bottom:5px;}
	.classListUl2>li>span:nth-child(4n+3){width:15%;text-align:center;line-height:150px;font-size:1.1rem;}
	.classListUl2>li>span:nth-child(4n+4){width:15%;text-align:center;height:100%;}
	.classListUl2>li>span:nth-child(4n+4)>span{display:block;width:90%;border:0.7px solid #666;}
	.classListUl2>li>span:nth-child(4n+4)>span:nth-child(1){margin-top:45px;padding:5px;}
	.classListUl2>li>span:nth-child(4n+4)>span:nth-child(2){margin-top:7px;padding:5px;}
	
	.classListUl2 a:link, .classListUl2 a:visited{text-decoration:none; color:#333;}	
	.classListUl2 a:hover{color:#ff385c;}
	
	.menu_title>a {
	    font-size: 1.2em;
	    font-weight: bold;
	    color: rgb(248,248,248);
	}
	
	.menu_box .menu_title>ul>li>a.small-menu {
	    color: rgb(248,248,248);
	}
</style>
<script>
	$(function(){
		$('#classListSubmit').on({
			mouseenter:function(){
				//마우스오버가 발생하면 실행할 실행문
				$(this).css('color','#ff385c');
			},
			mouseleave:function(){
				$(this).css('color','#333');
			}			
		});
</script>


<div id="classListContainter">
	
	<div id="classListSearchDiv"><!-- 클래스번호검생창 -->
		<form method="get" id="classListSearchFrm" action="#">
			
			<select name="classListSearchKey">
				<option value="className">클래스명</option>
				<option value="creatorName">크리에이터명</option>
				<option value="classNum">클래스번호</option>
			</select>		
		
			 <input type="text" name="classListSearchWord" id="classListSearchWord"/>  		    
  		     <input type="submit" value="Search" id="classListSubmit"/>
  		     
		</form>
	</div>
	
	<div id="classListDiv"><!-- 검색한 리스트 목록 -->
		<ul class="classListUl">	<!-- 리스트타이틀 -->		
			<li id="classListFirstLi">
				<span>클래스번호</span>
				<span>클래스명</span>
				<span>진행상황</span>
				<span>선택</span>
			</li>
		</ul>
		
		<span style="display:block;visivillity:hidden;height:2px;width:100px;"></span> <!-- 겹쳐서 간격안맞는 부분을 위해 만든 히든디브 -->
		
		<ul class="classListUl2"><!--  리스트 -->			
			<c:forEach var="vo" items="${list}">	
			<li> <!-- ***클래스한줄*** -->
				<span id="classno">${vo.class_no}</span><!-- 클래스번호 -->
				<span><!-- 클래스명 + 상세정보-->
					<span><img src="${vo.class_thumb}"/></span><!-- 클래스명 -->
					<span><!-- 상세정보 -->
						<span>${vo.class_name}</span>
						

						<span><a href="">고객후기</a><label>${vo.classclasscount}건</label></span> <!-- 후기관리페이지로 이동 -->
						<span><a href="">좋아요${vo.classlikecount}개</a></span> <!-- ?좋아요한회원목록... -->
					</span>					
				</span>
				<span>진행중</span><!-- 진행상황 -->
				<span><!-- ?no=$-->
					<span><a href="<%=request.getContextPath()%>/creator/modifyClass?no=${vo.class_no}">클래스 수정</a></span>
					<span><a href="<%=request.getContextPath()%>/creator/deleteClass?no=${vo.class_no}">클래스 삭제</a></span>
				</span>
			
			</li>
			</c:forEach>
		
			
			
		</ul>
		
	</div>
	


</div>
				


