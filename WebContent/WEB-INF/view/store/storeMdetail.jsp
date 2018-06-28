<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>먹포 - 매장상세</title>
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
<link href="/css/store/storeMdetail.css" rel="stylesheet">

<link href="/css/reserve/reserveM.css" rel="stylesheet" />
<link href='/css/reserve/calendar.css' rel='stylesheet' />
<link href='/css/reserve/fullcalendar.css' rel='stylesheet' />
<link href='/css/reserve/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<link href="/css/common/commonUserHeader.css" rel="stylesheet"/>

<link href='/css/reserve/jquery.timepicker.css' rel='stylesheet' />
<link href='/css/reserve/jquery.timepicker.min.css' rel='stylesheet' />


<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">

#menutop{
margin-top: 5%;
}
#storeimg{
margin-top:12%;
}
.jbMenu{
padding-top:10%;
margin-left:30%;
}

.jbFixed {
position: fixed;
top: -7%;
margin-left: 30%;
z-index:5;
}

/* #menubtn{ */
/* margin-left:30%; */
/* } */
/* .menucata{ */
/* margin-top:-10%; */
/* } */
.portfolioContainer{
width: 85%; margin: auto;
}

.col-md-8{
margin-top:-5%;
}

.blog-right-section{
margin-left:20%;
}
.date-feature{
margin-right:27%;
margin-top:-5%;
}

.stote-img{
width:70%;
}

.date-feature{
margin-right:27%;
}

		.otherscroll{
			top : -60px;
			left:0px;
			background-color: red;
			margin-top: -10%;
			
		}
		
.header-part.header-on{
width:80%;
height:106px;
margin-left:auto;
margin-right:auto;
}		
		

</style>
<script type="text/javascript">
function fnMove(seq){
    var offset = $("#div" + seq).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}

$( document ).ready( function() {
    var jbOffset = $( '.jbMenu' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '.jbMenu' ).addClass( 'jbFixed' );
      }
      else {
        $( '.jbMenu' ).removeClass( 'jbFixed' );
      }
    });
  });

</script>
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
        <!-- Start Header -->
        	<jsp:include page="../common/commonUserHeader.jsp"></jsp:include>
        <!-- End Header -->
		<!-- Start Main -->
		<main> <!-- Start Menu Part -->
		<div class="col-md-8 col-sm-8 col-xs-12 wow fadeInDown"
			data-wow-duration="1000ms" data-wow-delay="300ms">
			<div class="blog-right-section">
				<div class="blog-right-listing wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="300ms">
					<div id='storeimg'class="feature-img">
						<img class='stote-img' src="${ storeVO.sUrl }" style="width:70%;"alt="">
						<div class="date-feature">
							<c:choose>
								<c:when test="${ favoriteVO eq '즐겨찾기X' }">
									<img alt="" src="/images/store/likeX.png" class="favoriteImg" >
								</c:when>
								<c:when test="${ favoriteVO eq '즐겨찾기O' }">
									<img alt="" src="/images/store/likeO.png" class="favoriteImg" >
								</c:when>
								
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class='jbMenu'>
			<button id='menubtn' class='btn-main btn-shadow' onclick="fnMove('1')">메뉴소개</button>
    		<button class='btn-main btn-shadow' onclick="fnMove('2')">예약</button>
    		<button class='btn-main btn-shadow' onclick="fnMove('3')">리뷰</button>
    	</div>	
		<div id='menutop'class="container">
			<div id='div1' class="menu-wrapper">
				<div id='menucata'class="portfolioFilter">
					<c:choose>
						<c:when test="${ fn:length(menuVOCate) eq 0 }">
							<h5>등록된 메뉴가 없습니다.</h5>
						</c:when>
						<c:otherwise>
							<div class="portfolioFilter-inner">

								<a href="javascript:;" data-filter="*" class="current">전체메뉴</a>
								<c:forEach items="${ menuVOCate }" var="menuVOCateList">
									<a href="javascript:;" data-filter=".${ menuVOCateList.mCate }">${ menuVOCateList.mCate }</a>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="portfolioContainer row">
				<c:forEach items="${ menuVOList }" var="menuVONameList">
					<div
						class="col-md-6 col-sm-6 col-xs-12 isotope-item ${ menuVONameList.mCate }">
						<div class="menu-list">
							<span class="menu-list-product"> <img
								src="${ menuVONameList.mUrl }" alt="${ menuVONameList.mName }">
							</span>
							<h5>
								${ menuVONameList.mName } <span><fmt:formatNumber
										value="${ menuVONameList.mPrice }" type="number" /></span>
							</h5>
							<p>${ menuVONameList.mDetail }</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	<!-- End Menu Part -->
	<!-- 예약 시작 -->
	<section class="breadcrumb-part" data-stellar-offset-parent="true"
		data-stellar-background-ratio="0.5"
		style="background-image: url('/images/breadbg1.jpg');">
		<div class="container">
			<div class="breadcrumb-inner">
				<h2>예약</h2>
				<a href="#">먹고갈래?</a> <span>예약</span>
			</div>
		</div>
	</section>
	<!--혼잡도 표시 -->
	<div class="StoreMdetail_congestion" id='div2'>
		혼잡도 &nbsp;
		<c:choose>
			<c:when test="${ congestionState eq 'G' }">
				<img src="/images/congestion_green.png" /> &nbsp; 여유
			</c:when>
			<c:when test="${ congestionState eq 'Y' }">
				<img src="/images/congestion_orange.png" /> &nbsp; 보통
			</c:when>
			<c:when test="${ congestionState eq 'R' }">
				<img src="/images/congestion_red.png" /> &nbsp; 혼잡
			</c:when>
		</c:choose>
	</div>
	<!--혼잡도표시 끝 -->
	<!--예약 테이블 선택  -->
	<c:choose>
		<c:when test="${ tableSetVO eq null }">
			<h5>등록된 테이블이 없습니다.</h5>
			<input type="hidden" id="mId" name="mId" value="${ sessionScope.userName }">
			<input type="hidden" id="rCid" name="rCid" value="${ param.rCid }">
		</c:when>
		<c:otherwise>
			<h5>테이블 선택시 예약 가능합니다.</h5>
			<div class="StoreMdetail_tablechoice col-md-6 col-sm-6 col-xs-12">
				<c:forEach begin="1" end="${ tableSetVO.tCnt }" varStatus="no">
					<div
						class="col-md-3 col-sm-4 col-xs-12 breakfast dessert dinner wow fadeInDown animated"
						data-wow-duration="1000ms" data-wow-delay="300ms"
						style="visibility: visible; animation-duration: 1000ms; animation-delay: 300ms; animation-name: fadeInDown;">
						<div class="shop-main-list" style="height: 165px;">
							<div class="shop-product">
								<img src="/images/table${ no.count }.png" alt="" />
								<div class="cart-overlay-wrap">
									<div class="cart-overlay">
										<form action="/reserve/reserveM.do" method="POST">
											<!-- 사업자등록번호 -->
<!--  ajax 처리 위해 mId, rCid 받기 -->
											<input type="hidden" id="mId" name="mId" value="${ sessionScope.userName }">
											<input type="hidden" id="rCid" name="rCid" value="${ param.rCid }">
											<input type="hidden" name="rTnum" value="${ no.count }" />
											<c:choose>
													<c:when test="${fn:length(reserveInfo) eq 0}" >
													 로그인해주세요 
													</c:when>
													<c:otherwise>
													<a href="#" id="reserveM" class="shop-cart-btn reservebtn" name="${ no.count }">예약하기</a> <br />
													</c:otherwise>
												</c:choose>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>

	</c:choose>
	<!--예약 테이블 선택 끝  -->
	<div class="reserveM">
		<c:choose>
			<c:when test="${ tableSetVO eq null }">
				<input type="submit" class="btn-black reserveM" value="테이블 없이 예약하기" />
			</c:when>
		</c:choose>
	</div>
	<!-- 예약 끝 -->
	<div class="main-part">
		<!-- Start Breadcrumb Part -->
		<section class="breadcrumb-part" data-stellar-offset-parent="true"
			data-stellar-background-ratio="0.5"
			style="background-image: url('/images/breadbg1.jpg');">
			<div class="container">
				<div class="breadcrumb-inner">
					<h2>리뷰</h2>
					<a href="#">먹고갈래?</a> <span>리뷰</span>
				</div>
			</div>
		</section>
		<!-- End Breadcrumb Part -->
		<section class="home-icon blog-main-section blog-single">
			<div class="icon-default">
				<img src="/images/scroll-arrow.png" alt="">
			</div>
			<div class="container">
				<div id='div3'class="row">
					<div class="col-md-8 col-sm-8 col-xs-12 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="300ms">
						<div class="blog-right-section">

							<div class="blog-right-listing wow fadeInDown"
								data-wow-duration="1000ms" data-wow-delay="300ms">


								<div class="feature-info">
									<p>저희매장은 ${ fn:length(menuVOList) }가지 메뉴를 제공하고있습니다.</p>
									<blockquote>
										<span class="quote">“</span> ${ storeVO.sDetail }
									</blockquote>

								</div>
								<div class="comment-blog">
									<h3>리뷰 ${ fn:length(reviewList)}개</h3>
									<c:choose>
										<c:when test="${ fn:length(reviewList) eq 0 }">
											<h5>등록된 리뷰가 없습니다.</h5>
										</c:when>
										<c:otherwise>
											<c:forEach items="${ reviewList }" var="reviewListView">
												<div class="comment-inner-list">
													<div class="comment-info">
														<p>${ reviewListView.M_ID }님작성</p>

														<span class="comment-date"><fmt:formatDate
																value="${ reviewListView.RV_DATE }" pattern="yyyy/MM/dd" /></span>
														<h5>${ reviewListView.RV_CONTENT }</h5>
													</div>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
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
	<script src="/js/store/favoriteStore.js"></script>
</body>

</html>