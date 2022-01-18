$(()=>{
			var url = 'register/check';
			var checkEng = /[a-z|A-Z|0-9]/;
			var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			$('#member_id').keyup(function(){
				var id = $('#member_id').val();
				var data = {"id":id};
				// 아이디 조회
				$.ajax({
					url: url
					, type: 'POST'
					, data: data
					, success:function(result){
							
							if(id.length< 5 || id.length > 15){
								$('#register_id_text').css("color","#ff0000");
								document.getElementById('register_id_text').innerHTML="아이디는 5~ 15자의 영문과 숫자로만 사용가능합니다.";
								$('.register_id_check').val('N');
							}else{
								if(checkEng.test(id)){
									if(result=='YES'){
										$('#register_id_text').css("color","#22b14d");
										document.getElementById('register_id_text').innerHTML="사용가능한 아이디입니다";
										$('.register_id_check').val('Y');
									}else{
										$('#register_id_text').css("color","#ff0000");
										document.getElementById('register_id_text').innerHTML="사용중이거나 삭제된 아이디 입니다.";
										$('.register_id_check').val('N');
									}
								}else{
									$('#register_id_text').css("color","#ff0000");
									document.getElementById('register_id_text').innerHTML="아이디는 5~ 15자의 영문과 숫자로만 사용가능합니다.";
									$('.register_id_check').val('N');
								}
							}
						}
					
					, error:function(error){
						console.log(error)
					}
				});
				
			});
			$('#member_pw_check, #member_pw').on('propertychange change keyup paste input',function passWordCheck(){
				var checkPwd = $('#member_pw').val();
				if(checkPwd.length < 8 || checkPwd.length > 20){
					$('#register_pwd_text').css("color","#ff0000");
					$('#register_pwd_text').html("비밀번호는 8자 이상 생성 가능합니다.");
					$('.register_pwd_check').val('N');
				}else{
					$('#register_pwd_text').css("color","#22b14d");
					$('#register_pwd_text').html("사용가능한 비밀번호");
					$('.register_pwd_check').val('Y');
				}
			});
			$('#member_pw_check').on('propertychange change keyup paste input',function passWordChecking(){
				var check1 = $('#member_pw').val();
				var check2 = $('#member_pw_check').val();
				if(check1 != "" || check2 != ""){
					$('#register_pwdCh_text').css("color","#ff0000");
					$('#register_pwdCh_text').html("비밀번호가 일치하지 않습니다.");
					$('.register_pwd_check').val('N');
					if(check1 == check2){
						$('#register_pwdCh_text').css("color","#22b14d");
						$('#register_pwdCh_text').html("비밀번호가 일치합니다.");
						$('.register_pwd_check').val('Y');
					}
				}
			});
			$('#member_email_id, #member_email_addr').on('propertychange change keyup paste input',function emailSeting(){
				var eID = $('#member_email_id').val();
				var addrEmail =$('#member_email_addr').val();
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
				if(!checkEng.test(eID) && !checkEng.test(addrEmail)){
					$('#register_emailCh_text').css("color","#ff0000");
					$('#register_emailCh_text').html("사용 불가능한 이메일 입니다.");
					$('.register_email_check').val('N');
					console.log($('.register_email_check').val());
				}else{
					$('#register_emailCh_text').css("color","#22b14d");
					$('#register_emailCh_text').html("사용가능한 이메일 입니다.");
					var emailVal = eID+'@'+addrEmail;
					$('#member_email').attr('value',emailVal);
					$('.register_email_check').val('Y');
				}
			});
			
			$('#member_tel').on('propertychange change keyup paste input',function telCheck(){
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/g, '' ) );
				var tel = $('#member_tel').val();
				var numChk = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
				if(numChk.test(tel)){
					$('.register_tel_check').val('Y');
					$('#member_tel').attr('readonly','true');
					$('#register_tel_text').css("color","#22b14d");
					$('#register_tel_text').html("사용가능한 전화번호");
				}else{
					$('#register_tel_text').css("color","#ff0000");
					$('#register_tel_text').html("전화번호 형식이 맞지 않습니다.");
					$('.register_tel_check').val('N');
				}
			});
		});