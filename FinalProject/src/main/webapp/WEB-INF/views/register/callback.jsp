<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script>
	var naver_id_login = new naver_id_login("Rq5oeE9hVx0Z1la5Zwrc", "http://localhost:9090/another/callback");
	// 접근 토큰 값 출력
	console.log(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");

	function naverValidation(){
		member_nick = naver_id_login.getProfileData('name');
		member_email = naver_id_login.getProfileData('email');
		
		console.log(naver_id_login.getProfileData('email')); 
		
		if(member_nick == undefined || member_nick == null){
			alert("이름은 필수 정보입니다. 정보 제공을 동의해주세요.");
			naver_id_login.reprompt();
			return false;
		}
		
        if( member_email == undefined || member_email == null) {
			alert("이메일은 필수 정보입니다. 정보 제공을 동의해주세요.");
			naver_id_login.reprompt();
			return false;
		}
        
        naverSignInCallback();
	}
	
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	var url = '<%=request.getContextPath()%>/loginOk'; // 정보 가지고 가서 저장할 url
	var member_id, member_name, member_email, sns_type;
	function naverSignInCallback() {
		member_id = naver_id_login.getProfileData('email');
		member_name = naver_id_login.getProfileData('name');
		member_email = naver_id_login.getProfileData('email');
		sns_type = 'naver';

		// 함수 호출
		post_to_url(url, {'member_id': member_id, 'member_name': member_name, 'member_email' : member_email, 'sns_type': sns_type, 'logType':1 } );
	}

	function post_to_url(path, params, method='post'){
		console.log(member_id);
		// body에 form 태그 추가
		const form = document.createElement('form');
		form.method = method;
		form.action = path;
		
		// 정보 hidden으로 form 태그 안에 추가하기
		for(const key in params){
			if(params.hasOwnProperty(key)){
				const hiddenField = document.createElement('input');
				hiddenField.type = 'hidden';
				hiddenField.name = key;
				hiddenField.value = params[key];
				form.appendChild(hiddenField);
			}
		}
		// form 태그 닫기
		document.body.appendChild(form);
		
		// submit으로 전송
		form.submit();
		
		//opener.location.href = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
		//window.close();
	}
	
	
	

</script>
</body>
</html>