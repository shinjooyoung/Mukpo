<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE> 
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<!-- 1207 현희 index css -->
<link href="/css/common/index.css" rel="stylesheet" />
<title>먹포 - 먹고갈래? 포장할래?</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
<!-- 로그인 아이디확인 -->
<input type="hidden" id="mId" name="mId" value="${ sessionScope.userName }" />
	<div id="body"> <!-- body 와 footer를 나눌 div -->	
		<div id="body2"> <!-- mMain & 로고 & pMain 묶어줄 div -->
			<div id="mainText">
				<div id="textdiv">
					<img id="imgMaintext" src="/images/common/logotext.png"> <!-- 문구 -->
				</div>
			</div>
			<div id="body3">
				<div id="mainLogo"> <!-- 로고를 묶어줄 div -->
					<img id="imgMainLogo" src="/images/common/로고2.png">
				</div>
				<div id="UserMmain"></div> <!-- Mmain -->
				<div id="UserPmain"></div> <!-- Pmain -->
			</div>
		</div>
	</div>

   <!-- Start Footer -->
   <footer>
   <div class="footer-part">

<!--로그인 안했을 때 --> 
   <c:if test="${ empty sessionScope.userName}">
		<div class="icon-find" id="test">
      		<img id="loginjoin" src="/images/common/loginjoin.png" >
      	</div>
   </c:if>
<!--로그인했을시 안보이게 시작 -->
<!-- 로그인했을 때 welcome 이미지 -->
   <c:if test="${ !empty sessionScope.userName }">
      <div class="icon-find" id="test">
      	<img id="loginjoin" src="/images/common/welcome.png" >
      </div>
   </c:if>
    <div id="footer">
	      <img src="/images/common/ㄴㅇㄹ.png" id="logo3" /> 
	      
	      <!-- 주소, 전화번호, 이메일 -->
	      <div id="mukpoInfo">
	      	<div><img src="/images/common/location.png" /> 서울특별시 금천구 가산동</div>&nbsp;&nbsp;&nbsp;&nbsp;
	      	<div><img src="/images/common/call.png" />&nbsp;&nbsp;010.4300.6867</div>&nbsp;&nbsp;&nbsp;&nbsp;
	      	<div><img src="/images/common/email.png" />&nbsp;&nbsp;mukpo151@gmail.com</div>
	      </div>
	      
	      <!-- 푸터 메뉴들 -->
	      <div id="fotterMenu">
		      <a>ABOUT</a> &nbsp; | &nbsp; <!-- 먹포에 관한 설명 페이지로 이동 -->
		      <a href="/store/storeBossLogin.do">BOSS</a> &nbsp; | &nbsp;  <!-- 사장님 로그인화면으로 이동 -->
		      <a id="mypage">MYPAGE</a> &nbsp; | &nbsp;  <!-- 로그인 안했을 경우, 로그인/회원가입 페이지로 이동 // 로그인 했을 경우 해당 사용자의 마이페이지로 이동 -->
		      <a>NOTICE</a> <!-- 공지사항 페이지로 이동 -->
	      </div>
      </div>
      
      <!-- 로그인 회원가입 클릭하면 나오는 화면 -->
      <div class="location-footer-map">
		<c:if test="${ empty sessionScope.userName  }">
         <div class="icon-find-location">         
<!-- 로그인이미지 수정 -->            
            <img id="loginjoin-visible" src="/images/common/loginjoin.png" >
         </div>
          </c:if>
<!-- 로그인했을시 안보이게 끝 -->
         <section id="mainLogin" class="home-icon login-register bg-skeen">
         <div class="container">
            <div class="row">
               <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                  <div class="login-wrap form-common">
                     <div class="title text-center">
                        <h3 class="text-coffee">로그인</h3>
                     </div>
                     <form action="common/home.do" class="login-form" method="post" name="login">
                        <div class="row">
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="text" name="mId" placeholder="아이디" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="password" name="mPw" placeholder="비밀번호" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <div class="row">
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <label><input type="checkbox" name="chkbox">아이디/비밀번호 기억하기</label>
                                 </div>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <a href="#" class="pull-right">비밀번호 찾기</a>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="submit" name="submit" value="로그인" class="button-default button-default-submit">
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                  <div class="register-wrap form-common">
                     <div class="title text-center">
                        <h3 class="text-coffee">회원가입</h3>
                     </div>
                     <form action="/user/insertMemberJoin.do"class="register-form" method="post" name="register">
                        <div class="row">
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="text" name="mId" placeholder="아이디" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="password" name="mPw" placeholder="비밀번호" class="input-fields">
                           </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="password" placeholder="비밀번호 확인" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="text" name="mName" placeholder="이름" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="text" name="mTel" placeholder="전화번호" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="text" name="mBorn" placeholder="생년월일(YYYY/MM/DD)" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="text" name="mEmail" placeholder="이메일(mukpo@gmail.com)" class="input-fields">
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <input type="submit" name="submit" class="button-default button-default-submit" value="회원가입">
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>         
         <div id="footer-visible">
		      <img src="/images/common/ㄴㅇㄹ.png" id="logo3" />
		      <!-- 푸터 메뉴들 -->
		      <div id="fotterMenu"> 
			      <a>ABOUT</a> &nbsp; | &nbsp; <!-- 먹포에 관한 설명 페이지로 이동 -->
			      <a href="/store/storeBossLogin.do">BOSS</a> &nbsp; | &nbsp;  <!-- 사장님 로그인화면으로 이동 -->
			      <a id="mypage">MYPAGE</a> &nbsp; | &nbsp;  <!-- 로그인 안했을 경우, 로그인/회원가입 페이지로 이동 // 로그인 했을 경우 해당 사용자의 마이페이지로 이동 -->
			      <a>NOTICE</a> <!-- 공지사항 페이지로 이동 -->
		      </div>
	      </div>
         </section>
      </div>
      </div>
   </footer>
   <!-- End Footer -->

   <script src="/js/jquery.min.js"></script>
   <script src="/plugin/bootstrap/bootstrap.min.js"></script>
   <script src="/plugin/bootstrap/bootstrap-datepicker.js"></script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf6My1Jfdi1Fmj-DUmX_CcNOZ6FLkQ4Os"></script>
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
   <script src="/js/common/loginCheck.js"></script>
</body>
</html>