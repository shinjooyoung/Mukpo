<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Complete - Laboom</title>
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
        	<jsp:include page="../common/commonUserHeader.jsp"></jsp:include>
        <!-- End Header -->
        <!-- Start Main -->
        <main>
            <div class="main-part">
                <!-- Start Breadcrumb Part -->
                <section class="breadcrumb-part" data-stellar-offset-parent="true" data-stellar-background-ratio="0.5" style="background-image: url('/images/breadbg1.jpg');">
                    <div class="container">
                        <div class="breadcrumb-inner">
                            <h2>ORDER COMPLETE</h2>
                            <a href="#">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </section>
                <!-- End Breadcrumb Part -->
                <section class="home-icon shop-cart bg-skeen wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="icon-default icon-skeen">
                        <img src="/images/paymentOk.png" style=whith:50px;height:50px;>
                    </div>
                    <div class="container">
                        <div class="checkout-wrap">
                            <ul class="checkout-bar">
                                <li class="done-proceed">Shopping Cart</li>
                                <li class="done-proceed">Checkout</li>
                                <li class="active done-proceed">Order Complete</li>
                            </ul>
                        </div>
                        <div class="order-complete-box">
                            <img src="/images/mukpo1.png">
                            <p><h2>결제가 완료되었습니다.</h2></p>
                            <a href="userMypageReservList.do" class="btn-medium btn-primary-gold btn-large">예약 내역 보러가기</a>
                             <a href="/index.jsp" class="btn-medium btn-primary-gold btn-large">&nbsp&nbsp&nbsp&nbsp&nbsp홈으로 가기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <!-- End Main -->
       
       <!-- 푸터추가 -->
       
    </div>
    <!-- Back To Top Arrow -->
    <a href="#" class="top-arrow"></a>
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
</body>

</html>