$(function() {
	$("#userloginspan").click(function() {
		location.href = "userLogin.do";
	});

});

$(window).load(function() {
	var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

			var locPosition = new daum.maps.LatLng(lat, lon) // 마커가 표시될 위치를
																// geolocation으로
																// 얻어온 좌표로 생성합니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition) {

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map,
			position : locPosition
		});
		

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
});

