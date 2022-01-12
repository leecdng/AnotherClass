<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- 데이트픽커 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 구글맵 -->
<!--  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZO3MrykFpNpemqO2zPtG5M9ADUXSoApw&callback=initMap"></script>-->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9551f210d2bfdcde36af42fb1ccab895&libraries=services"></script>
<script>
var count=0;
var iitest=0;
$(function(){
	$('input[type="checkbox"][name="categoryL"]').click(function(){
		 
		  if($(this).prop('checked')){
		 	$('#smallCategoryDiv').css("display","block");
		 	
		    $("input[type='checkbox'][name='categoryL']").prop("checked",false);
		 
		    $(this).prop('checked',true);
		 
		    }else if($("input[type='checkbox'][name='categoryL']").is("checked") == false) {
		    	$('#smallCategoryDiv').css("display","none");
		    	$("input[type='checkbox'][name='categoryS']").prop("checked",false);
		    }
	});
	$(".flatpickrCalender").flatpickr({
		inline : true,
		mode: "multiple",
		dateFormat: " Y - m - d , H : i ",
		minDate:"today",
		maxDate: new Date().fp_incr(180),
		enableTime: true,
		altInput: true,
		altFormat: " Y - m - d , H : i ",
		onChange(selectedDates, dateStr, instance) {
            var array=selectedDates;
            if(array.length <= 10){
            	$('#putDateTime').html(instance.altInput.value);
            	
            }else if(array.length >= 11){
            	var count = array.length - 10;
            	alert("선택"+count+"를 초과하였습니다\n"+count+"개를 취소해 주십시오.");
            	$(".flatpickr-day.selected").css("background","#FF385C");
            	//$(".flatpickr-day").css("pointer-events","none");*/ 캘린더 클릭못하게 막을수있음
            }
       }
	});	
	$("#class_tagButton").click(function(){
			if(count < 5){
				if($('#class_tag').val() !== ""){
					iitest++;
					$("#tagInsert").append("<div style='float:left' id='tagInsertInner"+iitest+"'>"+"#"+$('#class_tag').val()+"<input type='button' value='x' id='divdel' onclick='deleteDiv()'>"+"</div>");
					count++;
				}else{
					alert("태그로 사용할 문구를 입력해주세요")
				}
			}else{
				alert("5개 태그 모두 선택하였습니다.")
			}
			$('#class_tag').val("");
	});
});
///////////////////////////////
function deleteDiv(){
	var div = document.getElementById('tagInsertInner'+iitest);
	div.remove();
	count--;
	iitest--;
	console.log(count);
};
/////////////////////////////////////////////
$(document).ready(function() {
		  $('#summernote').summernote({
  				height:800,
  				placeholder:'클래스 소개글과 이미지를 넣어 작성하세요 ',
  				lang: "ko-KR",	
  				minHeight: 800, 
  				maxHeight:800,
  				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadImageFile(files[0],this);
					}
		  			/* ,
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								console.log('if문 작동');
								e.preventDefault();
							}
						}
					} */
				}
  			});
});

function uploadImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/another/uploadImageFile",
		contentType : false,
		processData : false,
		success : function(data) {
			$(editor).summernote('insertImage', data.url);
		},error : function(){
			alert("업로드 실패");
		}
	});
}
//////////////////////////////////////////////
 	


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
                    marker.setPosition(coords)
                }
            });
        }
    }).open({//embed('classAddressIframe'); 팝업아닌 넣어서 표시
    	 left: (window.screen.width / 2) - (width / 2),
    	 top: (window.screen.height / 2) - (height / 2)
    });
}

/////////////////////////////////
function mapSearch(){
	var searchName = document.getElementById("roadAddress").value;
	if(searchName==""){
		alert("주소검색을 먼저 진행해 주세요");
	return; //리턴은 중단 명령어
	}
	setMapPosition(searchName,"","");
}
function feeComma(){
	
}
	

	
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
#class_short{
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
	margin-bottom:20px;
}
.dsctitle{
	color:gray;
}
.descriptionUl>li{
	font-size:1em;
}
.descriptionUl li:not(.dsctitle){
	margin-left:15px;
	font-weight:500;
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
	height:5150px; 
	margin:0 auto;
	padding:0px;
}
.followDiv{background-color:;
	width:100%;
	height:35px;
	border-bottom:3px solid lightgray;
	margin-top:30px;
	margin-bottom:30px;
}
.followDiv>ul>li{
	float:left;
	width:10%;
}
.followDiv>ul>li:nth-child(1){
	margin-left:30px;
}
.followDiv>ul>li:nth-child(8){
	width:17%;
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
	border-bottom:3px solid lightgray;
	text-align:left;
	line-height:50px;
}
.classCategoryDiv{
	width:100%;
	height:100px;
	border:2px solid lightgray;
	border-radius:8px;
	margin-top:20px;
	margin-bottom:20px;
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
	height:560px;
	border:2px solid lightgray;
	border-radius:8px;
	margin-top:20px;
	margin-bottom:20px;
	padding:20px 0px 0px 0px; 
	font-size: 1.2em;
	text-align:center;
}
#imgThumbDiv{
	border-radius:8px;
	width:400px;
	height:480px;
	border:3px solid lightgray;
	margin:0 auto;
}
#imgThumbDiv img{
	width:100%;
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
	width:400px;
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
.classDate>ul{background-color:;
	width:610px;
	height:340px;
	margin:0 auto;
	padding:0, 0, 0, 0;
}
.classDate li{
	float:left;
}
#putDateTime{
	background-color:#f1f1f1;
	width:240px;
	height:340px;
	color:#FF385C; 
	font-weight:600;
	font-size:1em;
	text-align: center;
	margin-left: 50px;
	line-height: 34px;
	border-radius:8px;
}
#putDateTime>div{
	color:#FF385C;
	margin-top:150px;
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
	border:3px solid lightgray;
	text-align: center;
}
.classAddress input[type=button]{
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
	border:3px solid lightgray;
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
#class_tag{
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
	width:18%;
	height:40px;
	border-radius:8px;
	background-color:#FF385C;
	color:white;
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
</style>
<form>
<div class="container">
	<h1>커뮤니티 게시글 작성</h1>
		<div class="classCommonDiv" id="f3">
		<span><kimin>*</kimin> 1) 클래스 카테고리 <kimin>(필수)</kimin></span>
	</div>
	<div class="classCategoryDiv">
		<ul>
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
			<li><input type="checkbox" name="categoryL" value="" class="categoryL"> 캔들/디퓨져</li> <!-- 반복문 -->
		</ul>
	</div>
	<div class="classCommonDiv" id="f4">
		<span><kimin>*</kimin> 2) 커뮤니티 썸네일 <kimin>(필수)</kimin></span>
	</div>
	<div class="classImgDiv">
			<div id="imgThumbDiv"><img src="<%=request.getContextPath()%>/img/kimin/uploadimg.png" ></div>
			<input type="button" name="imgThumb" value="클래스 썸네일 이미지 등록" class="buttonClass">
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지 비율 가로=1 : 세로=1.2 를 추천드립니다</li>
			<li>너무 큰 용량은 업로드 되지 않을 수 있습니다</li>
			<li>커뮤니티 게시글에 여러장의 이미지와 소개글을 추가 할 수 있습니다</li>
		</ul>
	</div>

	<div class="classCommonDiv" id="f2">
		<span><kimin>*</kimin> 3) 소개 <kimin>(필수)</kimin></span>
	</div>
	<div>
		<textarea name="class_short" class="inputCommonClass" placeholder="썸네일을 소개해줄 내용을 입력하세요" id="class_short"></textarea>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>썸네일을 소개해줄 설명을 간단히 적어주세요</li>

		</ul>
	</div>
	
	<div class="classCommonDiv" id="f4">
		<span><kimin></kimin> 4) 이미지1 <kimin></kimin></span>
	</div>
	<div class="classImgDiv">
			<div id="imgThumbDiv"><img src="<%=request.getContextPath()%>/img/kimin/uploadimg.png" ></div>
			<input type="button" name="imgThumb" value="이미지 등록" class="buttonClass">
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지 비율 가로=1 : 세로=1.2 를 추천드립니다</li>
			<li>너무 큰 용량은 업로드 되지 않을 수 있습니다</li>
			<li>커뮤니티 게시글에 여러장의 이미지와 소개글을 추가 할 수 있습니다</li>
		</ul>
	</div>

	<div class="classCommonDiv" id="f2">
		<span><kimin></kimin> 5) 이미지1 소개글 <kimin></kimin></span>
	</div>
	<div>
		<textarea name="class_short" class="inputCommonClass" placeholder="이미지1을 소개해줄 내용을 입력하세요" id="class_short"></textarea>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지1을 소개해줄 설명을 간단히 적어주세요</li>

		</ul>
	</div>
	<div class="classCommonDiv" id="f4">
		<span><kimin></kimin> 6) 이미지2 <kimin></kimin></span>
	</div>
	<div class="classImgDiv">
			<div id="imgThumbDiv"><img src="<%=request.getContextPath()%>/img/kimin/uploadimg.png" ></div>
			<input type="button" name="imgThumb" value="이미지 등록" class="buttonClass">
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지 비율 가로=1 : 세로=1.2 를 추천드립니다</li>
			<li>너무 큰 용량은 업로드 되지 않을 수 있습니다</li>
			<li>커뮤니티 게시글에 여러장의 이미지와 소개글을 추가 할 수 있습니다</li>
		</ul>
	</div>

	<div class="classCommonDiv" id="f2">
		<span><kimin></kimin> 7) 이미지2 소개글 <kimin></kimin></span>
	</div>
	<div>
		<textarea name="class_short" class="inputCommonClass" placeholder="이미지1을 소개해줄 내용을 입력하세요" id="class_short"></textarea>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지2를 소개해줄 설명을 간단히 적어주세요</li>

		</ul>
	</div>
		<div class="classCommonDiv" id="f4">
		<span><kimin></kimin> 8) 이미지3 <kimin></kimin></span>
	</div>
	<div class="classImgDiv">
			<div id="imgThumbDiv"><img src="<%=request.getContextPath()%>/img/kimin/uploadimg.png" ></div>
			<input type="button" name="imgThumb" value="이미지 등록" class="buttonClass">
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지 비율 가로=1 : 세로=1.2 를 추천드립니다</li>
			<li>너무 큰 용량은 업로드 되지 않을 수 있습니다</li>
			<li>커뮤니티 게시글에 여러장의 이미지와 소개글을 추가 할 수 있습니다</li>
		</ul>
	</div>

	<div class="classCommonDiv" id="f2">
		<span><kimin></kimin> 9) 이미지3 소개글 <kimin></kimin></span>
	</div>
	<div>
		<textarea name="class_short" class="inputCommonClass" placeholder="이미지1을 소개해줄 내용을 입력하세요" id="class_short"></textarea>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>이미지3를 소개해줄 설명을 간단히 적어주세요</li>

		</ul>
	</div>
	
	<div class="classCommonDiv" id="f9">
		<span>* 10) 검색 #태그 </span>
	</div>
	<div id="classFee">
		<input type="text" name="class_tag" class="inputCommonClass" placeholder="#없이 태그를 입력하세요" id="class_tag">
		<input type="button" value="추가" id="class_tagButton" class="buttonClass"><br/>
		<div id="tagInsert"></div>
	</div>
	<div>
		<ul class="descriptionUl">
			<li class="dsctitle">작성 Tip</li>
			<li>5개 태그까지 추가 할 수 있습니다</li>
			<li># 표시 없이 입력해주세요</li>
			<li>추가버튼을 누르면 항목이 밑에 표시됩니다 </li>
		</ul>
	</div>
	<div class="classApplyDiv">
		<input type="submit" value="게시글 저장" name="class_apply" id="class_apply" class="buttonClass">
	</div>
</div>
</form>




