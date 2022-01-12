	$(()=>{	
			$('.register_button').click(function(){
				//최종 전송
				var chk1 = $('.register_id_check').val();
				var chk2 = $('.register_pwd_check').val();
				var chk3 = $('.register_email_check').val();
				
				if(chk1 != 'Y' || chk2 != 'Y' || chk3 != 'Y'){
					return false;
				}
				$('.register_form').submit();
			});
		});
