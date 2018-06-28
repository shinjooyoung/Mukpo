<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Checkout - Laboom</title>
<link href="/plugin/bootstrap/bootstrap_copy.css" rel="stylesheet">
<link href="/plugin/bootstrap/datepicker.css" rel="stylesheet">
<link href="/plugin/font-awesome/font-awesome.css" rel="stylesheet">
<link href="/plugin/form-field/jquery.formstyler_copy.css"
	rel="stylesheet">
<link href="/plugin/revolution-plugin/extralayers.css" rel="stylesheet">
<link href="/plugin/revolution-plugin/settings.css" rel="stylesheet">
<link href="/plugin/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="/plugin/owl-carousel/owl.theme.default.css" rel="stylesheet">
<link href="/plugin/slick-slider/slick-theme.css" rel="stylesheet">
<link href="/plugin/magnific/magnific-popup.css" rel="stylesheet">
<link href="/plugin/scroll-bar/jquery.mCustomScrollbar.css"
	rel="stylesheet">
<link href="/plugin/animation/animate.min.css" rel="stylesheet">
<link href="/css/store/storeInput.css" rel="stylesheet">
<link href="/css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/ax5ui/ax5ui-uploader/master/dist/ax5uploader.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/ax5ui/ax5ui-uploader/master/dist/ax5uploader.js"></script>
<script
	src="https://cdn.rawgit.com/thomasJang/jquery-direct/master/dist/jquery-direct.min.js"></script>
</head>

<body>
	<div class="wrapper">
		<!-- Start Header -->
		<!-- End Header -->
		<!-- Start Main -->
		<main>
		<div class="main-part">
			<section class="home-icon shop-cart bg-skeen">
				<div class="container">
					<div class="row">

						<div class="col-md-9 col-sm-12 col-xs-12 wow fadeInDown maindiv"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<h3>
								<img src="/images/img10.png" alt="Laboom" /> &nbsp매장 등록
							</h3>

							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="shop-checkout-left">
									<form action="storeInputOk.do" name="store" method="post">

										<input type="hidden" value="${bossVO.bId}" name="bId">
										<div class="row">

											<h4>사장님 ID : ${bossVO.bId}</h4>
											<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
												<h5>매장 정보</h5>
											</div>
											<div class="col-md-4 col-sm-12 col-xs-12">
												<input type="text" name="rCid" placeholder="사업자등록번호">
											</div>
											<div class="col-md-4 col-sm-12 col-xs-12">
												<input type="text" name="sName" placeholder="업소명">
											</div>
											<div class="col-md-4 col-sm-12 col-xs-12">
												<input type="text" name="sPw" placeholder="비밀번호">
											</div>

											<div class="col-md-12 col-sm-12 col-xs-12">
												<div class="col-md-7 col-sm-12 col-xs-12">
													<input type="text" name="sTel" placeholder="전화번호">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="text" name="sOpentime" placeholder="오픈시간">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="text" name="sClosetime" placeholder="마감시간">
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12">
													<textarea name="sDetail" placeholder="매장 설명"></textarea>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>카테고리 선택</h5>
												</div>
												<div class="col-md-4 col-sm-12 col-xs-12">
													<select class="select-dropbox" name="sCate">
														<option value="한식">한식</option>
														<option value="분식">분식</option>
														<option value="일식">일식</option>
														<option value="중식">중식</option>
														<option value="양식">양식</option>
														<option value="패스트푸드">패스트푸드</option>
														<option value="카페">카페</option>
														<option value="뷔페식">뷔페식</option>
													</select>
												</div>
												<div class="col-md-8 col-sm-12 col-xs-12"></div>

												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="text" name="sZipcode" placeholder="우편번호">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="button" name="submit" value="우편번호 검색"
														class="button-default button-default-submit btn2">
												</div>
												<div class="col-md-7 col-sm-12 col-xs-12">
													<input type="text" name="sAddress" placeholder="주소">
												</div>
												<div class="col-md-9 col-sm-12 col-xs-12">
													<input type="text" name="sSido" placeholder="상세주소">
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>휴무일 선택</h5>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12">
													<label> <input type="checkbox" name="checkbox"
														name="day" value="월">월
													</label> <label> <input type="checkbox" name="checkbox"
														value="화">화
													</label> <label> <input type="checkbox" name="checkbox"
														value="수">수
													</label> <label> <input type="checkbox" name="checkbox"
														value="목">목
													</label> <label> <input type="checkbox" name="checkbox"
														value="금">금
													</label> <label> <input type="checkbox" name="checkbox"
														value="토">토
													</label> <label> <input type="checkbox" name="checkbox"
														value="일">일
													</label>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>먹포 선택</h5>
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<select class="select-dropbox" name="sMp">
														<option value="M">먹고 간다.</option>
														<option value="P">포장 한다.</option>
														<option value="MP">둘다 한다.</option>
													</select>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>매장 테이블 정보</h5>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<div class="col-md-3 col-sm-12 col-xs-12">
														<h6>매장 테이블 갯수</h6>
														<select class="select-dropbox" name="tCnt">
															<option value="0">0</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
															<option value="9">9</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
														</select>
													</div>
													<div class="col-md-4 col-sm-12 col-xs-12">
														<h6>테이블당 인원수</h6>
														<input type="text" name="tMax" placeholder="테이블당 최대 인원">
													</div>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>매장 혼잡도 설정</h5>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
													<h6>여유</h6>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<input type="text" name="GcsCnt" placeholder="주문건수">
													</div>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<select class="select-dropbox" name="GcsTime">
															<option value="0">0분</option>
															<option value="10">10분</option>
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="50">50분</option>
															<option value="60">60분</option>
														</select>
													</div>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
													<h6>보통</h6>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<input type="text" name="YcsCnt" placeholder="주문건수">
													</div>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<select class="select-dropbox" name="YcsTime">
															<option value="0">0분</option>
															<option value="10">10분</option>
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="50">50분</option>
															<option value="60">60분</option>
														</select>
													</div>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
													<h6>혼잡</h6>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<input type="text" name="RcsCnt" placeholder="주문건수">
													</div>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<select class="select-dropbox" name="RcsTime">
															<option value="0">0분</option>
															<option value="10">10분</option>
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="50">50분</option>
															<option value="60">60분</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
												<a href="storeMain.do"
													class="button-default button-default-submit btn">뒤로가기</a> <input
													type="submit" name="store" value="등록"
													class="button-default button-default-submit btn">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		</main>
		<!-- End Main -->
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