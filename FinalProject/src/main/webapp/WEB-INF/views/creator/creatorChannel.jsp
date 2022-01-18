<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>  
<!-- summernote -->

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<script>
var size = 250;
const content  = '${channel.creator_content}';
console.log(content)
var serverName = '<%=request.getServerName() %>';
var serverPort = <%=request.getServerPort() %>;
$(function(){
	var fileList;
	$('#class_thumb').on('propertychange change keyup paste input click', function uploadFiles(e){
			var file = $('#fileButton')[0].files[0]
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
	        		document.getElementById('previewImg').src ='http://'+serverName+':'+serverPort+fileList;
	        		document.getElementById('thumb_image').value ='http://'+serverName+':'+serverPort+fileList;
	        	}
	      		,error: function(error){
	      			console.log(error);
	      			console.log('파일업로드 실패');
	      		}
	      	});
		});
	
	
	
	$('#summernote').summernote({
		height:size,
		placeholder:content,
	  	lang:"ko-KR",	
	  	minHeight: size, 
	  	maxHeight:size,
	  	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
		onImageUpload : function(files) {
		uploadSummernoteImageFile(files[0],this);
		},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
		 	}
	  	}
	});
});

var tbu = "등록";
var tbu2 = "수정";
$(this).on("propertychange change keyup paste input",function(){
	if($('.note-editable>p').text() !=="" && $('.divideDivProfile').css('display') !=='none' ){
		$('#modifyButton').val(tbu2);
	}else{
		$('#modifyButton').val(tbu);
	}
});

////////////////////////////////////////////////

function summernote(){
	$('.divideDivResult').css('display','none');
	$('.divideDivClass').css('display','none');
	$('.divideDivProfile').css('display','block');
	$('#modifyButton').css('display','block');
	};
///////////////////////////////////////////////

</script>

<style>
#myChannelMainDiv{
	width:1200px;
	margin:0 auto;
	height:800px;
	padding-top:20px;
}
.divideDiv{
	width:100%;
	height:420px;
}
.divideDiv div{
	float:left;
}
.creatorImgDiv{background-color:lightblue;
	border-radius:200px;
	width:400px;
	height:400px;
	margin: 0px 0px 0px 30px;
	overflow: hidden;
}
#creatorNameDiv{background-color:;
	width:400px;
	height:120px;
	margin:160px 500px 0px 0px;
	float:right;
	padding-left: 50px;
}
#creatorNameDiv>ul>li{border:;
	text-align:right;
	font-size:2em;
	color:gray;
	font-weight: 500;
	line-height: 55px;
	width:270px;
}
#creatorNameDiv>ul>li:nth-child(1){
	border-bottom:3px solid lightgray;
}
#myChannelMenuDiv>ul>li{border:1px dotted lightgray;
	width:100%;
	line-height:45px;
	height:50px;
	text-align: center;
	float:left;
}
#myChannelMenuDiv>ul>li{
	color:gray;
	font-weight:500;
	font-size:1em; 
}
#myChannelMenuDiv>ul{
	width:100%;
	height:50px;
	
}
#creatorNameDiv span{
	color:#FF385C;
	font-size:0.6em;
	font-weight:500;
}
.divideDivProfile{border:1px solid lightgray;
	color:gray;
	font-weight:500;
	font-size:1em; 
	text-align: center;
	border-radius:8px;
}
.buttons{
	width:150px;
	height:30px;
	background-color: white;
	border:1px dotted gray;
	border-radius:8px;
	float:right;
	margin-left:10px;
}
.buttons:hover{
	color:white;
	background-color:#FF385C;
	cursor: pointer;
}
#imgThumbDiv{border:1px solid lightgray;
	border-radius:30px;
	height:300px;
	margin-left:50px;
	width:250px;
	overflow: hidden;
}
#previewImg{
	height:100%;
	width:100%;
}

.classImgDiv{
	width:300px;
}
.filebox>ul{
	margin-top:30px;
	width:400px;
	heigth:50px;
	margin-left:80px;
}
.filebox>ul>li{
	float:left;
}
</style>

<div id="myChannelMainDiv">
		<form  method="post" action="<%=request.getContextPath()%>/creator/creatorProfileOk" >
	<div class="divideDiv">
		<div class="classImgDiv">
				<div id="imgThumbDiv">
					<img src="${channel.creator_content_img}" id="previewImg" > 
				</div>
				<div class="filebox">
					<ul>
						<li><input type="button" class="button" value="확인" id="class_thumb" ></li>
						<li><input type="hidden" name="creator_content_img" id="thumb_image" value="${channel.creator_content_img}"></li>
						<li><input type="file" id="fileButton"  required ></li>
					</ul>
				</div>
		</div>
		
		<div id="creatorNameDiv">
			<ul>
				<li>${creatorId}님 </li>
				<li id="creator_name"><span>Creator ${creatorNick}</span></li>
				
			</ul>
		</div>
	</div>
		<div class="myChannelMenuDiv">
			<div class="divideDivProfile">크리에이터 프로필</div>
			<div id="summernoteForm">
	  			<textarea id="summernote" name="creator_content">${channel.creator_content }</textarea>
			</div>
		</div>
		<div><input type="submit" class="buttons"  id="modifyButton" value="등록"></div>
	</form>
</div>

