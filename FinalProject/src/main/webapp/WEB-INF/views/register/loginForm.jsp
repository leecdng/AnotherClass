<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/inc/register_header.jspf" %>

		<div class="contents">
			<!-- 로그인 박스 -->
			<div class="login-wrap">
				<ul class="tab-login">
					<li class="tab-login-user on"><a href="#none">회원 로그인</a></li>
					<li class="tab-login-creator"><a href="#none">강사 로그인</a></li>
				</ul>
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
					<form id="frmLogin" name="frmLogin" method="post" action="<%=request.getContextPath()%>/loginOk">
						<div class="secret-id-pw-wrap">
							<input type="hidden" id="member_id" name="member_id"/>
							<input type="hidden" id="member_pw" name="member_pw"/>
							<input type="hidden" id="member_name" name="member_name"/>
							<input type="hidden" id="member_email" name="member_email"/>
							<input type="hidden" id="nick" name="nick"/>
							<input type="hidden" id="sns_type" name="sns_type"/>
							<c:if test="${logType=='1'}">
								<input type="hidden" id="logType" name="logType" value="1"/>
							</c:if>
							<c:if test="${logType=='2'}">
								<input type="hidden" id="logType" name="logType" value="2"/>
							</c:if>
						</div>
						<!-- // 아이디, 비번 -->
						<div class="chk-login-wrap">
							<input type="checkbox"/>로그인 유지하기
						</div>
					</form>
					
					<!-- // 로그인 버튼 (자바스크립트 미설치 시 로그인 실패 화면으로 감)-->
					<div class="btn-login-wrap">
						<a href="#" onclick="validateFrm(); return false;" id="basicLogin" class="btn-login">
							<c:if test="${logType=='1'}">
								회원 로그인
							</c:if>
							<c:if test="${logType=='2'}">
								크리에이터 로그인
							</c:if>
						</a>
					</div>
					
					<div class="kakao-login">
						<a href="javascript:void(0);" onclick="kakaoLogin();" id="kakaoLogin" class="btn-login">
							<span>카카오톡 아이디로 시작하기</span>
						</a>
					</div>
					<div class="naver-login">
						<a href="javascript:void(0)" onclick="naverBtnClick();" id="naverLogin" class="btn-login">
							<span>네이버 아이디로 시작하기</span>
						</a>
						<div id="naver_id_login" class="btn-login" style="display:none;">
							<span>네이버 아이디로 시작하기</span>
						</a>
					</div>
					
					<div class="find-account">
						<a href="#">아이디 찾기</a>
						<span> | </span>
						<a href="#">비밀번호 찾기</a>
					</div>
					
					<div class="btn-signup-wrap">
						<c:if test="${logType=='1'}">
							<a href="<%=request.getContextPath()%>/register" id="basicSignup" class="btn-login">
								<span>회원가입</span>
							</a>
						</c:if>
						<c:if test="${logType=='2'}">
							<a href="<%=request.getContextPath()%>/registerCreator" id="basicSignup" class="btn-login">
								<span>크리에이터 가입</span>
							</a>
						</c:if>
					</div>
				</div>
				<!-- // 로그인 입력 공간 -->
			</div>
			<!-- // 로그인 박스 -->
		</div>	
		
		
<%@ include file="/inc/register_footer.jspf" %>