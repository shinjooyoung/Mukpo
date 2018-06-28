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
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
 <main>
            <div class="main-part">

              <section class="home-icon login-register bg-skeen">
                    <div class="icon-default icon-skeen">
                        <img src="images/scroll-arrow.png" alt="">
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                                <div class="login-wrap form-common">
                                    <div class="title text-center">
                                        <h3 class="text-coffee">로그인</h3>
                                    </div>
                                    <form class="login-form" method="post" name="login" action="/store/storeMain.do">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bId" placeholder="아이디" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="password" name="bPw" placeholder="********" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <label>
                                                            <input type="checkbox" name="chkbox">아이디 기억</label>
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
                                    <form class="register-form" method="post" name="register" action="/store/bossRegister.do">
                                    <div class="title text-center">
                                        <h3 class="text-coffee">회원가입</h3>
                                    </div>
                                    
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bId" placeholder="아이디" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="password" name="bPw" placeholder="비밀번호" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="password" name="password" placeholder="비밀번호 확인" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bName" placeholder="이름" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bTel" placeholder="전화번호" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bBorn" placeholder="YYYY-MM-DD" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bEmail" placeholder="email@gmail.com" class="input-fields">
                                            </div>
                                            
                                        </div>
                                         <div class="title text-center">
                                        <h3 class="text-coffee">우편</h3>
                                    </div>
                                     <div class="row"> 
                                            <div class="col-md-7 col-sm-6 col-xs-12">
                                                <input type="text" name="bZipcode" placeholder="우편번호" class="input-fields">
                                            </div>
                                            <div class="col-md-5 col-sm-6 col-xs-12"> 
                                                <input type="submit" name="submit" value="우편번호 검색" class="button-default">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bAddr1" placeholder="주소" class="input-fields">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <input type="text" name="bAddr2" placeholder="상세주소" class="input-fields">
                                            </div>
                                            <input type="hidden" name="bAddress"/>
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