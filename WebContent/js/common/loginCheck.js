$(document).ready(function(){
	 $("#UserMmain").click(function() {
	      location.href = "/common/userMmain.do";
	   });
	   $("#UserPmain").click(function(){
	      location.href = "/common/userPmain.do";
	   });
	   
	   $('#mypage').click(function(){
		   if ($("#mId").val() == null || $("#mId").val() == ""){
			   location.href = "/user/userLogin.do"
		   } else {
			   location.href="/reserve/userMypageReservList.do" // 1206 주용수정
		   }
		   
	   
	   });
});