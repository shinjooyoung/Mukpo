<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>먹포 - 매장즐겨찾기</title>
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
    <link href="/plugin/scroll-bar/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="/plugin/animation/animate.min.css" rel="stylesheet">
    <link href="/css/theme.css" rel="stylesheet">
    <link href="/css/responsive.css" rel="stylesheet">
<!-- 1205 아름 css 추가 -->
    <link href="/css/user/userMypage.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!--Start Mypage Header -->
        	<jsp:include page="/WEB-INF/view/common/commonUserMypageHeader.jsp"></jsp:include>
<!--End Mypage Header -->
        
   
        <!-- Start Main -->
            <div class="container">
                <!-- Start Tab Part -->
                <section class="default-section comment-review-tab bg-grey v-pad-remove wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="container">
                        <div class="tab-part">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#mukfavorite" aria-controls="mukfavorite" role="tab" data-toggle="tab">먹고갈래?</a>
                                </li>         
                                <li role="presentation">
                                    <a href="#pofavorite" aria-controls="pofavorite" role="tab" data-toggle="tab">포장할래?</a>
                                </li>
                            </ul>
                            <div class="tab-content">
<!-- 유저 id hidden으로 가져가기 -->
							<input type="hidden" id="mId" name="mId" value="${ sessionScope.userName }">
								
									<div role="tabpanel" class="tab-pane active" id="mukfavorite">
	           			              <div class="comment-blog">
	           			              <c:forEach items="${ favoriteVOList }" var="list">
										<c:if test="${ fn:contains(list.S_MP, 'M')}">
	                                        <div class="comment-inner-list">
	                                            <div class="comment-img">
	                                                <img src="${ list.S_URL }" alt="${ list.S_NAME }">
	                                            </div>
	                                            <div class="comment-info">
	                                                <h5>${ list.S_NAME }</h5>
	                                                <img src="/images/store/likeO.png" alt="" class="favoriteImg" rcid="${ list.R_CID }">
	                                                <p>리뷰수 ${ list.REVIEW_COUNT }</p>
	                                            </div>
	                                        </div>
	                                        </c:if>
	                                        </c:forEach>
	                                    </div>
	                                </div>                 
                                <div role="tabpanel" class="tab-pane" id="pofavorite">
                                    <div class="comment-blog">
                                    <c:forEach items="${ favoriteVOList }" var="list">
                                    <c:if test="${fn:contains(list.S_MP, 'P')}"> 
	                                        <div class="comment-inner-list">
	                                            <div class="comment-img">
	                                                <img src="${ list.S_URL }" alt="${ list.S_NAME }" class="favoriteImg" rcid="${ list.R_CID }">
	                                            </div>
	                                            <div class="comment-info">
	                                                <h5>${ list.S_NAME }</h5>
	                                                <img src="/images/store/likeO.png" alt="" class="favoriteImg" rcid="${ list.R_CID }">
	                                                <p>리뷰수 ${ list.REVIEW_COUNT }</p>
	                                            </div>
	                                        </div>
	                                        </c:if>
	                                        </c:forEach>
	                                    </div>
                                	</div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Tab Part -->
        <!-- End Main -->
    </div>
    <!-- Back To Top Arrow -->
    <a href="#" class="top-arrow"></a>
    <script src="/js/jquery.min.js"></script>
    <script src="/plugin/bootstrap/bootstrap.min.js"></script>
    <script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
    <script src="/https://maps.googleapis.com/maps/api/js?key=AIzaSyAf6My1Jfdi1Fmj-DUmX_CcNOZ6FLkQ4Os"></script>
    <script src="/plugin/form-field/jquery.formstyler.min.js"></script>
    <script src="/plugin/revolution-plugin/jquery.themepunch.plugins.min.js"></script>
    <script src="/plugin/revolution-plugin/jquery.themepunch.revolution.min.js"></script>
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