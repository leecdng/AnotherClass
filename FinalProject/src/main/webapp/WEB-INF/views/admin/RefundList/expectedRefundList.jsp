<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	function refundSeting(data){
		if(data == null){
			data = '환불대기중'
		}else{
			data = '환불완료'
		}
		return data;
	}
	function refundnullSeting(data){
		if(data == null){
			data = '';
		}
		return data;
	}
	let url="RefundMangement/RefundList";
	function memberListAjax(){
		var number = $('.paging-number').val();
		var board= '';
		let searchWord = document.querySelector('#searchWord').value;
		let dateSearchFirst = document.querySelector('#dateSearchFirst').value;
		let dateSearchLast = document.querySelector('#dateSearchLast').value;
		const data = {"number":number , "searchWord":searchWord , "dateSearchFirst":dateSearchFirst ,"dateSearchLast":dateSearchLast};
		$.ajax({
			url : url
			,type :"POST"
			,data : data
			,success:function(result){
				var listData = $(result);
				listData.each(function(idx,vo){
					let refund= refundSeting(vo.refund_date);
					let refundSet= refundnullSeting(vo.refund_date);
					board +='<li class="userMg-chart-boardlist">'+vo.order_no+'';
					board +='</li>';
					board +='<li class="userMg-chart-boardlist" id="userMg-chart-id">'+vo.member_id+'</li>';
					board +='<li class="userMg-chart-boardlist">'+vo.pay_company+'</li>';
					board +='<li class="userMg-chart-boardlist">'+vo.order_date+'</li>';
					board +='<li class="userMg-chart-boardlist">'+refundSet+'</li>';
					board +='<li class="userMg-chart-boardlist">'+refund+'</li>';
					board +='<li class="userMg-chart-boardlist">';
					if(refund == '환불대기중'){
						board +='<input type="button" value="환불" class="account_information_button" id="account_information_btn"/>';
					}
					board +='<input type="hidden" value="'+vo.order_no+'" id="userMg-chart-id"/>';
					board +='<input type="hidden" value="'+vo.class_option_no+'" id="userMg-chart-id"/>';
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
		var btnList = "";
		$.ajax({
			url : 'RefundMangement/btnList'
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

	$(document).on('click','#account_information_btn',function(){
		let delectidInfo = $('#account_information_btn').next().val();
		let deleteOrder = $('#account_information_btn').next().next().val();
		console.log(deleteOrder);
		const deleteNumber = delectidInfo;
		const deleteAccount = "RefundMangement/RefundDelete";
		const accountData = {"no":deleteNumber};
		$.ajax({
			url : deleteAccount
			,type : "POST"
			,data : accountData
			,success:function(success){
				alert('환불처리완료');
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
	
	.account_information_button{
		padding: 3px 10px 3px 10px;
		border: 1px solid #464646;
	    background-color: #f0f0f0;
	    color: #464646;
	}
		
	.userMg-chart-boardlist{
		color: #000000;
		float: left;
		width:10%;
		height: 40px;
		line-height: 40px;
		text-align:center;
		background:#f0f0f0;
		border:1px solid #f0f0f0;
	}
	
	.userMg-chart-boardlist:nth-child(7n+1){
		width: 10%;
	}
	
	.userMg-chart-boardlist:nth-child(7n+2){
		width: 10%;
	}
	
	.userMg-chart-boardlist:nth-child(7n+3){
		width: 10%;
	}
	.userMg-chart-boardlist:nth-child(7n+4){
		width: 20%;
	}
	.userMg-chart-boardlist:nth-child(7n+5){
		width: 20%;
	}
	.userMg-chart-boardlist:nth-child(7n+6){
		width: 20%;
	}
	.userMg-chart-boardlist:nth-child(7n+7){
		width: 10%;
	}
	.userMg-chart-boardlist:nth-child(n+8){
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
				<h1 class="userMg-title">환불목록</h1>
			</div>
		
		<div class="userMg-bottom">
			<div class="search-box">
				<input type="text" id="searchWord"  placeholder="아이디검색"/>
				<input type="date" id="dateSearchFirst" value="2020-10-01"/>
				<label>~</label>
				<input type="date" id="dateSearchLast" value="2021-12-01"/>
				<input type="button" id="serahButton"  value="검색"/>
			</div>
			<input type="hidden" value="1" class="paging-number"/>
			<ul class="userMg-chart-box">
				<li class="userMg-chart-boardlist">주문번호</li>
				<li class="userMg-chart-boardlist">아이디</li>
				<li class="userMg-chart-boardlist">은행사</li>
				<li class="userMg-chart-boardlist">환불신청일</li>
				<li class="userMg-chart-boardlist">환불완료일</li>
				<li class="userMg-chart-boardlist">상태</li>
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
