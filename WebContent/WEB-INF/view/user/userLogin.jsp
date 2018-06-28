<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login & Register - Laboom</title>
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
    <!--[if lt IE 9]>
      <script src="/https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="/https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
 <main>
            <div class="main-part">
                <!-- Start Breadcrumb Part -->
               
                <!-- End Breadcrumb Part -->
                <section class="home-icon login-register bg-skeen">
                    
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                                <div class="login-wrap form-common">
                                    <div class="title text-center">
                                        <h3 class="text-coffee">로그인</h3>
                                    </div>
                                    <form class="login-form" method="post" name="login" action="/user/login.do">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="mId" placeholder="아이디" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="password" name="mPw" placeholder="********" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <label>
                                                            <input type="checkbox" name="chkbox">아이디 기억</label>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <a href="/#" class="pull-right">비밀번호 찾기</a>
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
                                    <form class="register-form" method="post" name="register" action="/user/userRegister.do">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="mId" placeholder="아이디" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="password" name="mPw" placeholder="비밀번호" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="password" name="password" placeholder="비밀번호 확인" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="mName" placeholder="이름" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="mTel" placeholder="전화번호" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="mBorn" placeholder="YYYY-MM-DD" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="mEmail" placeholder="email@gmail.com" class="input-fields">
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
                </section>
            </div>
        </main>
</body>
</html>