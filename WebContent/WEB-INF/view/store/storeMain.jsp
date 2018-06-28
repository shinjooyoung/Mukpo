<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>storeMain.jsp</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/plugin/bootstrap/bootstrap.css" rel="stylesheet">
<link href="/plugin/bootstrap/datepicker.css" rel="stylesheet">
<link href="/plugin/font-awesome/font-awesome.css" rel="stylesheet">
<link href="/plugin/form-field/jquery.formstyler.css" rel="stylesheet">
<link href="/plugin/revolution-plugin/extralayers.css" rel="stylesheet">
<link href="/plugin/revolution-plugin/settings.css" rel="stylesheet">
<link href="/plugin/owl-carousel/owl.carousel.copy.css" rel="stylesheet">
<link href="/plugin/owl-carousel/owl.theme.default.css" rel="stylesheet">
<link href="/plugin/slick-slider/slick-theme.css" rel="stylesheet">
<link href="/plugin/magnific/magnific-popup.css" rel="stylesheet">
<link href="/plugin/scroll-bar/jquery.mCustomScrollbar.css"
	rel="stylesheet">
<link href="/plugin/animation/animate.min.css" rel="stylesheet">
<link href="/css/store/storeMain.css" rel="stylesheet">
<link href="/css/responsive.css" rel="stylesheet">

<script src="/js/jquery.min.js"></script>
<script src="/js/store/storeMain.js"></script>
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
		<!-- Start Header -->
		<!-- End Header -->
		<!-- Start Main -->
		<main>
		<div class="main-part">
			<section class="bg-skeen home-icon wow fadeInDown"
				data-wow-duration="1000ms" data-wow-delay="300ms">
				<div class="icon-default icon-skeen">
					<img src="/images/scroll-arrow.png" alt="">
				</div>
				<div class="container">
					<div class="build-title">
						<h2>${bossInfo.bName}&nbsp사장님의매장목록</h2>
					</div>
					<div class="service-track">
						<div class="row">
							<div class="owl-carousel owl-theme chef-slider" data-items="4"
								data-laptop="3" data-tablet="2" data-mobile="1" data-nav="true"
								data-dots="false" data-autoplay="true" data-speed="1800"
								data-autotime="5000">
								<c:choose>
									<c:when test="${storeList == null }">
										<div class="item">
											<div class="col-md-12 col-sm-6 col-xs-12">
												<div class="service-track-inner btn-shadow">
													<div class="service-track-info">
														<h3>등록된 매장이 없습니다.</h3>
														<h4>+버튼을 눌러 매장을 등록하세요.</h4>
													</div>
												</div>
											</div>
										</div>

									</c:when>
									<c:otherwise>
										<c:forEach items="${storeList}" var="sl" end="16">
											<div class="item">
												<div class="col-md-12 col-sm-6 col-xs-12">
													<div class="service-track-inner btn-shadow">
														<div class="service-track-info">
															<h3>${sl.sName}</h3>
														</div>
														<div class="service-track-overlay banner-bg">
															<a data-toggle="modal" data-target="#booktable" href="#" class="btn-black btnPos" style="margin-bottom: 70%;" id="${sl.rCid }">POS기</a> 
															<a data-toggle="modal" data-target="#booktable2" href="#" class="btn-black btnSetting" id="${sl.rCid }">설정</a>
														</div>
													</div>
												</div>
											</div>

										</c:forEach>
									</c:otherwise>
								</c:choose>


								<div class="item">
									<div class="col-md-12 col-sm-6 col-xs-12">
										<div class="service-track-inner btn-shadow">
											<div class="service-track-info">
												<img src="/images/plus.png" width="96" height="96" alt=""
													id="plus">
											</div>
											<div class="service-track-overlay banner-bg">


												<a href="storeInput.do?bId=${bossInfo.bId }"
													class="btn-black">매장 등록</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
		</main>
		<!-- End Main -->
		<!-- 비밀번호 확인 모달창1 -->
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
							<h2>POS기 접속</h2>
							<h6 class="heade-xs">비밀번호 확인이 필요합니다.</h6>
						</div>
						<div class="row">

							<div class="col-md-12 col-sm-12 col-xs-12">
								<input type="password" id="bossPwd" name="password"
									placeholder="비밀번호 입력">
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<input type="hidden" id="bossId" value="${bossInfo.bId}" /> 
								<input type="hidden" id="rCid" />
								<button id="pwdCheck" class="btn-main btn-big">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 비밀번호 확인 모달창2 -->
		<div class="modal fade booktable" id="booktable2" tabindex="-1"
			role="dialog" aria-labelledby="booktable2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="table-title">
							<h2>설정 접속</h2>
							<h6 class="heade-xs">비밀번호 확인이 필요합니다.</h6>
						</div>
						<div class="row">

							<div class="col-md-12 col-sm-12 col-xs-12">
								<input type="password" id="bossPwd2" name="password"
									placeholder="비밀번호 입력">
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<input type="hidden" id="bossId2" value="${bossInfo.bId}" /> 
								<input type="hidden" id="rCid2" />
									
								<button id="pwdCheck2" class="btn-main btn-big">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Start Footer -->
		<!-- End Footer -->
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