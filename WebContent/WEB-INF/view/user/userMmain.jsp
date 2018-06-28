<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>먹포 - 먹고갈래?</title>
    <link href="/plugin/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="/plugin/bootstrap/datepicker.css" rel="stylesheet">
    <link href="/plugin/font-awesome/font-awesome.css" rel="stylesheet">
    <link href="/plugin/form-field/jquery.formstyler.css" rel="stylesheet">
    <link href="/plugin/revolution-plugin/extralayers.css" rel="stylesheet">
    <link href="/plugin/revolution-plugin/settings.css" rel="stylesheet">
    <link href="/plugin/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="/plugin/owl-carousel/owl.theme.default.css" rel="stylesheet">
    <link href="/plugin/slick-slider/slick-theme.css" rel="stylesheet">
    <link href="/plugin/magnific/magnific-popup.css" rel="stylesheet">
    <link href="/plugin/scroll-bar/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/plugin/animation/animate.min.css" rel="stylesheet">
    <link href="/css/theme.css" rel="stylesheet">
    <link href="/plugin/bootstrap/minwoo.css" rel="stylesheet">
    <link href="/css/responsive.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c90936953fe2cb46c371ca9d061b1a69"></script>
<!-- <script src="/js/user/userMmain.js"></script> -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
       $(document).on('click','.sTitle',function(){
    	   $('.storeMform').submit();
       })
       $(document).ready(function() {
    	   
    	   // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    	   if (navigator.geolocation) {
    	       
    	       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    	       navigator.geolocation.getCurrentPosition(function(position) {
    	           
    	           var lat = position.coords.latitude, // 위도
    	               lon = position.coords.longitude; // 경도
    	           
    	           var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    	               message = '<div style="padding:5px;">현재위치입니다.</div>'; // 인포윈도우에 표시될 내용입니다
    	           
    	           // 마커와 인포윈도우를 표시합니다
    	           displayMarker(locPosition, message);
    	               
    	          	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
    	    	   function displayMarker(locPosition, message) {

    	    		   var imageSrc = '/images/location2.png', // 마커이미지의 주소입니다    
    	    		   imageSize = new daum.maps.Size(34, 39); // 마커이미지의 크기입니다
    	    		    
    	    		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize),
    	    		    markerPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
    	    		    
    	    	       // 마커를 생성합니다
    	    	       var marker = new daum.maps.Marker({
    	    	           map: map, //map 표시
    	    	           position: locPosition, //현재위치 표시
    	    	           image: markerImage
    	    	       }); 
    	    	       
    	    	       var iwContent = message, // 인포윈도우에 표시할 내용
    	    	           iwRemoveable = true;

    	    	       // 인포윈도우를 생성합니다
    	    	       var infowindow = new daum.maps.InfoWindow({
    	    	           content : iwContent,
    	    	           removable : iwRemoveable
    	    	       });
    	    	       
    	    	       // 인포윈도우를 마커위에 표시합니다 
    	    	       infowindow.open(map, marker);
    	    	       
    	    	       // 지도 중심좌표를 접속위치로 변경합니다
    	    	       map.setCenter(locPosition);      
    	    	}
    	         });
    	       
    	   } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    	       
    	       var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
    	           message = 'geolocation을 사용할수 없어요..'
    	           
    	       displayMarker(locPosition, message);
    	   }
    	   
 
      $("#userloginspan").click(function() {
         location.href = "userLogin.do";
      });

      var mapList = new Array();
		<c:forEach items="${Location}" var="lc">
			 mapList.push("${lc.sName},${lc.sLatitude},${lc.sLongitude},${lc.rCid},${lc.sMp}");
		</c:forEach>
      
		var positions = new Array();
		for ( var i = 0; i < mapList.length; i++) {
		    var mapItem = new Array();
		    mapItem = mapList[i].split(',');
		    
		    var name = mapItem[0];
		    var la = mapItem[1];
		    var lo = mapItem[2];
		    var id = mapItem[3];
		    var sMp = mapItem[4];
		    
		 // 마커를 표시할 위치와 title 객체 배열입니다 
		    var position1 = [
		                     {
		                         title: name, //상점이름
		                         latlng: new daum.maps.LatLng(la, lo), //위도경도 위치
		                         laa: la, //위도
		                         loo: lo, //경도
		                         id: id, //사업자번호
		                     }  
		                 ];
		    positions.push(position1);
		} 
		
			var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
			mapOption = { 
				center: new daum.maps.LatLng(37.4787031,126.8802539), // 지도의 중심좌표
				level: 4 // 지도의 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption);

			var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; // 마커이미지의 주소입니다    
			
			imageSize = new daum.maps.Size(34, 39); // 마커이미지의 크기입니다
			
			var marker = new Array();        //  마커
			var infowindow = new Array(); //인포윈도우

			for (var i = 0; i < positions.length; i ++) {
			
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); // 마커가 표시될 위치입니다

				// 마커를 생성합니다
				 marker[i] = new daum.maps.Marker({
					map: map, //지도 표시
					position: positions[i][0].latlng, // 마커를 표시할 위치
					title : positions[i][0].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image: markerImage // 마커이미지 설정 
				});
				 
				 // 마커 각각의 ID를 설정해 줍니다.
				 marker[i].index = i;
				 var iwContent = '<form class="storeMform" method="post" action="/store/storeMdetail.do">'
				 + '<input type="hidden" name="rCid" value="'+positions[i][0].id+'" />'
				 + '<div class="sTitle" style="padding:5px; width:180px;text-align:center; cursor:pointer;">'
				 + positions[i][0].title
				 + '</div>'
				 + '</form>';

				iwRemoveable = true;
				// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				// 인포윈도우를 생성합니다. 

				  infowindow[i] = new daum.maps.InfoWindow({
				     content : iwContent,
				     removable : iwRemoveable
				 });
				   
				  //다중마커 클릭시 인포윈도우 열림----------<<인포윈도우 이벤트>>
				  daum.maps.event.addListener(marker[i], "click", function() {
					  
				// 인포윈도우를 하나씩만 보여줄때 사용
				     for ( var i = 0; i < marker.length ; i++) {
				   infowindow[i].close();}
				  // 해당 마커를 열어준다.
				    infowindow[this.index].open(map, marker[this.index]);
				  });
			}
   });
</script>
</head>

<body>
	<div class="wrapper-spacer">
		<!-- UserHeader 시작 -->
			<jsp:include page="../common/commonUserHeader.jsp"></jsp:include>
		<!-- UserHeader 끝 -->

        <!-- Start Slider Part -->
        <section class="home-slider home-ride">
            <div class="tp-banner-container">
                <div class="tp-banner">
                    <ul>
                        <li data-transition="zoomout" data-slotamount="2" data-masterspeed="1000" data-thumb="" data-saveperformance="on" data-title="Slide">

                            <img class="ad" src="/images/user/야생마떡볶이광고.png" alt="야생마떡볶이" data-lazyload="/images/user/야생마떡볶이광고.png" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->
                            <div class="tp-caption very_large_text" data-x="center" data-hoffset="0" data-y="250" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300">야생마의 <span>마굿간떡볶이</span>
                            </div>
                            <!-- LAYERS -->
                            <div class="tp-caption medium_text" data-x="center" data-hoffset="0" data-y="340" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300">떡볶이가 너무 매워서 이히히힝~
                            </div>
                            <!-- LAYERS -->
                            <div class="tp-caption" data-x="center" data-hoffset="0" data-y="425" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300"><a href="/store/storeMdetail.do?rCid=8165" class="button-white">상세보기</a>
                            </div>
                        </li>
                        <li data-transition="zoomout" data-slotamount="2" data-masterspeed="1000" data-thumb="" data-saveperformance="on" data-title="Slide">
                                  
                            <img class="ad" src="/images/user/주용쓰잘해줘치킨광고.png" alt="주용쓰잘해줘치킨" data-lazyload="/images/user/주용쓰잘해줘치킨광고.png" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->
                            <div class="tp-caption very_large_text" data-x="center" data-hoffset="0" data-y="250" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300">주용쓰의 <span>잘해줘치킨</span>
                            </div>
                            <!-- LAYERS -->
                            <div class="tp-caption medium_text" data-x="center" data-hoffset="0" data-y="340" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300">노친절하면 주용쓰 흥흥 삐짐 :(
                            </div>
                            <!-- LAYERS -->
                            <div class="tp-caption" data-x="center" data-hoffset="0" data-y="425" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300"><a href="/store/storeMdetail.do?rCid=8166" class="button-white">상세보기</a>
                            </div>
                        </li>
                        <li data-transition="zoomout" data-slotamount="2" data-masterspeed="1000" data-thumb="" data-saveperformance="on" data-title="Slide">                              
                            <img class="ad" src="/images/user/민우쓰의눈칫밥상광고.png" alt="민우쓰의눈칫밥상" data-lazyload="/images/user/민우쓰의눈칫밥상광고.png" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->
                            <div class="tp-caption very_large_text" data-x="center" data-hoffset="0" data-y="250" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300">밍키의 <span>눈칫밥상 1호점</span>
                            </div>
                            <!-- LAYERS -->
                            <div class="tp-caption medium_text" data-x="center" data-hoffset="0" data-y="340" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300">아직도 안가봤어? 어머 너 눈치없다~
                            </div>
                            <!-- LAYERS -->
                            <div class="tp-caption" data-x="center" data-hoffset="0" data-y="425" data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;" data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;" data-speed="1000" data-start="500" data-easing="Back.easeInOut" data-endspeed="300"><a href="/store/storeMdetail.do?rCid=8167" class="button-white">상세보기</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="on-scroll">
                <a href="#reach-to" class="scroll"><img src="/images/scroll-down.png" alt=""></a>
            </div>
        </section>
        <!-- End Slider Part -->

        <!-- Start Main -->
        <main>
            <div class="main-part">
            	<!-- Start Map Part -->
                <section class="map-address pad-top-remove" data-wow-duration="1000ms" data-wow-delay="300ms">
                <div class="build-title">
                       <h2>먹고갈래 ?</h2>
                       <h6>사용자의 위치에 따라 매장들을 보여줍니다</h6>
                   </div>
               
                   <div class="map-top">
                       <div class="container" id="mapContainer">
                       	<div id="kakaoMap" style="width:100%;height:400px;"></div>
                       </div>
                   
               </div>
           </section>
           <!-- End Map Part -->
                
           <!-- Start Feature Blog -->
	       <section class="feature-blog-wrap wow fadeInUp"
				data-wow-duration="1000ms" data-wow-delay="300ms">
				<div class="container">
					<div class="build-title">
						<h2>! 생생 리뷰 !</h2>
						<h6>사용자들이 작성한 최근 리뷰를 보여줍니다</h6>
					</div>
					<div class="feature-blog feature-label">
						<div class="owl-carousel owl-theme" data-items="2" data-laptop="2"
							data-tablet="2" data-mobile="1" data-nav="false" data-dots="true"
							data-autoplay="true" data-speed="1800" data-autotime="5000">
							<!-- 1201 현희 리뷰 DB값 연결 /아직 연결안되고 P는 값이 없음 -->
							<c:forEach var="re" items="${ review }">
								<div class="item">
									<div class="feature-img">
										<img src="/images/img15.png" alt="">
										<div class="date-feature">
											<fmt:formatDate value="${re.RV_DATE}" pattern="dd"/> <br> 
											<small>
												<fmt:formatDate value="${re.RV_DATE}" pattern="MMM"/>
											</small>
										</div>
									</div>
									<div class="feature-info">
										<span><i class="icon-user"></i> ${ re.M_NAME } </span>
										<h5>${ re.S_NAME }</h5>
										<p>${ re.RV_CONTENT }</p>
										<a href="#">더보기 <i class="icon-more"></i></a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
       	<!-- End Feature Blog -->

            </div>
        </main>
        <!-- End Main -->
		<jsp:include page="../common/commonUserFooter.jsp"></jsp:include>
        
    </div>
    <!-- Back To Top Arrow -->
    <a href="#" class="top-arrow"></a>
    <script src="/js/jquery.min.js"></script>
    <script src="/plugin/bootstrap/bootstrap.min.js"></script>
    <script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
    <script src="https:/maps.googleapis.com/maps/api/js?key=AIzaSyAf6My1Jfdi1Fmj-DUmX_CcNOZ6FLkQ4Os"></script>
    <script src="/plugin/form-field/jquery.formstyler.min.js"></script>
    <script src="/plugin/revolution-plugin/jquery.themepunch.plugins.min.js"></script>
    <script src="/plugin/revolution-plugin/jquery.themepunch.revolution.min.js"></script>
    <script src="/plugin/owl-carousel/owl.carousel.min.js"></script>
    <script src="/plugin/slick-slider/slick.min.js"></script>
    <script src="/plugin/isotop/isotop.js"></script>
    <script src="/plugin/isotop/packery-mode.pkgd.min.js"></script>
    <script src="/plugin/magnific/jquery.magnific-popup.min.js"></script>
    <script src="/plugin/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="/plugin/animation/wow.min.js"></script>
    <script src="/plugin/parallax/jquery.stellar.js"></script>
    <script src="/js/app.js"></script>
    <script src="/js/script.js"></script>
</body>

</html>