<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>먹고갈래? 포장할래?</title>
</head>
<body>
<script>
alert("${ message }");
if(${result} > 0){
	location.href="/user/userMypageInfoModifyMain.do";
} else {
	history.back();
}
</script>
</body>
</html>