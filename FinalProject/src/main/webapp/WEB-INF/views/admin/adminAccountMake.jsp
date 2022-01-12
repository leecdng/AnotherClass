<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<form class="make_account" method="post" action="accountMake">
		<input type="text"     class="account_input_list" id="id-input-box" autocomplete=”off” maxlength="15"/>
		<input type="password" class="account_input_list" id="pw-input-box" autocomplete=”off” maxlength="16"/>
		<input type="hidden" name="additional_information_one"/>
		<input type="hidden" id="member_id" name="member_id"/>
		<input type="hidden" id="member_pw" name="member_pw"/>
		<input type="submit" value="계정생성"/>
	</form>
</div>
	
	