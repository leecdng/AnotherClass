<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/inc/register_header.jspf" %>


<style>


#wrap{
	margin-top:150px;
}

.login-wrap .input-login-wrap{
	padding-bottom:0px;
}


</style>
		<div class="contents">
			<!-- 로그인 박스 -->
			<div class="login-wrap">
				<div class="input-login-wrap">
					<!-- 보여지는 로그인폼 -->
					<div class="id-pw-wrap">
						<div class="input-id input-row">
							<input type="text" id="view_id" placeholder="아이디" title="아이디" maxlength="16"/>
						</div>
						<div class="input-pw input-row">
							<input type="password" id="view_pw" placeholder="비밀번호" title="비밀번호" maxlength="16"/>
						</div>
					</div>
					<div class="input-hidden">
						<input type="hidden" id="RSAModulus" value="${RSAModulus }"/>
						<input type="hidden" id="RSAExponent" value="${RSAExponent }"/>
					</div>
					<!-------- 실제 넘어가는 로그인 폼 --------->
					<form id="frmLogin" name="frmLogin" method="post" action="<%=request.getContextPath()%>/adminLoginOk">
						<div class="secret-id-pw-wrap">
							<input type="hidden" id="member_id" name="member_id"/>
							<input type="hidden" id="member_pw" name="member_pw"/>
						</div>
						<!-- // 아이디, 비번 -->
						<div class="chk-login-wrap">
							<input type="checkbox"/>로그인 유지하기
						</div>
					</form>
					
					<!-- // 로그인 버튼 - 자바스크립트 미설치 시 로그인 실패 화면-->
					<div class="btn-login-wrap">
						<a href="#" onclick="validateFrm(); return false;" id="basicLogin" class="btn-login">
							관리자 로그인
						</a>
					</div>
					
					<div class="find-account">
						<a href="#">아이디 찾기</a>
						<span> | </span>
						<a href="#">비밀번호 찾기</a>
					</div>
					<!-- 
					<div class="btn-signup-wrap">
						<a href="<%=request.getContextPath()%>/register" id="basicSignup" class="btn-login">
							<span>회원가입</span>
						</a>
					</div>
					-->
				</div>
				<!-- // 로그인 입력 공간 -->
			</div>
			<!-- // 로그인 박스 -->
		</div>	
		


<%@ include file="/inc/register_footer.jspf" %>














