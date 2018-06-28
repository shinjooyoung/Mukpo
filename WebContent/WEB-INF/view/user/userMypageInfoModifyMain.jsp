<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty sessionScope.userName }">
	<c:redirect url="/user/userLogin.do" />
</c:if>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>먹고갈래? 포장할래? - 회원정보수정</title>
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
	<section
		class="default-section comment-review-tab bg-grey v-pad-remove wow fadeInDown"
		data-wow-duration="1000ms" data-wow-delay="300ms">
		<div class="container">
			<div class="tab-part">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#reviews"
						aria-controls="reviews" role="tab" data-toggle="tab">회원정보 수정</a></li>
					<li role="presentation"><a href="#description"
						aria-controls="description" role="tab" data-toggle="tab">비밀번호
							변경</a></li>
				</ul>
				<div class="tab-content">
					<!-- 회원정보수정 -->
					<div role="tabpanel" class="tab-pane active" id="reviews">
						<form action="/user/userMypageInfoModify.do" name='infoPwCheck' method="post"
							class="infoPwCheck">
							<div style="border-radius: 2em; padding-top: 23px;"
								class="title text-center">
								<div class="pwConfirm">
									<h6 name="infoModicyCheck" style="vertical-align: middle">비밀번호</h6>
									<input style="height: 40px" type="password" name="mPw" />
								</div>
								<br /> <a href="javascript:infoPwCheck.submit();" id="aInfoPwCheck" name="infoModify"
									class="btn-main btn-shadow">확인</a> <a href="/common/home.do"
									name="infoModify" class="btn-main btn-shadow">취소</a>
							</div>
						</form>
					</div>
					<!-- 비밀번호변경 -->
					<div role="tabpanel" class="tab-pane" id="description">
						<form action="/user/userMypageInfoPWModify.do" method="post"
							id="infoPwModify" name='infoPwModify'>
							<div style="border-radius: 2em; padding-top: 23px;"
								class="title text-center">
								<div class="pwConfirm">
									<h6 name="infoModicyCheck" style="vertical-align: middle">현재
										비밀번호</h6>
									<input style="height: 40px" type="password" name="rmPw" />
								</div>
								<div class="pwConfirm">
									<h6 name="infoModicyCheck" style="vertical-align: middle">새
										비밀번호</h6>
									<input style="height: 40px" type="password" name="mPw"
										id="user_pass" />
								</div>
								<div class="pwConfirm">
									<h6 name="infoModicyCheck" style="vertical-align: middle">새
										비밀번호 확인</h6>
									<input style="height: 40px" type="password" name="mPwNewCh" id="chpass" />
								</div>
								<br /> <a href="javascript:infoPwModify.submit();" id="aInfoPwModify"
									class="btn-main btn-shadow" name="infoModify">확인</a> <a href="/common/home.do"
									class="btn-main btn-shadow" name="infoModify">취소</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
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
<script src="/js/user/userMypage.js"></script>
</html>