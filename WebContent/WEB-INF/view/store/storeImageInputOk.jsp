<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	  if(${result} > 0 ){
		  alert("사진등록 완료!");
		  location.href="storeMain.do?rCid=${rCid}";
	  }else{
		  alert("사진등록 실패!");
		  history.back();
	  }
});
</script>
</head>
<body>
</body>
</html>