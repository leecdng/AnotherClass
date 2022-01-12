<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>



var result = confirm("장바구니로 이동하시겠습니까?");
if(result){
	 location.href = "mypage/mypage2";
}else{
	history.back();
}
</script>
</body>
</html>