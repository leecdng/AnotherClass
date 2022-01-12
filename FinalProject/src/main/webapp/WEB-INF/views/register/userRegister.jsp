<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<title>Another Class</title>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/register/register.css" rel="stylesheet" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/register/register.js"></script>
<script src="<%=request.getContextPath()%>/js/register/registerUser.js"></script>
</head>	
	<body>
	
	<div id="wrap">
	<header id="header">
		<div class="inner-header">
			<h1 class="logo ir-text"><a href="<%=request.getContextPath()%>/">어나더클래스</a></h1>
		</div>
	</header>
	
	<article id="container">
			<div class="contents">
				<div class="login-wrap">
					<div class="input-login-wrap">
						<div class="id-pw-wrap">
							<form class="register_form" method="post" action="<%=request.getContextPath()%>/userJoin" autocomplete="off" >
								<div id="register_id" class="register_input-group">
									<span class="register_input-outline">
										<span class="register_input-box">
											<input type="text" id="member_id" name="member_id" class="register_input" placeholder="아이디" autocomplete=”off” maxlength="15" />
										</span>
											<label id="register_id_text"></label>	
									</span>
								</div>
								<div id="register_pwd" class="register_input-group">
									<span class="register_input-outline">
										<span class="register_input-box">
											<input type="password" id="member_pw" name="member_pw" class="register_input" placeholder="비밀번호" autocomplete=”off” maxlength="16" autocomplete="new-password"/>
										</span>
											<label id="register_pwd_text"></label>
									</span>
								</div>
								<div id="register_pwd" class="register_input-group">
									<span class="register_input-outline">
										<span class="register_input-box">
											<input type="password" id="member_pw_check" name="member_pw_check" class="register_input" placeholder="비밀번호확인" autocomplete=”off” maxlength="16"/>
										</span>
											<label id="register_pwdCh_text"></label>
									</span>
								</div>
								<div id="register_name" class="register_input-group">
									<span class="register_input-outline">
										<span class="register_input-box">
											<input type="text" id="member_name" name="member_name" class="register_input" placeholder="이름" autocomplete=”off” maxlength="7"/>				
										</span>
									</span>
								</div>
								<div id="register_tel" class="register_input-group">
									<span class="register_input-outline">
										<span class="register_input-box">
											<input type="text" id="member_tel" name="member_tel" class="register_input" placeholder="휴대폰번호" autocomplete=”off” maxlength="13"/>				
										</span>
											<label id="register_tel_text"></label>	
									</span>
								</div>
								<div id="register_email" class="register_input-group">
									<span class="register_input-outline" id="register_input_email">
										<span class="register_input-box">
											<input type="text" id="member_email_id" name="member_email_id" class="register_input_email" placeholder="이메일" autocomplete=”off” maxlength="15"/>
											
										</span>
									</span>
									<span class="member_email_AtSign">@</span>	
									<span class="register_input-outline" id="register_input_email_addr">
										<span class="register_input-box">
										
											<input type="text" id="member_email_addr" name="member_email_addr" class="register_input_email" placeholder="직접입력" autocomplete=”off” maxlength="12"/>
										</span>
									</span>
									<label id="register_emailCh_text"></label>	
								</div>
								<input type="hidden" id="member_email" name="member_email"/>
								<input type="hidden" class="register_id_check" value="N">
								<input type="hidden" class="register_pwd_check" value="N">
								<input type="hidden" class="register_email_check" value="N">
								<input type="hidden" class="register_tel_check" value="N">
								<button type="button" class="register_button">회원가입</button>
						</form>
				</div>
			</div>
		</div>
	</div>
</article>
</div>
</body>
</html>