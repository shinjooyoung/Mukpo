<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("${ message }");
	if(${result} > 0){
		location.href="/user/userMypagePoint.do"
	} else {
		history.back();
	}
</script>
</body>
</html>