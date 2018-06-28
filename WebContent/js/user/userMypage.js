/**
 * 
 */

$(function() {

//	 $(".row>div").hover(function() {
//	
//	 $(".row>div").find("img").attr("src").replace("_hover", "");
//	 $(".row>div").find("h5").css("color", "#A9A9A9");
//	 var img = $(this).find("img");
//	 var font = $(this).find("h5");
//	 var src = img.attr("src").match(/[^\.]+/) + "_hover.png";
//	 font.css("color", "#e4b95b");
//	 img.attr("src", src);
//	 }, function() {
//	
//	 var img = $(this).find("img");
//	 var font = $(this).find("h5");
//	 var src = img.attr("src").replace("_hover", "");
//	 font.css("color", "#A9A9A9");
//	 img.attr("src", src);
//	 });

	var thankyou;
	$(".row>div.mypageheader").click(
			function() {
				if (thankyou === undefined) {
					var img = $(this).find("img");
					var font = $(this).find("h5");
					var src = img.attr("src").match(/[^\.]+/) + "_hover.png";
					font.css("color", "#e4b95b");
					img.attr("src", src);
					thankyou = $(this).attr('id');
				} else {

					var resrc = $("#" + thankyou).find("img").attr("src")
							.match(/[^\_]+/)
							+ ".png";
					$("#" + thankyou).find("img").attr("src", resrc);

					$("#" + thankyou).find("h5").css("color", "#A9A9A9");
					var img = $(this).find("img");
					var font = $(this).find("h5");

					var src = img.attr("src").match(/[^\.]+/) + "_hover.png";
					font.css("color", "#e4b95b");
					img.attr("src", src);
					thankyou = $(this).attr('id');

				}
			});
	
	// 마이페이지 즐겨찾기 해제
	$(".favoriteImg").click(function(event){
		var src = $(this).attr("src");
		var rCid = $(this).attr("rcid");
		var mId = $("#mId").val();
		
		if ( $("#mId").val() == "" ){
			location.href = '/user/userLogin.do';
		} else {
			$.ajax({
				url : "/user/userFavoriteStore.do",
				type : "POST",
				dataType: "text",
				data : {	"src" : $(this).attr("src"),
							"rCid": $(this).attr("rcid"),
							"mId" : $("#mId").val()
						},
				success : function(data){
					var favoriteVO = decodeURIComponent(data);
					if (favoriteVO == "즐겨찾기X"){
						$(this).attr("src", "/images/store/likeX.png");
						$("img[rcid="+rCid+"]").parents(".comment-inner-list").remove();
					} else if(favoriteVO == "즐겨찾기O"){
						$(this).attr("src", "/images/store/likeO.png");
					}
					
				}, 
				error : function(err) {
					
				}
			})
		}
	});

});