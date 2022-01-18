<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 데이트픽커 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 구글맵 -->
<!--  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZO3MrykFpNpemqO2zPtG5M9ADUXSoApw&callback=initMap"></script>-->

<style>


.container h1{
	margin-top:0;
}

.small-menu{
	font-size: 1.2em;
}

.menu_title>a{
	font-size: 1.4em;
	font-weight:600;
}

.menu_title>a{
	font-size: 1.4em;
	font-weight:600;
	line-height: 1.48;
}
a:focus, a:hover {
    color: #ff385c;
    text-decoration: none;
}

</style>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9551f210d2bfdcde36af42fb1ccab895&libraries=services"></script>
<script>
var categoryNumL;
var categoryNumS;
var count=0;
var iitest=0;
var start_date;
var start_str;
var DateArray = [];
var classDateDivCount;
var  resultsArray;
var startTimeArray =[];
$(function(){
	//////////////////////////////////////////////////////날짜 선택 모달
	 $(".modal").css({
         "top": (($(window).height()-$(".modal").outerHeight())/2+$(window).scrollTop())+"px",
         "left": (($(window).width()-$(".modal").outerWidth())/2+$(window).scrollLeft())+"px"
     }); 
	
	$("#modalButton").click(function(){
		$(".modal").fadeIn(); 
	}); 
	
	$(".modal").click(function(){
			$(".modal").fadeOut();
	});
	//////////////////////////////////////// 대분류 카테고리 눌렀을시 소분류 불러오기
	$('.categoryL').on('click',function(){
		
		$("#classCategorySUL").html("");
		categoryNumL = $(this).val();
		var category_no;
		var url = "makeClass/ajaxList" 
			var params = {"no":categoryNumL};
			$.ajax({
				url : url,
				data : params,
				success:function(r){
					var rr = $(r);
					rr.each(function(idx, vo){
						category_no = vo.category_no;
						$("#classCategorySUL").append("<li><input type='checkbox' value='"+vo.category_no+"' name='"+vo.category_no+"' class='categoryS'>"+vo.category_name+"</li>"); 
					});
						$('.categoryS').on('click',function(){
							$(".categoryS").prop("checked",false);
							$(this).prop('checked',true);
							var dsds = $(this).attr('value');
							$("#categoryReal").val(dsds);
						});
				},error:function(e){
					console.log("List전송 에러발생함",e.responseText)
				}
			});
			$("input:checkbox[name='NAME']").is(":checked")
	});
	/////////////////////////////////////////////////////////숫자만 입력
	
	$("#class_fee").on("keyup", function() {
		if(!$.isNumeric($('#class_fee').val())){
     		 $(this).val($(this).val().replace(/[^0-9]/g,""));
     		 alert('숫자만 입력할수 있습니다');
  		};
	});
	
	$("#class_nop").on("keyup", function() {
		if(!$.isNumeric($('#class_nop').val())){
     		 $(this).val($(this).val().replace(/[^0-9]/g,""));
     		 alert('숫자만 입력할수 있습니다');
  		};
	});
	
	$("#classTag").on("keyup", function() {
		$(this).val($(this).val().replace(/ /g,""))
	});
	
	
	////////////////////////////////////////////////////////// 카테고리 
	$('.categoryL').click(function(){
		if($(this).prop('checked') &&  categoryNumL == 800){
			alert("자기계발 카테고리(대)는 하위 카테고리가 없습니다")
			$("#categoryReal").val(800);
			$(".categoryL").prop("checked",false);
			$(this).prop('checked',true);
			$('#smallCategoryDiv').css("display","none");
		}else if($(this).prop('checked') &&  categoryNumL == 900){	
			$("#categoryReal").val(900);
			alert("기타 카테고리(대)는 하위 카테고리가 없습니다")
			$(".categoryL").prop("checked",false);
			$(this).prop('checked',true);
			$('#smallCategoryDiv').css("display","none");
		}else if($(this).prop('checked') && categoryNumL != 800){
				$('#smallCategoryDiv').css("display","block");
			 	$(".categoryL").prop("checked",false);
				$(this).prop('checked',true);
		 
		}else if($(".categoryL").is("checked") == false) {
		   	$('#smallCategoryDiv').css("display","none");
		   	$("input[type='checkbox'][name='categoryS']").prop("checked",false);
		    }
	});
	//////////////////////////////////////////////////////달력
	classDateDivCount = -1;
	classDateCount=0;
	
	$(".flatpickrCalender").flatpickr({
		inline : true,
		mode: "single",
		dateFormat: " Y - m - d ",
		minDate:"today",
		maxDate: new Date().fp_incr(180),
		altInput: true,
		onChange(selectedDates, dateStr, instance) {
            var testing1;
        	 	
        	   classDateDivCount++;
        	   
            	testing1 = "<div class='putDateTime2' id='dateTimeDivDel'>";
            	testing1 += "<div title='cancel' class='dateCancelButton' onclick='deleteDivDate(this, "+classDateDivCount+");'>";
            	testing1 += "<div value='"+classDateDivCount+"'></div><img src='<%=request.getContextPath()%>/img/kimin/xbu.png'>"
            	testing1 += "</div>";
            	testing1 += ""+dateStr+"";
				testing1 += "<input type='time' id='startTime' value='09:30' onchange='inputStartTime($(this).val())'>";
				testing1 +=  "<img src='<%=request.getContextPath()%>/img/kimin/~.png'>"
				testing1 += "<input type='time' id='endTime' value='17:30' onchange='inputEndTime($(this).val())'>";
				testing1 += "</div>";
				
				
            	$('#putDateTime').append(testing1);
            		
            	startTimeInput($('#startTime').val(),$('#endTime').val(),dateStr);
            if(classDateDivCount >= 9){
            	//alert("선택"+count+"를 초과하였습니다\n"+count+"개를 취소해 주십시오.");
            	alert("10개를 모두 선택하였습니다\n");
            	$(".flatpickr-day.selected").css("background","#FF385C");
            }
             
             console.log(classDateDivCount)
       	}
		
	});
	////////
	
	//////////////////////////////////////////////////////테그 변환
	$("#class_tagButton").click(function(){
			if(count < 5){
				if($('#classTag').val() !== ""){
					iitest++;
					$("#tagInsert").append("<div style='float:left' id='tagInsertInner"+iitest+"'>"+"#"+$('#classTag').val()+"<input type='button' value='x' id='divdel' onclick='deleteDiv()'>"+"</div>");
					var tagInsert = $("#tagInsert").text();
					$('#class_tag').val(tagInsert);
					count++;
				}else{
					alert("태그로 사용할 문구를 입력해주세요")
				}
			}else{
				alert("5개 태그 모두 선택하였습니다.")
			}
			$('#classTag').val("");
	});
/////////////////////////////////파일이름 넣기
///////////////////////////////////////////////////////빈칸확인
	$('#class_apply').click(function(){
		if($('#class_name').val() == ""){
			alert('클래스명을 입력하세요');
			window.location.href="#f1";
			return false;
		}else if($('#class_info').val() == ""){
			alert('클래스 간단 소개를 입력하세요');
			window.location.href="#f2";
			return false;
		}else if($("#categoryReal").val() == ""){		
			alert('클래스 카테고리를 선택하세요');
			window.location.href="#f3";
			return false;
		}else if($('#thumb_image').val() == ""){		
			alert('클래스 썸네 파일을 업로드하세요');
			window.location.href="#f4";
			return false;
		}else if($('#summernote').val() == ""){
			alert('클래스 소개를 입력하세요');
			window.location.href="#f5";
			return false;
		}else if($('#classDateRealStart').val() == ""){
			alert('날짜를 선택후 확인을 눌러주세요');
			window.location.href="#f6";
			return false;
		}else if($('#roadAddress').val() == ""){
			alert('도로명 주소 검색하세요');
			window.location.href="#f7";
			return false;
		}else if($('#postcode').val() == ""){
			alert('우편번호를 검색하세요');
			window.location.href="#f7";
			return false;
		}else if($('#detailAddress').val() == ""){
			alert('상세주소를 입력하세요');
			window.location.href="#f7";
			return false;
		}else if($('#class_fee').val() == ""){
			alert('수강료를 입력하세요');
			return false;
		}else if($('#class_nop').val() == ""){
			alert('최대인원을 입력하세요');
			return false;
		}
	});
});
		var clickCount;
		var arry = new Array();
		var arryStart = new Array();
		var arryEnd = new Array();
		
		var startTime;
		var endTime;
		var lastTime;
		
		function startTimeInput(start, end, day){
			startTime = (day + start);
			endTime = (day + end);
			lastTime = (startTime + endTime);
			//arry[classDateDivCount] = lastTime;
			arryStart[classDateDivCount] = startTime;
			arryEnd[classDateDivCount] = endTime;
			
		}
		
		function startTimeRealInput(){
			$('#classDateRealStart').val(arryStart);
			$('#classDateRealEnd').val(arryEnd);
		}

//////////////////////////////////// 날짜 선택 지우기 div
		function deleteDivDate(del, index){
			$($(del).parents("#dateTimeDivDel")).remove();
			//delete arry[index];
			delete arryStart[index];
			delete arryEnd[index];
			classDateDivCount--;
			console.log(classDateDivCount);
			//$("#classDateRealStart").val(""); //네임안에 있는 값전체삭제
			//$("#classDateRealEnd").val("");
		}
/////////////////////////////// 태그에 빨간 div 삭제
		function deleteDiv(){
			var div = document.getElementById('tagInsertInner'+iitest);
			div.remove();
			count--;
			iitest--;
			console.log(count);
		}
//////////////////////////// 

/* 주소 검색 */
function execDaumPostcode() {
   	var width = 500;
  	var height = 300;
  	
	new daum.Postcode({
    	width: width,
    	height: height,
    	popupTitle:'anotherclass',
        oncomplete: function(data) {
        	
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords);
                }
            });
        }
    }).open({//embed('classAddressIframe'); 팝업아닌 넣어서 표시
    	 left: (window.screen.width / 2) - (width / 2),
    	 top: (window.screen.height / 2) - (height / 2)
    });
};

	
	
</script>

<script>
var serverName = '<%=request.getServerName() %>';
var serverPort = <%=request.getServerPort() %>;
$(()=>{
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
		// 에디터 높이
		height: 300,
		width: 1200,
		minHeight: 300, 
	  	maxHeight: 300,
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
	        	,url: '/another/FileUpload/imageUploadUrl'
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
	
<style>

.container h1{color:gray; margin-bottom:20px; font-weight:600;}
.container span{font-size:1.2em; font-weight:600; }
/* body{ background-color:#FFF5F5;} */
kimin{ color:#FF385C; }
kimin2{font-size: 1.3em; color:gray; margin-left:5px;}

#class_name{
	height:50px; width:100%;
}
#class_info{
	height:100px; 
	padding-top:15px; 
	resize:none;
}
.followDiv li{
	font-size:1.2em;
 	font-weight:500;
 	color:gray;
} 
.descriptionUl{
	background-color:#f1f1f1;
	width:100%;
	height:120px;
	border-radius:8px;
	padding:10px 0px 10px 20px;
	margin-bottom:60px;
}
.dsctitle{
	color:gray;
}
.descriptionUl>li{
	font-size:1em;
}
.descriptionUl li:not(.dsctitle){
	margin-left:15px;
	font-weight:400;
	color:gray;
	list-style-type:circle;
}
.inputCommonClass{
	width:100%; 
	margin-top:20px;
	margin-bottom:20px;
	border:2px solid lightgray;
	border-radius:8px;
	padding:0px 0px 0px 20px;
	font-size:1.2em;
}
.container{
	width:1200px;
	height:5100px; 
	margin:0 auto;
	padding:0px;
}
.followDiv{background-color:;
	width:100%;
	height:35px;
	border-bottom:2px dotted lightgray;
	margin-top:60px;
	margin-bottom:70px;
}
.followDiv>ul>li{
	float:left;
	width:11.1%;
	line-height: 32px;
}
.followDiv>ul{
	padding-left:40px;
	width:100%;
	height:40px;
}
.followButton{
	margin-right:5px;
	background-color:#FF385C;
	width:30px;
	height:30px;
	border-radius:8px;
	font-weight:800;
	line-height:30px;
	text-align:center;
	float:left;
}
.classCommonDiv{
	width:100%; 
	height:50px;
	border-bottom:2px dotted lightgray;
	text-align:left;
	line-height:50px;
}
.classCategoryDiv{
	width:100%;
	height:100px;
	border:2px solid lightgray;
	border-radius:8px;
	margin-top:20px;
	margin-bottom:60px;
	padding:15px 15px 15px 15px; 
	font-size: 1.2em;
}
.classCategoryDiv>ul{ background-color:; 
	width:100%;
	height:100%;
	text-align: center;
}
.classCategoryDiv li{
	font-weight: 500;
	color:gray;	
	float:left;
	width:15%;
}

input[type="checkbox"]{cursor: pointer;-webkit-appearance: none;-moz-appearance: none;appearance: none;outline: 0;background: white;height: 16px;width: 16px;border: 1px solid #FF385C;}
input[type="checkbox"]:checked {background: #FF385C;}
input[type="checkbox"]:hover {background: #FF385C;}
input[type="checkbox"]:checked:after {display: block;}
input[type="checkbox"]:after {content: '';position: relative;left: 40%;top: 20%;width: 15%;height: 40%;border: solid #fff;border-width: 0 2px 2px 0;transform: rotate(45deg);display: none;}

#smallCategoryDiv{
	display:none; 
}
.classImgDiv{
	width:100%;
	height:500px;
	border:2px solid lightgray;
	border-radius:8px;
	margin-top:20px;
	margin-bottom:20px;
	padding:10px 0px 0px 0px; 
	font-size: 1.2em;
	text-align:center;
}
#imgThumbDiv{border:2px dotted lightgray;
	border-radius:8px;
	display:inline-block;
	height:430px;
	margin:0 auto;
}
#imgThumbDiv img{
	height:100%;
}
.buttonClass{
	font-size:1.2em;
	background-color: white;
	color: #FF385C;
	font-weight:500;
	border:3px solid lightgray;
	border-radius:8px;
}
.buttonClass:hover{
	cursor: pointer;
	background-color: #FF385C; 
	color:white;
}
.classImgDiv>input[type=button]{
	margin-top:0px;
	width:800px;
	height:40px;
}
#summernoteForm{
	margin-top:20px;
	margin-bottom:20px;
}
#descriptionDetail{
	height:150px;
}
.classDate{border:2px solid lightgray;
	width:100%;
	height:380px;
	border-radius:8px;
	margin-top:20px;
	margin-bottom:20px;
	padding:20px 0px 0px 20px; 
	font-size: 1.2em;
	line-height: 30px;
}
.classDate>ul{border:;background-color:;
	width:880px;
	height:340px;
	margin:0 auto;
	margin-top:20px;
	padding:0, 0, 0, 0;
	
}
#dateConfirmButton{
	height:300px;
	border-radius:8px;
	background-color: white;
	border:1px solid lightgray;
	margin-left:5px;
}
#dateConfirmButton:hover{
	background-color:  #FF385C; 
	color:white;
}
.classDate li{
	float:left;
}
.simg{
	margin-top:0px;
}
#putDateTime{display:;border:;background-color:;
	border:2px dotted lightgray;
	width:500px;
	height:360px;
	text-align: center;
	margin:-30px 0 0 20px;
	line-height: 34px;
	border-radius:8px;
	padding-top:10px;
}
.dateCancelButton{
	width:25px;
	height:25px;
	background-color: #FF385C; 
	border-radius:8px;
	margin:5px 0 0 0;
	color: white;
	font-weight: 600;
	line-height: 25px;
	margin-left: 5px;
	cursor: pointer;
}
.putDateTime2{
	color:#FF385C; 
	font-weight:600;
	font-size:1em;
}
.putDateTime2>div{
	float:left;
}
#putDateTime input[type="time"]{
	margin-left:10px;
	width:140px;
	height:30px;
	border-radius:8px;
	text-align: center;
	border:1px solid lightgray;
	font-size: 1em;
}
.flatpickrCalender{
	display: none;
}
.classAddress{
	width:100%;
	height:180px;
	border:2px solid lightgray;
	border-radius:8px;
	margin-top:20px;
	margin-bottom:20px;
	padding:20px 0px 0px 20px; 
	font-size: 1.2em;
	line-height: 30px;
}
.classAddress input[type=text]{
	width:400px;
	height:50px;
	font-size: 1.2em;
	border-radius:8px;
	font-weight:500;
	border:2px dotted lightgray;
	text-align: center;
}
.classAddress input[type=button]{
	border:2px dotted lightgray;
	width:400px;
	height:50px;
}
#classAddressInnerDiv{border:;
	margin:0 auto;
	width:815px;
	height:115px;
}
#classAddressInnerDivGoogle{
	height:500px;
}
#kakaoMap{
	width:1160px;
	height:460px;
}
#serchOnGoogle{
	border:2px dotted lightgray;
	width:805px;
	border-radius:8px;
	height:35px;
	margin-top:3px;
	color: #FF385C;
	font-weight:500;
	font-size: 1em;
	background-color: white;
}
#serchOnGoogle:hover {
	cursor: pointer;
	background-color:#FF385C;
	color:white;
}
#class_fee, #class_nop{
	height:50px;
	width: 480px;
	text-align: right;
	padding:0px 50px 0px 0px;
}
#classFee>span{
	color:gray;
	margin-left:10px;
}
#classTag{
	width:500px;
	height:50px;
	margin-left:320px;
	text-align: right;
	padding:0px 50px 0px 0px;
}
#class_tagButton{
	width:100px;
	height:50px;
}
#tagInsert{border:2px dotted lightgray;
	width:800px;
	height:42px;
	margin:0 auto;
	margin-bottom: 20px;
}
#tagInsertInner1,#tagInsertInner2,#tagInsertInner3,#tagInsertInner4,#tagInsertInner5{
	color:white;
	width:18%;
	height:40px;
	border-radius:8px;
	background-color:#FF385C;
	font-size: 1.2em;
	margin-left:1%;
	margin-right:1%;
	padding:8px 0px 0px 15px;
}
#divdel{
	background: #FF385C;
	border-radius:8px;
	border-color:#FF385C;
	color: white;
	font-weight: 800;
	width:30px;
	height:25px;
	cursor: pointer;
	margin-left:10px;
}
.classApplyDiv{
	border-top: 3px solid lightgray;
}
#class_apply{
	margin-top:20px;
	width:100%;
	height:80px;
	font-size: 1.5em;
	font-weight: 600px;
}
#class_tag{
	display:none;
}
.filebox .imgThumbFileName{
	height: 40px;
	display: inline-block;
	vertical-align: middle;
	text-align:center;
    border: 2px solid #dddddd;
    width: 300px;
    margin-top: 7px;
    color:gray;
    font-weight: 500;
    border-radius: 8px;
    
}
.filebox label{
	display: inline-block;
	vertical-align: middle;
	color:white;
    font-weight: 500;
    cursor: pointer;
    background-color:#FF385C;
    border-radius: 8px;
    padding: 5px 20px;
    margin-top: 7px;
    margin-left: 10px;
}
.filebox input[type="file"]{
	display: none;
}
#categoryReal{
	color:black; 
	display: none;
}
#classCategorySUL>li{
	width:20%; 
	line-height: 35px;
}
#classCategorySUL input{
	margin:0px 5px 0px -80px;
}
#classCategorySUL{ background-color:;
	padding:0;
	width:100%;
}
#classDateRealStart, #classDateRealEnd{
	display:none;
	width:400px;
}


</style>
<form method="post" action="<%=request.getContextPath()%>/creator/makeClassOk" enctype="multipart/form-data">
<div class="container">
	<h1>클래스개설</h1>
	<div class="followDiv">
		<ul>
			<li><div class="followButton" style="color:white">1</div><a href="#f1"> 클래스명</a></li>
			<li><div class="followButton" style="color:white">2</div><a href="#f2"> 간단소개</a></li>
			<li><div class="followButton" style="color:white">3</div><a href="#f3"> 카테고리</a></li>
			<li><div class="followButton" style="color:white">4</div><a href="#f4"> 썸네일</a></li>
			<li><div class="followButton" style="color:white">5</div><a href="#f5"> 소개</a></li>
			<li><div class="followButton" style="color:white">6</div><a href="#f6"> 일정</a></li>
			<li><div class="followButton" style="color:white">7</div><a href="#f7"> 상세</a> 주소</li>
			<li><div class="followButton" style="color:white">8</div><a href="#f8"> 수강료,인원</a></li>
			<li><div class="followButton" style="color:white">9</div><a href="#f9"> #태그</a></li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f1">
		<span><kimin>*</kimin> 1) 클래스명 입력 <kimin>(필수)</kimin></span>
	</div>
	<div >
		<input type="text" name="class_name" class="inputCommonClass" placeholder="클래스명을 입력하세요" id="class_name">
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>어떤 수업인지 한 눈에 알수있는 클래스 이름</li>
			<li>지역 또는 클래스 성격(원데이 클래스/정규 클래스)등을 뒤에 적어 주셔도 좋습니다</li>
			<li>등록 후 수업시작 전까지 수정이 가능합니다</li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f2" >
		<span><kimin>*</kimin> 2) 클래스 간단 소개 <kimin>(필수)</kimin></span>
	</div>
	<div>
		<textarea name="class_info" class="inputCommonClass" placeholder="클래스 간단 소개를 &#13;&#10;입력하세요" id="class_info"></textarea>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>클래스 요약 설명 작성란 입니다</li>
			<li>제목을 보완해 줄 수 있는 설명을 적어주세요</li>
			<li>다음 스텝에서 자세한 클래스 소개란이 있으므로 간단히 작성해 주셔도 좋습니다</li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f3">
		<span><kimin>*</kimin> 3) 클래스 카테고리 <kimin>(필수)</kimin></span>
	</div>
	
	<div class="classCategoryDiv" id="forEach">
		<ul>
			<c:forEach var="vo" items="${cate }">
			<li ><input type="checkbox"  value=" ${vo.category1_no }" class="categoryL" > ${vo.category_name }</li> <!-- 반복문 -->
			</c:forEach>
		</ul>
	
	</div>
	<input type="text" name="category_no" class="categoryPutInput" id="categoryReal" >
	<div id="smallCategoryDiv">
		<div class="classCommonDiv">
			<span><kimin>*</kimin> 3-1) 클래스 서브 카테고리 <kimin>(필수)</kimin></span>
			
		</div>
		<div class="classCategoryDiv">
			<ul id="classCategorySUL">
				
			</ul>
		</div>
	</div>
	<div class="classCommonDiv" id="f4">
		<span><kimin>*</kimin> 4) 클래스 썸네일 <kimin>(필수)</kimin></span>
	</div>
	<div class="classImgDiv">
			<div id="imgThumbDiv"><img src="<%=request.getContextPath()%>/img/kimin/uploadimg.jpg" id="previewImg" ></div>
			<div class="filebox">
				<input type="button" class="imgThumbFileName" value="확인" id="class_thumb" >
				<input type="hidden" name="class_thumb" id="thumb_image">
				<label for="fileButton">업로드</label>
				<input type="file" id="fileButton" name="filename" required>
			</div>
			
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지 비율 가로=1 : 세로=1.2 를 추천드립니다</li>
			<li>너무 큰 용량은 업로드 되지 않을 수 있습니다</li>
			<li>클래스 소개에서 여러장의 이미지를 소개글과 추가 할 수 있습니다</li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f5">
		<span><kimin>*</kimin> 5) 클래스 소개 <kimin>(필수)</kimin></span>
	</div>
	<div>
		<div id="summernoteForm">
  			<textarea id="summernote" name="class_content"></textarea>
		</div>
	</div>
	<div>
		<ul class="descriptionUl" id="descriptionDetail">
			<li class="dsctitle">작성 Tip 보기 </li>
			<li>클래스를 자세히 설명해 주세요</li>
			<li>최소 2줄 이상 작성해 주세요</li>
			<li>내용 복사 & 붙여넣기의 경우 일부 화면이 깨질 수 있습니다</li>
			<li>사진을 첨부 할 수 있습니다</li>
		</ul>
	</div>
	<input type="text" id="classDateRealStart" name="start_date" >
	<input type="text" id="classDateRealEnd" name="end_date" >
	<!-- ////////////////////// -->
	<div class="classCommonDiv" id="f6">
		<span><kimin>*</kimin> 6) 클래스 일정 <kimin>(필수)</kimin></span> 	
	</div>
	<div class="classDate">
		<ul>
			<li><input class="flatpickrCalender"/></li>
			<li><div  id="putDateTime"></div></li>
			<li><div id="dateCount"></div></li>	
			<li><input id="dateConfirmButton" type="button" value="확인" onclick="startTimeRealInput()"></li>
		</ul>
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>클래스 개설 일정과 시간을 선택해 주세요</li>
			<li>최대 10일 까지 선택 가능합니다</li>
			<li>10개 선택 초과시 빨강색으로 표시되며 선택한 요일을 다시 클릭하면 취소됩니다</li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f7">
		<span><kimin>*</kimin> 7) 클래스 상세 주소 <kimin>(필수)</kimin></span>
	</div>
	<div class="classAddress">
		<div id="classAddressInnerDiv">
			<input type="text" id="postcode" placeholder="우편번호" name="class_post_no" readonly="readonly">
			<input type="button" onclick="execDaumPostcode()" value="주소검색" class="buttonClass"><br>
			<input type="text" id="roadAddress" placeholder="도로명주소" name="class_addr1" readonly="readonly">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="detailAddress" placeholder="상세주소" name="class_addr2"/>
			<!-- 구글맵 -->
			<input id="serchOnGoogle" type="button" value="지도에 위치표시 하기" onclick="mapSearch()"/>
		</div>
	</div>
	<div class="classAddress" id="classAddressInnerDivGoogle">
		<div id="kakaoMap"></div>
	</div>
		<script>
			var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
		
		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		</script>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>클래스 주소를 입력해주세요</li>
			<li>주소를 입력하시면 지도상에 위치로 등록됩니다</li>
			<li>검색결과가 정확 하지 않으면 수정해 주세요</li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f8">
		<span><kimin>*</kimin> 8) 클래스 수강료 및 최대인원 <kimin>(필수)</kimin></span>
	</div>
	<div id="classFee">
		<span> 수강료 : </span><input type="text" name="class_price" class="inputCommonClass" placeholder="희망 수강료를 입력하세요" id="class_fee"><kimin2>원</kimin2>
		<span> 최대인원 : </span><input type="text" name="max_headcount" class="inputCommonClass" placeholder="수강가능 최대인원을 입력하세요" id="class_nop"><kimin2>명</kimin2>
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>수강료와 최대인원을 입력해주세요</li>
			<li>수강료와 최대인원은 숫자로만 입력해 주세요</li>
			<li>ex)200,000 ex)30 --->원, 명은 입력하지마세요 </li>
		</ul>
	</div>
	<div class="classCommonDiv" id="f9">
		<span>* 9) 검색 #태그 </span>
	</div>
	<div id="classFee">
		<input type="text"  class="inputCommonClass" placeholder="#없이 태그를 입력하세요" id="classTag">
		<input type="button" value="추가" id="class_tagButton" class="buttonClass"><br/>
		<div id="tagInsert"></div>
		<input type="text" name="class_tag" id="class_tag" >
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>5개 태그까지 추가 할 수 있습니다</li>
			<li>띄어쓰기 대신 _를 사용해 주세요</li>
			<li>추가버튼을 누르면 항목이 밑에 표시됩니다 </li>
		</ul>
	</div>
	<div class="classApplyDiv">
		<input type="submit" value="클래스 등록신청" name="class_apply" id="class_apply" class="buttonClass">
	</div>
</div>
</form>
<!--  <button id="modalButton">모달창</button> 
<div class="modal"> 
	<div class="modal_content" title="클릭하면 창이 닫힙니다."> 여기에 모달창 내용을 적어줍니다.<br> 이미지여도 좋고 글이어도 좋습니다. </div>
</div>-->
