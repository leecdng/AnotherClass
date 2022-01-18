<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/admin/memberManagement/memberManagement.js"></script> --%>
<%-- <link href="<%=request.getContextPath()%>/css/admin/memberManagement/memberManagement.css" rel="stylesheet" type="text/css"/>
 --%>
<script type="text/javascript">
$(function(){
	let url="MemberMangement/userAccountList";
	function replaceAt(indata){
		/* 전화번호 변경  */
		if(indata != null) {
			const telValue1 = indata.substr(10);
			const trans = telValue1.replaceAll(/[0-9|-]/gi,'*');
			const telValue2 = indata.substr(0,10);
			const telOutValue = telValue2+trans;
			indata =  telOutValue;
		}else{
			indata = '없음';
		}
 		return indata;
	}
	
	function memberListAjax(){
		var number = $('.paging-number').val();
		var board= '';
		let searchWord = document.querySelector('#searchWord').value;
		let dateSearchFirst = document.querySelector('#dateSearchFirst').value;
		let dateSearchLast = document.querySelector('#dateSearchLast').value;
		const data = {"number":number , "searchWord":searchWord , "dateSearchFirst":dateSearchFirst ,"dateSearchLast":dateSearchLast};
		$.ajax({
			url : url
			,type : "POST"
			,data : data
			,success:function(result){
				var listData = $(result);
				listData.each(function(idx,vo){
					var tel = replaceAt(vo.member_tel);
					board +='<li class="userMg-chart-boardlist">'+'이용자';
					board +='</li>';
					board +='<li class="userMg-chart-boardlist" id="userMg-chart-id">'+vo.member_id+'</li>';
					board +='<li class="userMg-chart-boardlist">'+vo.member_name+'</li>';
					board +='<li class="userMg-chart-boardlist">'+vo.member_email+'</li>';
					board +='<li class="userMg-chart-boardlist">'+tel+'</li>';
					board +='<li class="userMg-chart-boardlist">'+vo.signupdate+'</li>';
					board +='<li class="userMg-chart-boardlist"></li>';
					board +='<li class="userMg-chart-boardlist">';
					board +='<input type="button" value="상세정보" id="account_information_btn"/>';
					board +='<input type="hidden" value="'+vo.member_id+'" id="userMg-chart-id"/>';
					board +='</li>';
				});
				$(".userMg-chart-box").append(board);
			},error: function(error){
				console.log(error);
				console.log('AJAX 목록 불러오기 실패');
			}
		});
	}
	
	function buttonNumber(){
		//페이징 버튼 출력
		let searchWord = document.querySelector('#searchWord').value;
		let dateSearchFirst = document.querySelector('#dateSearchFirst').value;
		let dateSearchLast = document.querySelector('#dateSearchLast').value;
		var btnList = "";
		const data = {"searchWord":searchWord , "dateSearchFirst":dateSearchFirst ,"dateSearchLast":dateSearchLast};
		$.ajax({
			url : 'MemberMangement/btnList'
			, type : 'POST'
			, success:function(res){
				for(var i=1; i<=res; i++){
					btnList +='<input type="button" class="userMg-boardList-btn"';
					if(i>=10){
					btnList +=' style="display:none" ';
					}
					btnList += 'value="'+i+'"/>';
				}
				$('.userMg-boardList-btn-box').html(btnList);
			}
			, error: function(error){
				console.log(error);
				console.log('btn 목록 불러오기 실패');
			}
			
		});
	}
	
	$(document).on('click','.userMg-boardList-btn',function(){
		// 페이징 하단 버튼 숫자설정
		$('.paging-number').val($(this).val());
		$('.userMg-chart-boardlist:nth-child(n+9)').remove();
		
		memberListAjax();
	});
	
	function addrSeting(data,data2){
		if(data== null || data2== null) return '미등록';
		return data +' '+ data2; 
	}
	
	function snsType(data){
		if(data != 'kakao'){
			data = '일반계정';
		}
		return data;
	}
	let delectidInfo ='';
	$(document).on('click',"#account_information_btn",function(){
		let infoAccount="MemberMangement/AccountInformation";
		let idData = $(this).next().val();
		let data = {"idData":idData};
		var member_information = '';
		$.ajax({
			url : infoAccount,
			type : "POST",
			data : data,
			success:function(result){
				var infor= $(result);
				infor.each(function(idx,vo){
					const addr = addrSeting(vo.addr1,vo.addr2);
					const accountType = snsType(vo.sns_type);
					member_information += '<div class="userMg-information-back">';
					member_information += '<div class="userMg-information-box">';
					member_information += '<div class="userMg-information-popup">';
					member_information += '<h2 class="userMg-info-title">'+vo.member_name+' 회원님의 상세정보</h2>';
					member_information += '<input type="button" value="X" class="userMg-info-closeButton" />';
					member_information += '<ul class="userMg-info-popup-ul">';
					member_information += '<li>이름</li>';
					member_information += '<div class="userMg-information-popup-div">';
					member_information += '<li><input type="text" class="userMg-information-popup-input"  value="'+vo.member_name+'" readonly="true"></li>';
					member_information += '</div>';
					member_information += '<li>주소</li>';
					member_information += '<div class="userMg-information-popup-div">';
					member_information += '<li><input type="text" class="userMg-information-popup-input"  value="'+addr+'" readonly="true"></li>';
					member_information += '</div>';
					member_information += '<li>계정 타입</li>';
					member_information += '<div class="userMg-information-popup-div">';
					member_information += '<li><input type="text" class="userMg-information-popup-input"  value="'+accountType+'" readonly="true"></li>';
					member_information += '</div>';
					member_information += '<li>가입날짜</li>';
					member_information += '<div class="userMg-information-popup-div">';
					member_information += '<li><input type="text" class="userMg-information-popup-input-sing"  value="'+vo.signupdate+'" readonly="true"></li>';
					member_information += '</div>';
					member_information += '<li><input type="button" class="userMg-information-button" id="userMg-information-popup-button-del" value="삭제"/></li>';
					member_information += '</ul>';
					member_information += '</div>';
					member_information += '</div>';
					member_information += '</div>';
					delectidInfo= vo.member_id;
				});
					// 회원 상세정보 버튼 클릭시 출력되는 창
					$('.container').before(member_information);
			},error: function(error){
				console.log(error);
				console.log('AJAX 목록 불러오기 실패');
			}
			
		});
		
	});
	
	$(document).on('click','#userMg-information-popup-button-del',function(){
		var deleteId = delectidInfo;
		let deleteAccount = "MemberMangement/MemberAccountDelete";
		const accountData = {"data":deleteId};
		$.ajax({
			url : deleteAccount
			,type : "POST"
			,data : accountData
			,success:function(success){
				alert('삭제되었습니다.');
				location.reload();
			}
			,error:function(error){
				location.reload();
			}
		});
	});
	
	$(document).on('click','.userMg-info-closeButton',function(){
		$('.userMg-information-box').remove();
		$('.userMg-information-back').remove();
		$('.userMg-information-popup').remove();
	});
	$(document).on('click','#serahButton', function(){
		$('.userMg-chart-boardlist:nth-child(n+9)').remove();
		$('.userMg-boardList-btn-box').empty();
		buttonNumber();
		memberListAjax();
	});
	
	buttonNumber();
	memberListAjax();
});
</script>
<style>
	body{
		overflow:auto;
	}
	.container{
		height: 800px;
	}
	.userMg-main{
		width:1200px;
	}
	.userMg-top{
		margin-top: 3%;
	}
	.userMg-top, .userMg-bottom{
		height:20%;
		margin-bottom: 3%;
	}
	
	.userMg-menu{
		padding-top:10px;
		border-bottom: 1px solid #464646;
	}
	
	.userMg-menu-btn{
		padding: 5px;
		border:1px;
		border-bottom: none;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
	}
	
	.userMg-chart-box, .userMg-top-search{
		width:1200px;
		height:200px;
	}
	
	.userMg-chart-box{
		width:1200px;
		height:500px;
	}
	
	#account_information_btn{
		padding: 3px 10px 3px 10px;
		border: 1px solid #464646;
	    background-color: #f0f0f0;
	    color: #464646;
	}
		
	.userMg-chart-boardlist{
		color: #000000;
		float: left;
		width:15%;
		height: 40px;
		line-height: 40px;
		text-align:center;
		background:#f0f0f0;
		border:1px solid #f0f0f0;
	}
	
	.userMg-chart-boardlist:nth-child(8n+1){
		width: 10%;
	}
	
	.userMg-chart-boardlist:nth-child(8n+2){
		width: 10%;
	}
	
	.userMg-chart-boardlist:nth-child(8n+3){
		width: 10%;
	}
	.userMg-chart-boardlist:nth-child(8n+4){
		width: 20%;
	}
	.userMg-chart-boardlist:nth-child(8n+7){
		width: 5%;
	}
	
	.userMg-chart-boardlist:nth-child(n+9){
		background:white;
		font-size: 0.9rem;
	}
	.userMg-information-back{
		background-color: rgba(0, 0, 0, 0.3);
		position: fixed;
		width:100%;
		height:100vh;
		z-index:1000;
	}
	.userMg-information-box{
  		position: relative;
 	 	width: 100%;
 	 	height: 100%;
	}
	.userMg-information-popup{
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: #ffffff;
	  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	  /* 임시 지정 */
	  width: 500px;
	  height: 500px;
	}
	.userMg-information-popup{
		padding:10px;
		border-radius: 10px;
	}
	.userMg-info-popup-ul{
		margin-top: 40px;
		height: 440px;
	}
	#userMg-information-popup-button-del{
		float:left;
		width: 480px;
		padding: 7px 15px 7px 15px;
    	background-color: #464646;
    	font-size: 18px;
    	color: white;
    	border: none;
	}
	#userMg-information-popup-button-del{
		background-color: #ff6868;
	}
	.userMg-information-popup-div{
		border: 1px solid #e5e5e5;
		width: 100%;
		position: relative;
	}
	
	.userMg-boardList-btn{
		background-color: rgb(248,248,248);
		border:none;
		font-size:1.7em;
		width: 50px;
		padding: 10px;
	}
	.userMg-boardList-btn:active{
		background-color: rgb(242,242,242);
	}
	.userMg-info-closeButton{
		float: right;
	}
	.userMg-info-title{
		float: left;
		width: 400px;
	}
	.userMg-information-popup-input, .userMg-information-popup-input-sing{
		outline: 0;
		border: none;
		padding: 10px;
		font-size: 16px;
		width: 90%;
	}
	.userMg-boardList-btn-outbox{
		width:fit-content;
		margin:auto;
		height:50px;
	}
	.userMg-boardList-btn-box{
		height:50px;
		margin:auto;
	}
	.userMg-information-button{
		margin-top:100px;
	}
	.search-box{
		padding:10px;
		margin: 10px;
		border: 1px solid #333;
		width:fit-content;
		margin-left:655px;
	}
</style>
</head>
<body>
	<div class="userMg-main">
			<div class="userMg-top">
				<h1 class="userMg-title">회원목록</h1>
			</div>
		
		<div class="userMg-bottom">
			<div class="search-box">
				<input type="text" id="searchWord"  placeholder="이름검색"/>
				<input type="date" id="dateSearchFirst" value="2020-10-01"/>
				<label>~</label>
				<input type="date" id="dateSearchLast" value="2021-12-01"/>
				<input type="button" id="serahButton"  value="검색"/>
			</div>
			<input type="hidden" value="1" class="paging-number"/>
			<ul class="userMg-chart-box">
				<li class="userMg-chart-boardlist">개요</li>
				<li class="userMg-chart-boardlist">아이디</li>
				<li class="userMg-chart-boardlist">성명</li>
				<li class="userMg-chart-boardlist">이메일</li>
				<li class="userMg-chart-boardlist">휴대폰</li>
				<li class="userMg-chart-boardlist">가입일</li>
				<li class="userMg-chart-boardlist">기타</li>
				<li class="userMg-chart-boardlist">관리</li>
			</ul>
				<div class="userMg-board-margin">
					<div class="userMg-boardList-btn-outbox">
						<div class="userMg-boardList-btn-box"></div>
					</div>
				</div>
				
		</div>
	</div>
</body>
