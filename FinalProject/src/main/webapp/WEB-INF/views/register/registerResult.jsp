<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Another Class</title>
</head>
<body>

<c:if test="${msgType==1 }">
	가입이 완료되었습니다.
	<a href="<%=request.getContextPath()%>/">home</a>
</c:if>

<c:if test="${msgType==2 }">
	<script>
	
	alert('회원가입에 실패했습니다. 잠시 후 다시 시도해주세요.');
	history.back();
	
	</script>
</c:if>
	
</body>
</html>