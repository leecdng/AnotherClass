<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- include summernote css/js -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<div>
	<textarea class="summernote" name="editordata"></textarea>
</div>
<div>
	<form method="POST" enctype="multipart/form-data" id="fileUpload">
		<input type="file" id="imageFile" name="file" value="text"/>
		<input type="button" id="fileTransfer" value="파일업로드 테스트" />
	</form>
</div>

<script>
$(()=>{
	var fileList;
	$('#fileTransfer').on('click', function uploadFiles(e){
			var file = $('#imageFile')[0].files[0]
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data
	        	,type: "POST"
	        	,url: 'imageUploadUrl'
	        	,contentType: false
	        	,processData: false
	        	,success: function(imageData) {
	        		console.log("img:"+ imageData.url);
	        		fileList = imageData.url;
	        	}
	      		,error: function(error){
	      			console.log(error);
	      			console.log('파일업로드 실패');
	      		}
	      	});
		});
	console.log(fileList);
	});
</script>

<script>
$(()=>{
	$('.summernote').summernote({
		// 에디터 높이
		height: 200,
		width: 800,
		lang:"ko-KR",
		focus: true,
		toolbar: [
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['insert',['picture']],
		    ['height', ['height']]
		  ],
		callbacks: {
			onImageUpload: function(files){
				uploadFiles(files[0], this);
			}
		}
	});
	
		function uploadFiles(file, editor){
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data
	        	,type: "POST"
	        	,url: 'imageUploadUrl'
	        	,contentType: false
	        	,processData: false
	        	,success: function(imageData) {
	        		console.log("img:"+ imageData.url);
	          		$(editor).summernote('insertImage', imageData.url);
	        	}
	      		,error: function(error){
	      			console.log(error);
	      			console.log('파일업로드 실패');
	      		}
	      	});
		}
	});
</script>