<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>먹고갈래? 포장할래?</title>
</head>
<body>
<script>
alert("${ message }");
if(${result} > 0){ 
	location.href="/common/home.do"
} else {
	history.back();
}
</script>
</body>
</html>