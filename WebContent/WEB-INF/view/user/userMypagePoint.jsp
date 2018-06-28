<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mypage -point</title>
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
        <!-- Start Mypage Header -->
        	<jsp:include page="/WEB-INF/view/common/commonUserMypageHeader.jsp"></jsp:include>
        <!-- End Mypage Header -->
 

		<!-- Start Main -->
	
	<div class="container">
				<div class="icon-default icon-skeen">
					<img src="/images/scroll-arrow.png" alt="">
				</div>
				<div class="container">
					<div class="shop-cart-list wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="300ms">
						<!-- 날짜초기값설정 -->
						<fmt:formatDate value="<%=new java.util.Date()%>"
							pattern="yyyy/MM/dd" var="endDate" />
						<fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 30)%>"
							pattern="yyyy/MM/dd" var="startDate" />
						<!-- 미완료 -->
						<!-- 날짜로검색(한달 전 날짜) --> 
						<form action="/user/userMypagePointDate.do" class="pointDate-form"
							method="post" name="pointDate">
							<div class="col-md-12 col-sm-6 col-xs-12" id="calendarsearch">
								<strong name="datetext">일자별</strong> <input type="text"
									name="startDate"  value="${ startDate }"
<%-- 									value="<%= param.startDate %>" --%>
									
									class="date-pick" id="calendarstart"> <strong
									name="datetext">-</strong> <input type="text" name="endDate"
									 value="${ endDate }"
									class="date-pick" id="calendarend">
								<div class="product-cart-detail datesearch">
									<input type="submit" name="submit" value="검색"
										class="col-md-12 col-sm-6 col-xs-12 btn-medium searchbtn btn-dark-coffee">
								</div>
							</div>
						</form>
						<table class="shop-cart-table">
							<thead>
								<tr>
									<th>구분</th>
									<th>이용매장</th>
									<th>금액</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ pointVOList == null }">
										<tr>포인트 내역이 없습니다.
										</tr>
									</c:when>
									<c:otherwise>

										<c:forEach items="${ pointVOList }" var="pointVO">
											<tr>
												<th>구분</th>
												<td><span>${ pointVO.pAs }</span></td>
												<th>이용매장</th>
												<td>${ pointVO.pStore }</td>
												<th>금액</th>
												<td>
													<div class="price-textbox">
														<fmt:formatNumber value="${ pointVO.pPrice }"
															type="number" />
													</div>
												</td>
												<th>날짜</th>
												<td>${ pointVO.pDate }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="product-cart-detail">
							<a href="/user/userMypagePointCharge.do" class="btn-medium btn-dark-coffee">충전</a>
						</div>
					</div>
				</div>
		</div>
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
</body>
</html>