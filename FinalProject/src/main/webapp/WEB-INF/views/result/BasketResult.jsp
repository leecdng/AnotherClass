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



var result = confirm("��ٱ��Ϸ� �̵��Ͻðڽ��ϱ�?");
if(result){
	 location.href = "mypage/mypage2";
}else{
	history.back();
}
</script>
</body>
</html>