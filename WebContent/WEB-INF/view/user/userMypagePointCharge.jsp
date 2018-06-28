<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>먹포 - 먹포인트충전</title>
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
			<section class="home-icon shop-cart bg-skeen">
				<div class="icon-default icon-skeen">
					<img src="/images/scroll-arrow.png" alt="">
				</div>
				<div class="container">

					<div class="row center">
						<div class="col-md-12 col-sm-12 col-xs-12 wow fadeInDown">
							<form action="/user/userMypagePointChargeOk.do" method="post">
								<div class="shop-checkout-right pointmaincenter">
									<div class="shop-checkout-box-edit center">
										<h5 name="mypoint">${ userVOName.mName }님의
											현재 포인트는
											<fmt:formatNumber value="${ pointVO.pCruntmoney }"
												type="number" />
											원 입니다.
										</h5>
										<div class="checkout-total">
											<h6 name="mypointprice">충전금액</h6>
											<input type="hidden" value="${ pointVO.pCruntmoney }" name="pCruntmoney"/>
											<input type="text" name="pPrice" value="0" />
										</div>
									</div>
									<div class="checkout-button">
										<div class="checkout-button">
											<input type="submit" class="button-default btn-large btn-primary-gold" value="카드충전" />
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
		</main>
		<!-- End Main -->

	</div>
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
</body>

</html>