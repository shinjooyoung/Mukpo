$(document).ready(function(){
	 $("#UserMmain").click(function() {
	      location.href = "userMmain.do";
	   });
	   $("#UserPmain").click(function(){
	      location.href = "userPmain.do";
	   });
	   
	   $('#mypage').click(function(){
		   if ($("#mId").val() == null || $("#mId").val() == ""){
			   location.href = "/user/userLogin.do"
		   } else {
			   location.href="/reserve/userMypageReservList.do" // 1206 주용수정
		   }
		   
	   
	   });
	   $('#logout').click(function(){
		   location.href = "/common/index.do"
		   
			   
	   });
});