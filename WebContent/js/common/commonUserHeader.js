/**
 * commonUserHeader.js
 */

$(function() {
	var location = [], category = [];
	// 지역 카테고리 체크박스 클릭 했을 때
	$(".jq-checkbox").click(function() {
		$(this).each(function() {
			if( $(this).parent().parent().is("#locationdrop") ) {
				$("#loChk").text("");
				if( $(this).is(".checked") ) {
					location.push($(this).parent().text());
				} else {
					var delLo = location.indexOf($(this).parent().text());
					location.splice(delLo, 1);
				}
			} else if( $(this).parent().parent().is("#categorydrop") ) {
				if( $(this).is(".checked") ) {
					category.push($(this).parent().text());
				} else {
					var delCa = category.indexOf($(this).parent().text());
					category.splice(delCa, 1);
				}
			}
		});	
	});
	
	// 검색 버튼 누를 때
	$("#btnSearch").click(function() {
		if(location == "") {
			$("#loChk").text("지역을 선택하세요.");
			return false;
		}
		$("#sSido").val(location);
		if(category != "") {
			$("#sCate").val(category);
		}

		$("#searchForm").submit();

	});
	
	// 로그인 버튼
	$("#headerLoginJoin>img").click(function() {
		location.href="/user/userLogin.do";
	});
	
	// 검색 버튼
	$("#headerSearch>img").click(function() {
		$("#searchdrop").slideToggle();
	});

	// 먹포에 손올렸을 때
	$("#headerMP").hover(function() {
		$("#mpdrop").slideDown();
	}, function() {
		$("#mpdrop").slideUp();
	});
	
	// 로고 클릭
	$("#headerLogo>img").click(function() {
		location.href="/a/index.jsp";
	});
});