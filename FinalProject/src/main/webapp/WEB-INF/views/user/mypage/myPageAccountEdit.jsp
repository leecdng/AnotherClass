<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 전용 페이지입니다.</title>
	<style type="text/css">
		.account-edit-setingList:nth-of-type(2n+1) {
			background: gray;
		}
	</style>
</head>
<body>
	<div>
		<div>
			<div class="account-edit-title">
				<h1> 개인 정보 수정 </h1>
			</div>
		</div>
		
		<div>
			<div>
				<ul>
					<li class="account-edit-setingList">이름</li>
					<li class="account-edit-setingList">
						<span></span>
						<input type="button"/>
					</li>
					<li class="account-edit-setingList">휴대전화</li>
					<li class="account-edit-setingList">
						<span></span>
						<input type="button"/>
					</li>
					<li class="account-edit-setingList">이메일</li>
					<li class="account-edit-setingList">
						<span></span>
						<input type="button"/>
					</li>
					<li class="account-edit-setingList">주소</li>
					<li class="account-edit-setingList">
						<span></span>
						<input type="button"/>
					</li>
					<li class="account-edit-setingList">닉네임수정</li>
				</ul>			
			</div>
		</div>
	</div>
</body>
</html>