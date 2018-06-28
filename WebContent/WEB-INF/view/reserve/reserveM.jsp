<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>먹포 - 테이블 예약</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.css" />
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
<link href="/css/reserve/reserveM.css" rel="stylesheet" />
<link href='/css/reserve/calendar.css' rel='stylesheet' />
<link href='/css/reserve/fullcalendar.css' rel='stylesheet' />
<link href='/css/reserve/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='/css/reserve/jquery.timepicker.css' rel='stylesheet' />
<link href='/css/reserve/jquery.timepicker.min.css' rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#reserveTable").click(function() {
			location.href = "reserveMPayment.do";
		});
	});
</script>
</head>
<body>
	<!--  <div class="modal fade booktable" id="booktable" tabindex="-1" role="dialog" aria-labelledby="booktable"> -->
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" id="clo" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<div class="table-title">
					<h2>먹고갈꺼니?</h2>
					<h6 class="heade-xs">잘생각 했어 b</h6>
				</div>
				<div id='calendar'></div>
				<script>
            $(document).ready(function() {

            // page is now ready, initialize the calendar...

            $('#calendar').fullCalendar({
                // put your options and callbacks here
                left:   'Calendar',
                center: '',
                right:  'today prev,next'
                });
            });
        		</script>
				<form action="/reserve/reserveMPayment.do" method="post">
					<!-- 사업자등록번호 -->
					<input type="hidden" name="rTnum" value="${ reserveInfo.rTnum }" />
					<input type="hidden" id="mId" name="mId" value="${ sessionScope.userName }"> 
					<input type="hidden" name="rCid" value="${ param.rCid }" /> 
					
					<div class="row rowTopMargin">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="rDate" name="rDate" placeholder="예약날짜" readonly />
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="disableTimeRangesExample" name="rTime" placeholder="예약시간"
								id="disableTimeRangesExample" />
						</div>

						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="rPnum" placeholder="인원수" />
						</div>

						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" name="rMemo" placeholder="요청사항" />
						</div>

						<div class="col-md-6 col-sm-6 col-xs-12"> <!-- 회원이름  -->
							<input type="text" name="rName" value="${reserveUserInfo.get(0).getmName().toString()}" readonly/>
						</div>
						
						<div class="col-md-6 col-sm-6 col-xs-12"> <!-- 회원 전화번호 -->
							<input type="text" name="rTel" value="${ reserveUserInfo.get(0).getmTel().toString() }" readonly/>
						</div>


					</div>
					<input type="submit" value="예약하기">
				</form>
			</div>
		</div>
	</div>
	<!-- Back To Top Arrow -->
	<a href="#" class="top-arrow"></a>
	<!-- 1206 아름 ax5tpast -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.min.js"></script>


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
	<script src="/js/reserve/reserveM.js"></script>
	<script src="/js/reserve/calendar.js"></script>
	<script src='/js/reserve/moment.min.js'></script>
	<script src='/js/reserve/jquery.min.js'></script>
	<script src='/js/reserve/fullcalendar.min.js'></script>
	<script src="/js/reserve/jquery.timepicker.js"></script>
	<script src="/js/reserve/jquery.timepicker.min.js"></script>

</body>
</html>