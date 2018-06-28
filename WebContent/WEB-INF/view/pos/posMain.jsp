<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%String rCid = request.getParameter("rCid"); %>
    <!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>먹포 - 포스기</title>
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
<!-- 1211 아름 posMain.css 추가 -->
<link href="/css/pos/posMain.css" rel="stylesheet">

<style type="text/css">
.collapsed{
    padding: 8px 44px 8px 10px;}
   
.shop-product{
border-radius: 2em;
height:100%;
margin-bottom:0px;
}
.shop-pro{
}
.btn-black{
min-width:0px;
height:30px;
line-height:35px;
margin-top:9%;
}
.shop-cart-btn{
min-width:0px;
}

.shop-main-list{
margin:0 0 0 0;
}
.cart-overlay{
top:10%;
}
.shop-main-list h5{
margin:0 0 0 0;
}
.portfolioFilter a{
padding: 13px 42px;
}
.service-track-overlay{
padding:0px;
}
.panel-body p{
    margin: 0 0 5px 0;
}

</style>
<!--[if lt IE 9]>
      <script src="/https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="/https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
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

		<!-- End Header -->
		<!-- Start Main -->
		<main>
		<div class="main-part">
			<!-- Start Breadcrumb Part -->

			<!-- End Breadcrumb Part -->
			<section class="home-icon shop-cart bg-skeen">
				<div class="container">

					<div class="row">
						<div class="col-md-9 col-sm-7 col-xs-12 wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<div class="shop-checkout-left">
							<div>
								<span class="posTopFont">
									혼잡도
									<c:choose>
									<c:when test="${gCon.csYn =='Y'}">
									<img src="/images/traffic1.png" alt="" width="15%">여유
									</c:when>
									<c:when test="${yCon.csYn =='Y'}">
									<img src="/images/traffic2.png" alt="" width="15%">보통
									</c:when>
									<c:when test="${rCon.csYn =='Y'}">
									<img src="/images/traffic3.png" alt="" width="15%">혼잡
									</c:when>
									</c:choose>
								</span>
								<!-- 1214 아름 포장예약하기 추가 -->
									<a data-toggle="modal" data-target="#booktable" href="#"
										class="poBtn btn-black btnPos orderTarget" id="">포장</a>
										</div>
								<!-- table for문 시작 -->
								<c:forEach begin="1" end="${tableSet.tCnt}" varStatus="status" >
								<div 
									class="col-md-3 col-sm-4 col-xs-12 breakfast dessert dinner wow fadeInDown"
									data-wow-duration="1000ms" data-wow-delay="300ms" style="padding-bottom:5%;">
									<div class="shop-main-list">
										<div class="shop-product" style="height:150px;background-color:#A8A69C;">
										<p style="margin:0 0 0 0;">${status.count}</p>
											
											<div class="cart-overlay-wrap">
												<div class="cart-overlay">
													<div class="service-track-overlay banner-bg">
													<p>${status.count}</p>
															<a data-toggle="modal" data-target="#booktable" href="#"
																class="btn-black btnPos orderTarget"
																id="${sl.rCid }"
																>주문하기</a>
																<a
																data-toggle="modal" data-target="#booktable2" href="#"
																class="btn-black btnSetting" id="${sl.rCid }">결제하기</a>
														</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								<!-- table for문 끄읏 -->
							</div>
						</div>
						<div class="col-md-3 col-sm-5 col-xs-12 wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<div style="text-align: center;padding: 30px 0px 0px;" class="shop-checkout-right posReserveList">
								<h6 class="marginBottom">예약 요청건</h6>
								
								<div class="reserveli" style="padding-top: 8%; ">
								<div class="container" style="width:100%;">
								<div class="panel-group accordion-part" id="accordion" role="tablist" aria-multiselectable="true">
								<c:forEach items="${reserveList}" var="rl">
								
								<div class="panel panel-default wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a class="collapsed" style="padding: 13px 50px 13px 10px;"role="button" data-toggle="collapse" data-parent="#accordion" href="#${rl.rId }" aria-expanded="false" aria-controls="${rl.rId }">
                                        <span class="userName">${rl.mId }님의 <c:if test="${fn:contains(rl.rMpwp, 'M')}">매장</c:if><c:if test="${fn:contains(rl.rMpwp, 'P')}">포장</c:if> 예약</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="${rl.rId }" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                     <div class="panel-body">
                                    <p>
										<span>날짜</span> <small>${rl.rDate}</small>
									</p>
                                    <p>
										<span>시간</span> <small>${rl.rTime}</small>
									</p>
									<c:if test="${ rl.rPnum ne 0 }">
									<p>
										<span>인원</span> <small>${rl.rPnum }</small>
									</p>
									</c:if>
									<c:if test="${ rl.rTnum ne 0 }">
									<p name="rTnum">
										<span>테이블</span> <small >${rl.rTnum }</small>
									</p> 
									</c:if>
															<a rId="${rl.rId }" data-toggle="modal" data-target="#reserveDetail"
																href="#" class="button-default reserveOrder">상세내역 <i
																class="icon-right-4"></i></a>
                                    </div>
                                </div>
                            </div>
								</c:forEach>
								
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
		

	<div class="modal fade booktable" id="reserveDetail" tabindex="-1"
		role="dialog" aria-labelledby="booktable">
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="modalMargin">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

					<main> <!-- Start Menu Part -->

					<section class="home-icon blog-main-section shop-page"
						style="padding: 0px 0 0px">
						<!-- 						<div class="container" id="containerWidthEdit" -->
						<!-- 							style="width: 100%;"> -->
						<!-- 							<div class="build-title"> -->
						<!-- 								<h2>예약상세내역</h2> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<!-- 					</section> -->

						<form method="post" action="/reserve/reservePPayment.do">
							<div class="col-md-12 col-sm-5 col-xs-12 wow fadeInDown animated"
								data-wow-duration="1000ms" data-wow-delay="300ms"
								style="visibility: visible; animation-duration: 1000ms; animation-delay: 300ms; animation-name: fadeInDown;">
								<div class="shop-checkout-right">
									<div class="shop-checkout-box">
										<h5>예약상세내역</h5>
										<div class="reserveListView">
										
										<!-- 동적 주문한 메뉴 -->
										
										</div>
										<div class="reserveDetailInfoList">
										
										<!-- 동적 예약내역 -->
										
										</div>
									</div>
								</div>
							</div>
							<div class="product-cart-detail">
								<a href="#" class="btn-medium btn-dark-coffee">추가주문</a> <a
									href="#" class="btn-medium btn-skin pull-right">주문완료</a>
							</div>

						</form>
					</section>
					</main>
				</div>
			</div>
		</div>
	</div>

	
		<div class="modal fade booktable" id="booktable" tabindex="-1"
			role="dialog" aria-labelledby="booktable">
			<div class="modal-dialog" role="document">
				<div class="modal-content" id="modalMargin">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="table-title">
							<h2>주문 하기</h2>
						</div>
						<main> <!-- Start Menu Part -->
		
<section class="home-icon blog-main-section shop-page" style="padding:0px 0 0px">
		<div class="container" id="containerWidthEdit" style="width:100%;">
			<div class="build-title">
				<h2>메뉴선택</h2>
			</div>
			
			<form method="post" action="/reserve/reservePPayment.do" style="left: 5%;;top: 15% margin-top:40px;width:100%;">
			<div class="menu-wrapper userMypageMenucateWidth">
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

				<div class="portfolioContainer row menuScroll">
				<c:choose>
				<c:when test="${menuList == '[]'}">
 				<div><h3>등록된 메뉴가 없습니다.</h3></div>
        		</c:when>
        		<c:otherwise>
				<c:forEach var="list" items="${menuList}" end="30" >
				
					    <div class="Menumargin col-md-3 col-sm-6 col-xs-12 isotope-item  ${list.mCate}" style="margin-bottom:5%">
                                <div class="shop-main-list">
                                    <div class="shop-product shop-pro">
                                        <img src="${list.mUrl}" alt="">
                                        <div class="cart-overlay-wrap" style="height:72.1%;">
                                            <div class="cart-overlay" style="top:50%;">
                                                <input type="button" name="${list.mId}" class="shop-cart-btn" value="주문 하기"/>
                                            </div>
                                        </div>
                                    <a href="#"><h5 class="${list.mId}">${list.mName }</h5></a>
                                    <h5><strong class="${list.mId}">${list.mPrice }</strong></h5>
                                    <input type="hidden" name="rCid" value="<%=rCid%>"/>
                                    </div>
                                    
                                </div>
                            </div>
					
					</c:forEach>
					</c:otherwise>
					</c:choose>
					
					
				</div>
			
			</div>
			</form>
			
			</div>
			</section>
			
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
		
	</main>
					</div>
				</div>
			</div>
		</div>
		
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
						</div>
						</div>
						</div>
						</div>
		
		
		
		
		<!-- End Book Table -->
		
		<div class="modal fade booktable" id="booktable2" tabindex="-1"
			role="dialog" aria-labelledby="booktable2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
		
		</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- Back To Top Arrow -->
	<a href="#" class="top-arrow"></a>
	<script src="/js/jquery.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap.min.js"></script>
	<script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
	<script
		src="/https://maps.googleapis.com/maps/api/js?key=AIzaSyAf6My1Jfdi1Fmj-DUmX_CcNOZ6FLkQ4Os"></script>
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
	<script src="/js/pos/order.js"></script>
</body>

</html>