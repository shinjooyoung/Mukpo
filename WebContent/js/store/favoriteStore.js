$(document).ready(function(){
	$(".favoriteImg").click(function(event){
		var src = $(this).attr("src")
		var rCid = $("#rCid").val();
		var mId = $("#mId").val();
		
		if ( $("#mId").val() == "" ){
			location.href = '/user/userLogin.do';
		} else {
			$.ajax({
				url : "/user/userFavoriteStore.do",
				type : "POST",
				dataType: "text",
				data : {	"src" : $(this).attr("src"),
							"rCid": $("#rCid").val(),
							"mId" : $("#mId").val()
						},
				success : function(data){
					var favoriteVO = decodeURIComponent(data);
					if (favoriteVO == "즐겨찾기X"){
						$(".favoriteImg").attr("src", "/images/store/likeX.png");
					} else if(favoriteVO == "즐겨찾기O"){
						$(".favoriteImg").attr("src", "/images/store/likeO.png");
					}
					
				}, 
				error : function(err) {
					
				}
			});
		}
		

	}); 
	
//	 테이블 예약 모달로 변경
	$(".reservebtn").click(function(){
		$(this).closest('form').submit();
	});
});