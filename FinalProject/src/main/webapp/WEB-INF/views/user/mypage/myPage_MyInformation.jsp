<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="myPageTop.jspf" %>
<link href="<%=request.getContextPath()%>/css/user/accountEdit.css" rel="stylesheet" type="text/css"/>
<script>
$(()=>{
	const checkEng = /[a-z|A-Z|0-9]/;
	const checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	
	function modelMenuSeting(){
		var modal = '';
		modal += '<div class="myPage-information-back" style="display:none">';
		modal += '<div class="myPage-information-box" style="display:none">';
		modal += '<div class="myPage-information-popup" id="myPage-popup-view" style="display:none">';
		modal += '<button class="myPage-popup-close-button">X</button>';
		modal += '<h2 class="popup-title"></h2>';
		modal += '<ul class="information-popup-ul"></ul>';
		modal += '</div>';
		modal += '</div>';
		modal += '</div>';
		$('body').prepend(modal);
	}
	modelMenuSeting();
	
	$(document).on('click','.myPage-popup-close-button',function() {
		$('.myPage-information-back').css('display','none');
		$('.myPage-information-box').css('display','none');
		$('#myPage-popup-view').css('display','none');
	});
	
	$(document).on('click','.account_pic_edit',function() {
		document.getElementById('myPage-popup-view').className = "myPage-information-popup";
		$('.myPage-information-back').css('display','block');
		$('.myPage-information-box').css('display','block');
		$('#myPage-popup-view').css('display','block');
		$('.information-popup-ul').empty();
		$('.popup-title').html('이미지 업로드');
		var fileHtml = '';
		var imageHtml = '';
		let url= 'imageEdit';
		$.ajax({
			//url:url
			type:'POST'
			,success:function(result){
				fileHtml+='<li class="myPage-accountView-picther">';
				fileHtml+='<img id="image-account" src="${vo.member_img }">';
				fileHtml+='</li>';
				fileHtml+='<li class="information-box-img">';
				fileHtml+='<input type="file" style="float:right" class="popup-input-img" id="member_file" />';
				fileHtml+='</li>';
				fileHtml+='<li class="information-box-img">';
				fileHtml+='<input type="button" value="파일전송" style="float:right" class="popup-input-button" id="image-input-button"/>';
				fileHtml+='</li>';
				$('.information-popup-ul').html(fileHtml);
			} 
			,error:function(error){
				console.log(error);
			}	
		});
	});
	
	$(document).on('click','.account_pwd_edit',function() {
		document.getElementById('myPage-popup-view').className = "myPage-information-popup-long";
		$('.myPage-information-back').css('display','block');
		$('.myPage-information-box').css('display','block');
		$('#myPage-popup-view').css('display','block');
		$('.information-popup-ul').empty();
		$('.popup-title').html('비밀번호 수정');
		var pwdHtml = '';
		let url= 'pwdEdit';
		$.ajax({
			//url:url
			type:'POST'
			,success:function(result){
				pwdHtml+='<li class="information-box-title">현재 비밀번호</li>';
				pwdHtml+='<li class="information-box-pwd">';
				pwdHtml+='<input type="password" class="popup-input-pwd"  id="member_pw" autocomplete=”off” maxlength="15" />';
				pwdHtml+='</li>';
				pwdHtml+='<label id="info-pword"></label>';
				pwdHtml+='<li class="information-box-title">새 비밀번호</li>';
				pwdHtml+='<li class="information-box-pwd">';
				pwdHtml+='<input type="password" class="popup-input-pwd" name="member_pw" id="new_member_pw" autocomplete=”off” maxlength="15" />';
				pwdHtml+='</li>';
				pwdHtml+='<label id="info-pword-format"></label>';
				pwdHtml+='<li class="information-box-title">새 비밀번호 확인</li>';
				pwdHtml+='<li class="information-box-pwd">';
				pwdHtml+='<input type="password" class="popup-input-pwd"  id="member_pw_check" autocomplete=”off” maxlength="15" />';
				pwdHtml+='</li>';
				pwdHtml+='<label id="info-pword-check"></label>';
				pwdHtml+='<button id="pword-button">버튼</button>';
				$('.information-popup-ul').html(pwdHtml);
			} 
			,error:function(error){
				console.log(error);
			}	
		});
	});
	
	$(document).on('propertychange change keyup paste input','#member_pw ',function passWordCheck(){
		const checkPath = 'accountCheck';
		var pwd = $('#member_pw').val();
		var data = {"pwd":pwd};
			$.ajax({
				url: checkPath
				, type: 'POST'
				, data: data
				, success:function(result){
					if(result!='YES'){
						document.querySelector('#info-pword').style.color = "#22b14d"
						document.getElementById('info-pword').innerHTML="일치한 비밀번호";
						$('#account_edit_pwd_check').val('Y');
					}else{
						$('#info-pword').css("color","#ff0000");
						document.getElementById('info-pword').innerHTML="비밀번호가 맞지 않습니다.";
						$('#account_edit_pwd_check').val('N');
					}
				}
				, error:function(error){
					console.log(error)
				}
			});
		});
	$(document).on('propertychange change keyup paste input','#new_member_pw ,#member_pw_check',function passWordChecking(){
		const check1 = $('#new_member_pw').val();
		const check2 = $('#member_pw_check').val();
		const checking = document.querySelector('#new_member_pw').value;
		if(checking.length < 8 || checking.length > 20){
			$('#info-pword-format').css("color","#ff0000");
			document.getElementById('info-pword-format').innerHTML="비밀번호는 8자 이상 생성 가능합니다.";
			$('#account_edit_pwd_check').val('N');
		}else{
			if(check1 != "" || check2 != ""){
				$('#info-pword-check').css("color","#ff0000");
				$('#info-pword-check').html("비밀번호가 일치하지 않습니다.");
				$('#account_edit_pwd_check').val('N');
				if(check1 == check2){
					$('#info-pword-check').css("color","#22b14d");
					$('#info-pword-check').html("비밀번호가 일치합니다.");
					$('#account_edit_pwd_check').val('Y');
				}
			}
		}
		
	});
	
	$(document).on('propertychange click','#pword-button',function passWordRun(){
		const mapingPath = 'pwordChain';
		const pass = $('#new_member_pw').val();
		const passData = {"pwd":pass};
			$.ajax({
				url: mapingPath
				, type: 'POST'
				, data: passData
				, success:function(result){
					alert('비밀번호가 변경되었습니다.');
					location.reload();
				}
				, error:function(error){
					console.log(error)
				}
			});
		
		
	});
	function email_Set(){
		var emailSet;
		document.getElementById('member_email-chan').value = document.getElementById('member_email_id').value + '@' +document.getElementById('member_email_addr').value;
		emailSet = document.getElementById('member_email-chan').value;
		console.log(emailSet);
		return emailSet;
	}
	
	$('#member_email_id, #member_email_addr').on('propertychange change keyup paste input',function emailSeting(){
		var eID = $('#member_email_id').val();
		var addrEmail =$('#member_email_addr').val();
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		if(!checkEng.test(eID) && !checkEng.test(addrEmail)){
			$('#account_edit_emailCh_text').css("color","#ff0000");
			$('#account_edit_emailCh_text').html("사용 불가능한 이메일 입니다.");
			$('.account_edit_email_check').val('N');
			console.log($('.account_edit_email_check').val());
		}else{
			$('#account_edit_emailCh_text').css("color","#22b14d");
			$('#account_edit_emailCh_text').html("사용가능한 이메일 입니다.");
			var emailVal = eID+'@'+addrEmail;
			$('#member_email').attr('value',emailVal);
			$('.account_edit_email_check').val('Y');
			email_Set();
		}
	});
	
	$('#member_tel').on('propertychange change keyup paste input',function telCheck(){
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/g, '' ) );
		var tel = $('#member_tel').val();
		var numChk = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		if(numChk.test(tel)){
			$('.account_edit_tel_check').val('Y');
			$('#member_tel').attr('readonly','true');
			$('#account_edit_tel_text').css("color","#22b14d");
			$('#account_edit_tel_text').html("사용가능한 전화번호");
			$('#member_tel').click(function(){
				$('#member_tel').removeAttr('readonly');
			});	
		}else{
			$('#account_edit_tel_text').css("color","#ff0000");
			$('#account_edit_tel_text').html("전화번호 형식이 맞지 않습니다.");
			$('.account_edit_tel_check').val('N');
		}
	});
	

	
	});
	function inputClick(data) {
		data.readOnly = false;
	}
	
	$(document).ready(function(){
		var emailData;
	    email = '${vo.member_email}';
	    emailSplit = email.split('@');
	    document.getElementById('member_email_id').value = emailSplit[0];
	    document.getElementById('member_email_addr').value = emailSplit[1]; 
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                document.getElementById('account_post_no').value = data.zonecode;
                document.getElementById("account_addr1").value = roadAddr;
                document.getElementById('member_addr_Data').value = roadAddr;
            }
        }).open();
    }
</script>
<script>
var serverName = '<%=request.getServerName() %>';
var serverPort = <%=request.getServerPort() %>;
$(()=>{
	var fileList;
	$(document).on('click','#image-input-button', function uploadFiles(e){
			var file = $('#member_file')[0].files[0]
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
	        		document.getElementById('image-account').src ='http://'+serverName+':'+serverPort+fileList;
	        		document.getElementById('myPage-account-image').src ='http://'+serverName+':'+serverPort+fileList;
	        		document.getElementById('image-file-path').value ='http://'+serverName+':'+serverPort+fileList;
	        		document.getElementById('account_send').submit();
	        		alert(imageData.url);
	        	}
	      		,error: function(error){
	      			console.log(error);
	      			console.log('파일업로드 실패');
	      		}
	      	});
		});
});
</script>	
<style>
	.myPage-accountView-title{
		padding:10px;
	}
	.myPage-accountView-View{
		margin-top:70px;
	}
	.myPage-popup-close-button{
		float: right;
		width:20px;
		height: 30px;
		background-color: #fafafa;
		border:1px solid #b0aeae;
		border-radius: 4px;
	}
	.information-popup-ul{
		margin-top:5px;
		height:200px;		
		padding:10px;
	}
	.popup-input-pwd{
		outline: 0;
		border: none;
		padding: 10px;
		font-size: 16px;
		width: 90%;	
	}
	.popup-input-img{
		padding: 10px;
		font-size: 16px;
		width: 90%;	
	}
	.popup-input-button{
		float: right;
		width:200px;
		height: 30px;
		background-color: #fafafa;
		border:1px solid #b0aeae;
		border-radius: 4px;
	}
	.information-box-pwd{
		border: 1px solid #e5e5e5;
		margin:5px;
		width: 350px;
		height: 42px;
	}
	.information-box-img{
		float:left;
		margin:5px;
		width: 250px;
		height: 50px;
	}
	#myPage-account-image, #image-account{
		max-height:100%;
		height: auto;
		display:block;
	}
	.myPage-accountView-menu{
		margin-left: 20px;
	}
	.myPage-accountView-picther{
		float: left;
		margin-left: 7.5px;
		border:1px solid black;
		border-radius: 10px;
		width: 150px;
		height: 150px;
		overflow: hidden;
	}
	.myPage-accountView-ul{
		width: 700px;
		height: 150px;
		padding:10px;		
		float: left;
	}
	.myPage-accountView-main{
		width: 1000px;
	}
	.myPage-accountView-box, .myPage-accountView-box-email, .myPage-accountView-box-addr, .myPage-accountView-box-infoAddr{
		width: 580px;
		height: 50px;
		margin: 5px;	
		float: left;
	}
	.myPage-accountView-box-addr{
		width: 580px;
	}
	.myPage-accountView-box-infoAddr{
		width: 500px;
	}
	.myPage-accountView-box-email{
		width: 600px;
	}
	.myPage-accountView-info-list{
		margin-top:20px;
		float: left;
		border-top:1px solid #c2c2c2;
		width: 1000px;
		height: 400px;
	}
	.myPage-accountView-info{
		padding:5px;
		border-bottom: 1px solid #f5f5f5;
		width: 800px;
		float: left;
	}
	.myPage-accountView-box-title, .myPage-accountView-box-title-addr{
		float:left;
		width:100px;
		height:50px;
		text-align: center;
		line-height: 50px;
		font-size: 1.1em;
	}
	.account_edit_emailCh_text{
		height: 30px;
	}
	.account_edit_addr_button, .account_pic_edit, .account_edit_sending, .account_pwd_edit{
		margin:5px;	
		width:70px;
		height:40px;	
		float:left;	
		background-color: #fafafa;
		border:1px solid #b0aeae;
		border-radius: 4px;
	}
	.account_pic_edit{
		width:120px;
		height:30px;
	}
	.account_pwd_edit{
		width:120px;
		height:30px;
	}
	.account_edit_addr_button:active, .popup-input-button:active, .account_pic_edit:active, .account_edit_sending:active, .myPage-popup-close-button:active , .account_pwd_edit:active{
		background-color: #ededed;
	}
	.myPage-account-name{
		font-size: 1em;
	}
	.myPage-accountView-box-title-addr{
		height:100px;
		line-height: 100px;
	}
	.myPage-information-back{
		background-color: rgba(0, 0, 0, 0.3);
		position: fixed;
		width:100%;
		height:100vh;
		z-index:1000;
	}
	.myPage-information-box{
  		position: relative;
 	 	width: 100%;
 	 	height: 100%;
	}
	.myPage-information-popup{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #ffffff;
		box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
		width: 500px;
		height: 300px;
		padding:10px;
		border-radius: 10px;
	}
	.myPage-information-popup-long{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #ffffff;
		box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
		width: 500px;
		height: 400px;
		padding:10px;
		border-radius: 10px;
	}
</style>

<div>
	<div>
		<div class="myPage-accountEdit-main">
			<div class="myPage-accountView-View">
				<div class="myPage-accountView-menu">
						<div class="myPage-accountView-title">
							<h2>회원 정보 수정</h2>
						</div>
						
						<div class="myPage-accountView-main">
							<div class="myPage-accountView-picther">
								<img id="myPage-account-image" src="${vo.member_img }">
							</div>
							<ul class="myPage-accountView-ul">
								<li>
									<button class="account_pic_edit">프로필 사진수정</button>
								</li>
								<li>
									<button class="account_pwd_edit">비밀번호 변경</button>
								</li>
							</ul>
							
							<form method="post"  id="account_send"  action="MyinformationEdit" >
							<ul class="myPage-accountView-info-list">
								<li class="myPage-accountView-info">
								<span class="myPage-accountView-box-title">이름</span>
									<span class="myPage-accountView-box">
										<span class="account_edit_input-outline">
											<span class="account_edit_input-box">
												<input type="text" id="member_name" value="${vo.member_name }" class="account_edit_input" readonly/>				
											</span>
										</span>
									</span>
								</li>
								<li class="myPage-accountView-info">
								<span class="myPage-accountView-box-title">전화번호</span>
									<span class="myPage-accountView-box">
										<span class="account_edit_input-outline">
											<span class="account_edit_input-box">
												<input type="text" id="member_tel" name="member_tel" value="${vo.member_tel}" onclick="inputClick(this)" class="account_edit_input" placeholder="-를 포함하여 입력해주세요" autocomplete=”off” maxlength="13" readonly/>				
											</span>
												<label id="account_edit_tel_text"></label>	
										</span>
									</span>
								</li>
								
								<li class="myPage-accountView-info">
								<span class="myPage-accountView-box-title">이메일</span>
									<span class="myPage-accountView-box-email">
										<span class="account_edit_input-outline" id="account_edit_input_email">
											<span class="account_edit_input-box">
												<input type="text" id="member_email_id" name="member_email_id" class="account_edit_input_email"  onclick="inputClick(this)" placeholder="이메일" autocomplete=”off” maxlength="15"/>
											</span>
										</span>
										<span class="member_email_AtSign">@</span>	
										<span class="account_edit_input-outline" id="account_edit_input_email_addr">
												<span class="account_edit_input-box">
													<input type="text" id="member_email_addr" name="member_email_addr" class="account_edit_input_email" onclick="inputClick(this)" placeholder="직접입력" autocomplete=”off” maxlength="12"/>
												</span>
										</span>
										<label id="account_edit_emailCh_text"></label>	
									</span>
								</li>
								<li class="myPage-accountView-info">
								<span class="myPage-accountView-box-title-addr">주소</span>
									<span class="myPage-accountView-box-addr">
										<span class="account_edit_input-outline">
											<span class="account_edit_input-box-addr">
												<input type="text" id="member_addr_Data" class="account_edit_input" value="${vo.addr1}"  onclick="daumPostcode()" placeholder="주소검색" readonly/>				
											</span>
										</span>
									</span>
									<span class="myPage-accountView-box-infoAddr">
										<span class="account_edit_input-outline">
											<span class="account_edit_input-box-addr">
												<input type="text" id="member_addr" name="addr2" value="${vo.addr2}" class="account_edit_input" onclick="inputClick(this)"  placeholder="상세주소"  autocomplete=”off” maxlength="30" readonly/>				
											</span>
										</span>
									</span>
									<input type="button" class="account_edit_addr_button" value="주소검색" onclick="daumPostcode()" />
									<input type="hidden" id="member_email" value="${vo.member_email }"/>
									<input type="hidden" id="member_email-chan" name="member_email" value="${vo.member_email }"/>
									<input type="hidden" id="account_post_no" name="post_no" value="${vo.post_no }"/>	
									<input type="hidden" id="account_addr1" name="addr1" value="${vo.addr1 }"/>
									<input type="hidden" id="image-file-path" name="member_img" value="${vo.member_img}"/>
									<input type="hidden" id="account_edit_pwd_check" value="Y"/>
								</li>
							</ul>
							<input type="submit" class="account_edit_sending" value="수정완료"/>
							</form>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="myPageBottom.jspf" %>