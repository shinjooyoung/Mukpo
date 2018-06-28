<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>먹포 - 매장검색</title>
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

.row{
width:90%; margin:auto;
}
.header-part.header-on{
width:80%;
height:106px;
margin-left:auto;
margin-right:auto;
}
.store {
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".store").on("click", function() {
			$(this).parent().submit();
		});
	});
	
// 	function fn_movePage(val){
// 	    jQuery("input[name=pageNo]").val(val);
// 	    jQuery("form[name=frm]").attr("method", "post");
// 	    jQuery("form[name=frm]").attr("action","").submit();
// 	}
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
		<!-- 1204 현희 헤더 추가 -->
		<!-- Start Header -->
		<jsp:include page="../common/commonUserHeader.jsp"></jsp:include>
		<!-- End Header -->
		<!-- Start Main -->
		<main>
		<div class="main-part">
			<!-- Start Breadcrumb Part -->
			<section class="breadcrumb-part" data-stellar-offset-parent="true" data-stellar-background-ratio="0.5" style="background-image: url('/images/breadbg1.jpg');">
				<div class="container" style='height:30%'>
					<div class="breadcrumb-inner">
						<h2>매장검색</h2>
						<!-- 홈 -->
						<c:if test="${ sMp eq 'M' }">
							<a href="/common/userMmain.do">Home</a>
						</c:if>
						<c:if test="${ sMp eq 'P' }">
							<a href="/common/userPmain.do">Home</a>
						</c:if>
						<!-- 테이블인지 포장인지  -->
						<c:if test="${ sMp eq 'M' }">
							<span>테이블</span>
						</c:if>
						<c:if test="${ sMp eq 'P' }">
							<span>포장</span>
						</c:if>
						<!-- 1130 현희 추가 끝 -->
					</div>
				</div>
			</section>
			<!-- End Breadcrumb Part -->
			<!-- Start Blog List -->
			<section
				class="home-icon blog-main-section text-center blog-main-2col wow fadeInDown"
				data-wow-duration="1000ms" data-wow-delay="300ms">
				<div class="icon-default">
					<img src="/images/scroll-arrow.png" alt="">
				</div>
				<div class="container">
					<div class="portfolioFilter">
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="blog-right-section">
								<div class="row">
									<c:forEach var="list" items="${ storeList }">
										<c:if test="${ sMp eq 'M' }">
											<form method="post" action="/store/storeMdetail.do">
										</c:if>
										<c:if test="${ sMp eq 'P' }">
											<form method="post" action="/store/storePdetail.do">
										</c:if>
										<!-- 1130 현희 포장/테이블에 따라 경로 바꿈 끝 -->
										<!-- 사업자 등록번호 파라미터로 넘기기 -->
										<input type="hidden" name="rCid" value="${ list.rCid }" />
										<input type="hidden" name="sName" value="${ list.sName }" />
										<!-- 매장 출력 -->
										<div class="store col-md-6 col-sm-6 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
											<div class="blog-right-listing">
												<div class="feature-img">
													<img src="${ list.sUrl }" alt="" style='width:345px; height:218px;'/>
													<h3>${ list.sName }</h3>
													<div>${ list.sAddress }</div>
													<div>${ list.sTel }</div>
													<div>${ list.sClose }</div>
												</div>
											</div>
										</div>
										</form>
									</c:forEach>
									<!-- 매장 목록 값 끝 -->
								<!-- 								</div> -->
								<!-- 								<div class="gallery-pagination"> -->
								<!-- 									<div class="gallery-pagination-inner"> -->
								<!-- 										<ul> -->
								<!-- 											<li><a href="#" class="pagination-prev"> -->
								<!-- 								<i class="icon-left-4"></i> <span>PREV page</span></a></li>  -->
								<!-- 											<li class="active"><a href="#"><span>1</span></a></li> -->
								<!-- 											<li><a href="#"><span>2</span></a></li> -->
								<!-- 											<li><a href="#"><span>3</span></a></li> -->
								<!-- 											<li><a href="#" class="pagination-next"> -->
								<!-- 								 <span>next page</span> <i class="icon-right-4"></i></a></li> -->
								<!-- 										</ul> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								
<!-- 페이징처리 -->
  <form name="frm">
                              <input type="hidden" name="pageNo" />
                                       <div id="page" class="pagination">
<%--                                           <c:if test="${pageVO.pageNo != 0}"> --%>

<%--                                              <span> <c:forEach var="i" --%>
<%--                                                    begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" --%>
<%--                                                    step="1"> --%>
<%--                                                    <c:choose> --%>
<%--                                                       <c:when test="${i eq pageVO.pageNo}"> --%>
<%--                                                          <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">  --%>
<%--                                                          <font style="font-weight: bold;">${i}</font> --%>
<!--                                                          </a> -->
<%--                                                       </c:when> --%>
<%--                                                       <c:otherwise> --%>
<%--                                                          <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">${i}</a> --%>
<%--                                                       </c:otherwise> --%>
<%--                                                  </c:choose> --%>
<%--                                                 </c:forEach> --%>
<!--                                              </span> -->
<%--                                           </c:if> --%>
                                       </div>
                           </form> 
                              <form name="form2" name="form2" action="/store/storeList.do" >
                           <c:set var="a" value="1"/>
                           <c:set var="b" value="10"/>
                           		<div id="paging" class="pages">
                           		<input type="hidden" name="sMp" value="${sMp }"/>
                           		<input type="hidden" name="sSido" value="${pSido }"/>
                           		<input type="hidden" name="sCate" value="${pCate }"/>
                           		<input type="button" class="prev" value="<"/>
                           		
                           		
                           		<c:forEach var="i" begin="1" end="${pageVO.totalCount}" step="1">
                           		
                           		<c:if test="${i%10==1 }">
                           		<c:if test="${a <= 10}">
<%--                            		<a href="javascript:fn_movePage(${a})">${a}</a> --%>
								<input type="submit" name="pageNo" value="${a }"/>
                           		
                           		</c:if>
                           		
                           		
                           		<c:set var="a" value="${a+1}"/>
                           	    
                           		</c:if>
                           		
                           		</c:forEach>
                           		<input type="button" class="next" value=">"/>
                           		</div>
                           </form>  
<!-- 페이징처리 끝-->
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- End Blog List -->
		</div>
		</main>
		<!-- End Main -->

		<!-- 푸터 추가&잠시주석처리 -->
		<!-- Start Footer -->
		<%--      		<jsp:include page="../common/commonUserFooter.jsp"></jsp:include> --%>
		<!-- End Footer -->

	>
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