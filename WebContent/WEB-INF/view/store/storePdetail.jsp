<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ page trimDirectiveWhitespaces="true" %>
	<%String rCid=request.getParameter("rCid"); %>
	<%String sName=request.getParameter("sName"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Blog Single - Laboom</title>
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
<link href="/css/common/commonUserHeader.css" rel="stylesheet"/>
<style type="text/css">

.portfolioContainer{
width: 75%; margin: auto;
}
.header-part.header-on{
width:80%;
height:106px;
margin-left:auto;
margin-right:auto;
}
.date-feature{
margin-top: 10%;
}
.shop-cart-list{
    text-align: -webkit-center;
}
.menu-select{
width:70%;
}
.pull-right{
display:none;
}


</style>
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
<!-- 1204 현희 헤더 추가 -->    
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
					<div class="feature-img">
						<img src="${vo.sUrl}" alt="">
						<div class="date-feature">
							27 <br> <small>may</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="build-title">
				<h2>메뉴선택</h2>
			</div>
			
			<form method="post" action="/reserve/reservePPayment.do" style="left: 5%;;top: 15% margin-top:40px;width:100%;">
			<div class="menu-wrapper">
                            <div class="portfolioFilter">
                                <div class="portfolioFilter-inner">
						<a href="javascript:;" data-filter="*" class="current">전체메뉴</a> 
							<c:choose>
							<c:when test="${cateList=='[]'}">
           		 <a href="javascript:;" data-filter="*" class="current">카테고리가 없습니다.</a> 
        		</c:when>
        			<c:otherwise>
				<c:forEach var="list" items="${cateList}" end="30" >
							<a href="javascript:;" data-filter=".${list.mCate }">${list.mCate }</a> 
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</div>
				</div>

				<div class="portfolioContainer row ">
<!-- 				메뉴 리스트 화면 -윤경식 추가-->
				<c:choose>
				<c:when test="${menuList == '[]'}">
 				<div><h3>등록된 메뉴가 없습니다.</h3></div>
        		</c:when>
        		<c:otherwise>
				<c:forEach var="list" items="${menuList}" end="30" >
				
					    <div class="col-md-3 col-sm-6 col-xs-12 isotope-item  ${list.mCate}">
                                <div class="shop-main-list">
                                    <div class="shop-product">
                                        <img src="/images/img56.png" alt="">
                                        <div class="cart-overlay-wrap">
                                            <div class="cart-overlay">
                                                <input type="button" name="${list.mId}" class="shop-cart-btn" value="ADD TO CART"/>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#"><h5 class="${list.mId}">${list.mName }</h5></a>
                                    <h5><strong class="${list.mId}">${list.mPrice }</strong></h5>
                                </div>
                            </div>
					
					</c:forEach>
					</c:otherwise>
					</c:choose>
					
					
				</div>
			
			</div>
			</form>
			
			</div>
			
			<form method="post" action="/reserve/reservePPayment.do">
			<div class="shop-cart-list wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <div class="build-title">
				<h2>주문 메뉴</h2>
			</div>
                            <div class="menu-select">
                            <table class="shop-cart-table">
                                <thead>
                                    <tr>
                                        <th>PRODUCT</th>
                                        <th>PRICE</th>
                                        <th>QUANTITY</th>
                                        <th>TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody class="menulist">
<!--                                  경식 추가  여기에 매뉴 리스트 추가 됨 *************************************************************************************-->
                                </tbody>
                            </table>
                            
                            
                            <div class="product-cart-detail">
                            <h3 class="ordermenu">주문할 메뉴를 선택하세요.</h3>
                                <input type="submit"  class="btn-medium btn-skin pull-right" value="UPDATE cart"/>
                            	<input type="hidden" name="rCid"value="<%=rCid %>"/>
                            	<input type="hidden" name="sName"value="<%=sName %>"/>
                            </div>
                            </div>
                        </div>
			</form>
		

		<!-- End Menu Part -->
		<div class="main-part">
			<!-- Start Breadcrumb Part -->
			<section class="breadcrumb-part" data-stellar-offset-parent="true"
			data-stellar-background-ratio="0.5"
			style="background-image: url('/images/breadbg1.jpg');">
			<div class="container">
				<div class="breadcrumb-inner">
					<h2>리뷰</h2>
					<a href="#">포장갈래?</a> <span>리뷰</span>
				</div>
			</div>
		</section>
			<!-- End Breadcrumb Part -->
			
		
		<!-- End Book Table -->
		
		</div>
		<section class="home-icon blog-main-section blog-single">
			<div class="icon-default">
				<img src="/images/scroll-arrow.png" alt="">
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-8 col-xs-12 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="300ms">
						<div class="blog-right-section">

							<div class="blog-right-listing wow fadeInDown"
								data-wow-duration="1000ms" data-wow-delay="300ms">


								<div class="feature-info">
									<p>저희매장은 ${ fn:length(menuList) }가지 메뉴를 제공하고있습니다.</p>
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
	</main>
	</div>
	
	<!-- Back To Top Arrow -->
	<a href="#" class="top-arrow"></a>
	<script src="/js/jquery.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf6My1Jfdi1Fmj-DUmX_CcNOZ6FLkQ4Os"></script>
	<script src="/plugin/form-field/jquery.formstyler.min.js"></script>
	<script src="/plugin/revolution-plugin/jquery.themepunch.plugins.min.js"></script>
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
	<script src="/js/store/basket.js"></script>
</body>

</html>