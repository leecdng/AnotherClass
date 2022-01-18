$(()=>{	
			$('#member_nick').on('propertychange change keyup paste input',function nickSeting(){
					var checkNick = $('#member_nick').val();
					if(checkNick.length < 3 || checkNick.length > 20){
						$('#register_nick_text').css("color","#ff0000");
						$('#register_nick_text').html("사용불가능한 닉네임 입니다.");
						$('.register_nick_check').val('N');
					}else{
						$('#register_nick_text').css("color","#22b14d");
						$('#register_nick_text').html("사용가능한 닉네임입니다.");
						$('.register_nick_check').val('Y');register_nick_text
					}
				});
			
			
			$('.register_button').click(function(){
				//최종 전송
				var chk1 = $('.register_id_check').val();
				var chk2 = $('.register_pwd_check').val();
				var chk3 = $('.register_email_check').val();
				var chk4 = $('.register_nick_check').val();
				
				if(chk1 != 'Y' || chk2 != 'Y' || chk3 != 'Y'){
					return false;
				}
				$('.register_form').submit();
			});
		});