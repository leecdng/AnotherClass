<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을 수 없습니다.</title>
<link href="<%=request.getContextPath()%>/css/error.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="error-main">
		<h1 class="logo ir-text"><a href="/another">어나더클래스</a></h1>
		<div class="error-text-box">
			<h2>페이지를 찾을수 없습니다.</h2>
		</div>
	</div>
</body>
</html>