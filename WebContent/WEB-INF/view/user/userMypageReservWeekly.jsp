<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- <link type="text/css" href="<%=cp %>/css/custom-theme/jquery-ui-1.8.23.custom.css" rel="stylesheet" /> --%>
<%-- <script type="text/javascript" src="<%=cp %>/js/jquery-1.8.0.min.js" ></script> --%>
<%-- <script type="text/javascript" src="<%=cp %>/js/jquery-ui-1.8.23.custom.min.js" ></script> --%>
<%-- <script type="text/javascript" src="<%=cp %>/js/jquery.ui.datepicker-ko.js" ></script> --%>
<script src="/js/jquery.min.js"></script>
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
<link href="/plugin/bootstrap/minwoo.css" rel="stylesheet">
<!-- 1209 아름 예약날짜 선택 css 파일 추가 -->
<link href="/css/user/daterangepicker.css" rel="stylesheet">
<style type="text/css">
html, body {
	height: 100%;
}
</style>
</head>
<body style="padding-right: 0px;">
	<!-- Start Mypage Header -->
	<jsp:include page="/WEB-INF/view/common/commonUserMypageHeader.jsp"></jsp:include>
	<!-- End Mypage Header -->

	<!-- 매장검색 -->
	<section id="reach-to" data-wow-duration="1000ms"
		data-wow-delay="300ms"  >

	<div class="content-middle">
		<input type="text" id="term" placeholder="매장검색" style="width: 70%;"
			value="이" /> <img src="/images/icon-zoom-blue.png" name="search"
			id="search" style="margin-bottom: 5%; margin-left: 2%;">
		<table class="tblList" border="1"></table>
		<!-- 매장리스트 띄워주는 테이블 -->
	</div>
	</section>
	<!-- 매장검색 끝-->

	<!-- Start Blog List -->
	<section id="storeListPaddingTop"
		class="home-icon blog-main-section text-center blog-main-2col wow fadeInDown"
		data-wow-duration="1000ms" data-wow-delay="300ms">
	<div class="container">
		<div class="portfolioFilter"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="blog-right-section">
					<div class="row" id="searchList">
						<!-- 								AJAX로 상점리스트 뿌려주는 공간 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- 매장 목록 값 끝 -->

	<!-- 예약 달력 -->
	<div class="modal fade booktable" id="booktable" tabindex="-1"
		role="dialog" aria-labelledby="booktable">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="table-title">
						<h2>Reservation</h2>
						<h6 class="heade-xs">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit.</h6>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select class="select-dropbox">
								<option>Hour</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select class="select-dropbox">
								<option>Number of People</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="txt" placeholder="Pick a Date"
								class="date-pick">
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="txt" placeholder="Phone Number">
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<input type="email" name="email" placeholder="Email Address">
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<button class="btn-main btn-big">BOOK A TABLE</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 예약 달력 끝 -->

	<!-- 매장 클릭 -> 메뉴표시 모달창 -->
	<div class="modal fade booktable" id="ReservWeeklyMenu" tabindex="-1"
		role="dialog" aria-labelledby="ReservWeeklyMenu">
		<div class="modal-dialog" id="menuModalMarginTop" role="document">
			<div class="modal-content" id="modalMargin">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<section class="home-icon blog-main-section shop-page"
						style="padding:0px 0 0px">
					<div class="container" id="containerEdit" name="containerEdit"
						style="margin-top: 10%;">
						<!-- 						<div class="build-title"> -->
						<%-- 							<p>${ menuVOCate.rCid } --%>
						<%-- 							<h2>${ menuVOCate.rCid }</h2> --%>
						<%-- 							<h2>${ selectStoreCid.rCid }</h2> --%>

						<!-- 						</div> -->
						<div class="menu-wrapper userMypageMenucateWidth">
							<div class="portfolioFilter" id="menucate">
								<!-- 					메뉴 카테고리 출력  -->



							</div>

							<div class="portfolioContainer row" id="menulist">

							</div>
						</div>
					</div>
					</section>
					<!-- 		메뉴출력 끝 -->
				</div>
				
				
					<form method="post" action="/reserve/reservePPayment.do">
			<div class="shop-cart-list" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <div class="build-title">
				<h3>주간 예약 설정</h3>
			</div>
                            <div class="menu-select">
                            <table class="shop-cart-table">
                                <thead>
                                    <tr>
                                        <th>PRODUCT</th>
                                        <th>PRICE</th>
                                        <th>QUANTITY</th>
                                        <th>TOTAL</th>
                                        <th>DEL</th>
                                    </tr>
                                </thead>
                                <tbody class="menulist">
                          </tbody>
                            </table>
                            
                          <div class="product-cart-detail">
                            <h3 class="ordermenu">주문할 메뉴를 선택하세요.</h3>
                            	
                                <input type="button" id="cartOrder"  class="btn-medium btn-skin pull-right" value="UPDATE cart"/>
                            	<input type="hidden" name="rCid"/>
                            	<input type="hidden" name="sName"/>
                            </div>
                            </div>
                        </div>
			</form>
				
				
			</div>
		</div>
	</div>

	<!-- Back To Top Arrow -->
	<a href="#" class="top-arrow"></a>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
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
	<script src="/js/user/userMypageReserveWeekly.js"></script>
	<script src="/js/user/moment.min.js"></script>
	<script src="/js/user/reserveorder.js"></script>
	
</body>
</html>