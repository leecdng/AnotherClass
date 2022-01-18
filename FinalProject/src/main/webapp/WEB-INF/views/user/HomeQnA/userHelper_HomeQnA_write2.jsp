<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	/*제일겉에있는 Div*/
	#hQnAWriteD33{width:1200px;height:auto;margin:0 auto;}
	.hQnAT{width:100%;text-align:center;font-size:32px;font-weight: bold;color:#333;margin:40px 0 40px 0;}
	.hQnATWT{width:100%;text-align:left;font-size:24px;font-weight: bold;color:#333;margin-left:8px;}
		
	#hQnAWriteD33ul{width:100%;height:auto;margin:0 auto;overflow:auto;} /*border:1px solid black;*/
	#hQnAWriteD33ul>li{width:100%;height:auto;float:left;display:flex;font-size:20px;margin:10px 0 10px 0;padding:8px 0px 15px 0px;;border-bottom:1px solid #ddd;}
	#hQnAWriteD33ul>li>div:nth-child(1){width:15%;}
	#hQnAWriteD33ul>li>div:nth-child(2){width:85%;}
	#hQnAWriteD33ul>li:nth-child(1){border-top:3px solid #333;padding-top:8px;}
	#labelfor1, #labelfor2, #labelfor3{background-color:rgb(125,125,125);color:white;padding:5px 8px 5px 8px;}
	#fu span{margin-left:40px;} #fu2 span{margin-left:40px;} #fu3 span{margin-left:40px;}
	
	#hQnAWriteSub{width:90%;background-color:#f0f0f0;border:none;height:45px;font-size:1.2rem;}/*제목텍스트박스*/
	#hQnAWriteCon{width:90%;min-height:500px;background-color:#f0f0f0;border:none;resize:none;overflow:auto;font-size:1.2rem;}/*문의내용텍스트아리아*/
	#hQnAWriteFile,#hQnAWriteFile2,#hQnAWriteFile3{display:none;}/*파일첨부*/
	#hQnABut{border:none;justify-content:center;}/*취소 등록 버튼*/
	#hQnAWCan6{margin:0 20px 0 20px;width:150px;height:50px;font-size:20px;}
	#hQnAWSubmit9{margin:0 20px 0 20px;width:150px;height:50px;font-size:20px;}
	
</style>
<script>
var serverName = '<%=request.getServerName() %>';
var serverPort = <%=request.getServerPort() %>;

	$(()=>{
		
	    $("#hQnAWriteFile").change(function(event){
	    	var imageFile = event.target.files[0];
	        console.log(imageFile.name);
	        var reader = new FileReader();
	        reader.onload = (e) => {
				$("#fu").children().attr("src", e.target.result);
	            $("#uploaded").html(imageFile.name);	              
	        };
	           reader.readAsDataURL(imageFile);           
	    });		
	    $("#hQnAWriteFile2").change(function(event){
	    	var imageFile = event.target.files[0];
	        console.log(imageFile.name);
	        var reader = new FileReader();
	        reader.onload = (e) => {
				$("#fu2").children().attr("src", e.target.result);
	            $("#uploaded2").html(imageFile.name);	              
	        };
	           reader.readAsDataURL(imageFile);           
	    });
	    $("#hQnAWriteFile3").change(function(event){
	    	var imageFile = event.target.files[0];
	        console.log(imageFile.name);
	        var reader = new FileReader();
	        reader.onload = (e) => {
				$("#fu3").children().attr("src", e.target.result);
	            $("#uploaded3").html(imageFile.name);	              
	        };
	           reader.readAsDataURL(imageFile);           
	    });
	    
	    
		$("#hQnAWCan6").click(()=>{//취소버큰 클릭 -> 목록으로돌아가기
			$("#hQnAWriteD33ulFrm").attr("action", "/another/HomeQnAAsk/list" );
			$("#hQnAWriteD33ulFrm").submit();			
		});
		
		$("#hQnAWSubmit9").click(()=>{//등록		
			$("#hQnAWriteD33ulFrm").attr("action", "/another/HomeQnAAsk/writeOk" );
			$("#hQnAWriteD33ulFrm").submit();			
		});
		
		/////////////사진첨부
		var fileList;
		$(document).on('change','#hQnAWriteFile', function uploadFiles(e){
				var file = $('#hQnAWriteFile')[0].files[0]
				var form_data = new FormData();
		      	form_data.append('file', file);
		      	$.ajax({
		        	data: form_data
		        	,type: "POST"
		        	,url: '/another/FileUpload/imageUploadUrl'
		        	,contentType: false
		        	,processData: false
		        	,success: function(imageData) {
		        		console.log("img:"+ imageData.url);
		        		fileList = imageData.url;
		        		document.getElementById('aaaa').src ='http://'+serverName+':'+serverPort+fileList;
		        		document.getElementById('myPage-account-image').src ='http://'+serverName+':'+serverPort+fileList;
		        		document.getElementById('uploaded').value ='http://'+serverName+':'+serverPort+fileList;
		        		//document.getElementById('account_send').submit();
		        	}
		      		,error: function(error){
		      			console.log(error);
		      			console.log('파일업로드 실패');
		      		}
		      	});
			});
	});
	

</script>
	<div id="hQnAWriteD33">
		<div class="hQnAT">홈페이지문의</div> <!-- 페이지 타이틀 -->
		
		<div class="hQnATWT">1:1문의</div>
		
		<form method="post" id="hQnAWriteD33ulFrm">
			<ul id="hQnAWriteD33ul">
				<li>
					<div>회원정보</div>
					<div>${userId}</div>	<!-- 세션에저장되어잉ㅆ는아이디 -->
				</li>
				<li>
					<div>제목</div>
					<div><input type="text" name="title" id="hQnAWriteSub" ></div>	
				</li>
				<li>
					<div>문의내용</div>
					<div><textarea name="content" id="hQnAWriteCon"></textarea></div>	
				</li>
				<li id="fu">
					<div>파일첨부</div>
					<div><input type="file" name="file1" id="hQnAWriteFile">
					<label for="hQnAWriteFile" id="labelfor1">파일선택</label><span id="uploaded"></span></div>	
					<button id="bbbb">사진보기</button>
				</li>
				<li id="fu2">
					<div>파일첨부</div>
					<div><input type="file" name="file2" id="hQnAWriteFile2">
					<label for="hQnAWriteFile2" id="labelfor2">파일선택</label><span id="uploaded2"></span></div>	
					
				</li>
				<li id="fu3">
					<div>파일첨부</div>
					<div><input type="file" name="file3" id="hQnAWriteFile3">
					<label for="hQnAWriteFile3" id="labelfor3">파일선택</label><span id="uploaded3"></span></div>	
				</li>
				<li>
					<div><img src="basic.jpg" id="aaaa"></div>
				</li>		
				
				<li id="hQnABut">
				<input type="button" name="hQnAWCan6" id="hQnAWCan6" value="취소"/><input type="button" name="hQnAWSubmit9" id="hQnAWSubmit9" value="등록"/>
				
				</li>	
					
			</ul>
			
			
		</form>
		
	</div>
