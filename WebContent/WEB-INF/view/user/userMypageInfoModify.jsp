<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
.tab-part .tab-content {
	padding: 0px 50px 0px;
	margin-top: 20px;
	margin-left: 180px;
}
</style>
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<section
		class="default-section comment-review-tab bg-grey v-pad-remove wow fadeInDown"
		data-wow-duration="1000ms" data-wow-delay="300ms">
		<article class="container">
			<div class="col-md-12">
				<form class="form-horizontal infoModifySubmit" name='infoModifySubmit' action="/user/userMypageInfoModifyOk.do" method="POST">
				<input type="hidden" name="mId" value="${ userInfo.mId }" />
				<input type="hidden" name="mPw" value="${ userInfo.mPw }" />
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputName">이름</label>
						<div class="col-sm-6">
							<input class="form-control" id="inputName" type="text"
								name="mName" value="${ userInfo.mName }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
						<div class="col-sm-6">
							<input type="tel" class="form-control onlynum" id="inputNumber"
								name="mTel" value="${ userInfo.mTel }"  />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
						<div class="col-sm-6">
							<input class="form-control" id="inputEmail" type="email"
								name="mEmail" value="${ userInfo.mEmail }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputName">생년월일</label>
						<div class="col-sm-6">
							<input class="form-control onlynum" id="inputBorn" type="text"
								name="mBorn" value="${ userInfo.mBorn }"  />
						</div>
					</div>
				
				<p name="memberout">먹고갈래? 포장할래? 사이트를 더 이상 이용하지 않는다면, <a href="/user/userMypageMemberout.do">회원탈퇴</a></p>
				
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<a href="javascript:infoModifySubmit.submit();" id="aInfoModifyConfirm" 
							class="btn-main btn-shadow">수정</a> 
						<a href="/common/home.do"
							class="btn-main btn-shadow">취소</a>
					</div>
				</form>
				</div>
			</div>
		</article>
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