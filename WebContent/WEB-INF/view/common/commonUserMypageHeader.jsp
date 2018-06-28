<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%!String mId;%>
<!DOCTYPE>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
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
<link href="/plugin/scroll-bar/jquery.mCustomScrollbar.css"
	rel="stylesheet">
<link href="/plugin/animation/animate.min.css" rel="stylesheet">
<link href="/css/theme.css" rel="stylesheet">
<link href="/css/responsive.css" rel="stylesheet">
<link href="/css/user/userMypage.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <script type="text/javascript">
    $(function() {
        $("#orderlist").click(function() {
      	  location.href = "/reserve/userMypageReservList.do";
        });
        $("#booking").click(function() {
        	  location.href = "/user/userMypageReservWeekly.do";
          });
        $("#love").click(function() {
      	  location.href = "/user/userMypageFavoriteList.do";
        });
        $("#point").click(function() {
      	  location.href = "/user/userMypagePoint.do";
        });
        $("#contract").click(function(){
        	location.href="/user/userMypageInfoModifyMain.do"
        });
      
   
     });
    
    </script>
</head>

<body>
	<!-- Page pre loader -->
	<div id="pre-loader">
		<div class="loader-holder">
			<div class="frame">
				<img src="/images/Preloader.gif" alt="Laboom" />
			</div>
		</div>
	</div>
	<div class="wrapper">
		<!-- Start Main -->
		<main>
		<div class="main-part">
			<!-- 마이페이지메뉴 시작 -->
			<section class="breadcrumb-part" data-stellar-offset-parent="true"
				data-stellar-background-ratio="0.5"
				style="background-image: url('/images/breadbg1.jpg');">
				<div class="container">
					<div class="breadcrumb-inner">
						<h2>마이페이지</h2>

						<div class="row" id='mypageheader'>
							<div class="col-md-2 col-sm-2 col-xs-2 mypageheader"  id="orderlist">
								<div class="feature-list-icon">
									<div class="feature-icon-table">
										<img src="/images/user/menu.png" alt="">
									</div>
								</div>
								<h5>예약내역</h5>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-2 mypageheader"  id="booking">
								<div class="feature-list-icon">
									<div class="feature-icon-table">
										<img src="/images/user/calendar.png" alt="">
									</div>
								</div>
								<h5>주간예약하기</h5>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-2 mypageheader"  id="love">
								<div class="feature-list-icon">
									<div class="feature-icon-table">
										<img src="/images/user/favorite.png" alt="">
									</div>
								</div>
								<h5>즐겨찾기 목록</h5>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-2 mypageheader"  id="point">
								<div class="feature-list-icon">
									<div class="feature-icon-table">
										<img src="/images/user/coins.png" alt="">
									</div>
								</div>
								<h5>먹포인트</h5>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-2 mypageheader"
								id="contract">
								<div class="feature-list-icon">
									<div class="feature-icon-table">
										<img src="/images/user/info.png" alt="">
									</div>
								</div>
								<h5>개인정보수정</h5>
							</div>
						</div>

					</div>



				</div>
			</section>
		</div>
	</div>
	<!-- 마이페이지메뉴 끝 -->
	</main>
	<!-- End Main -->
	<!-- Back To Top Arrow -->
	<a href="#" class="top-arrow"></a>
	<script src="/js/jquery.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf6My1Jfdi1Fmj-DUmX_CcNOZ6FLkQ4Os"></script>
	<script src="/plugin/form-field/jquery.formstyler.min.js"></script>
	<script
		src="/plugin/revolution-plugin/jquery.themepunch.plugins.min.js"></script>
	<script
		src="/plugin/revolution-plugin/jquery.themepunch.revolution.min.js"></script>
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
	<script src="/js/user/userMypage.js"></script>
</body>

</html>