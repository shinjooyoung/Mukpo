<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/plugin/bootstrap/bootstrap.css" rel="stylesheet">
<link href="/plugin/bootstrap/minwoo.css" rel="stylesheet">
<link rel='stylesheet prefetch'href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<!-- 1211 주용 부트스트랩추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.modal-content{
height:100%;
}

.modal-dialog{
height:55%;
}

#reviewleft{
float:left;
width:50%;

}
#reviewright{
border:0;
float:right;
width:50%;
height:228px;
overflow:hidden;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	if ("${result}" == 5) {
		alert("${message}");
	}

	$(document).ready(function() {
		
		//리뷰남기기 이벤트
		$(".reviewadd1").each(function() {
			$(this).click(function() {
				//db들어갈 id값 변수선언
				var rid = $(this).parent().parent().children(':eq(3)').text();
				//다이어 로그에 hidden값 지정
				$('#reviewid').val(rid);
				$('#reviewdb').click(function(){
// 					alert($('#reviewid').val());
					//$(".reviewadd1").submit();
				});
				


		});
	});
	});
</script>
</head>

<body>

	<jsp:include page="../common/commonUserMypageHeader.jsp"></jsp:include>
	<div class="container">
		<div class="mail-box">
			<aside class="lg-side">
			<div class="inbox-body">
				<div class="mail-option">
					<div class="chk-all">
						<input type="checkbox" class="mail-checkbox mail-group-checkbox">
						<div class="btn-group">
							<a data-toggle="dropdown" href="#" class="btn mini all"
								aria-expanded="false"> All <i class="fa fa-angle-down "></i>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"> None</a></li>
								<li><a href="#"> Read</a></li>
								<li><a href="#"> Unread</a></li>
							</ul>
						</div>
					</div>

					<div class="btn-group">
						<a data-original-title="Refresh" data-placement="top"
							data-toggle="dropdown" href="#" class="btn mini tooltips"> <i
							class=" fa fa-refresh"></i>
						</a>
					</div>
					<div class="btn-group hidden-phone">
						<a data-toggle="dropdown" href="#" class="btn mini blue"
							aria-expanded="false"> More <i class="fa fa-angle-down "></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-pencil"></i> Mark as
									Read</a></li>
							<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
						</ul>
					</div>
					<div class="btn-group">

						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-pencil"></i> Mark as
									Read</a></li>
							<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
						</ul>
					</div>

					<ul class="unstyled inbox-pagination">
						<li><span>1-50 of 234</span></li>
						<li><a class="np-btn" href="#"><i
								class="fa fa-angle-left  pagination-left"></i></a></li>
						<li><a class="np-btn" href="#"><i
								class="fa fa-angle-right pagination-right"></i></a></li>
					</ul>
				</div>
				<table class="table table-inbox table-hover">
					<tbody>
						<tr class="unread">

							<td class="inbox-small-cells"></td>
							<td class="view-message dont-show">주문일시</td>
							<td class="view-message dont-show">업소명</td>
							<td class="view-message dont-show">주문번호</td>
							<td class="view-message dont-show">주문금액</td>
							<td class="view-message inbox-small-cells">주문 예약상태</td>
							<td class="view-message dont-show">리뷰</td>
						</tr>

							<!--=예약내역 db값  for문 -->
						<c:forEach items="${voList}" var='reserve'>
							<tr class="reserved">
								<td class="inbox-small-cells"><input type="checkbox"
									class="mail-checkbox"></td>
								<!--예약내역 db값 출력 -->
								<td class="view-message dont-show">${reserve.R_DATE}</td>
								<td class="view-message dont-show">${reserve.S_NAME}</td>
								<td class="view-message dont-show">${reserve.R_ID}</td>
								<td class="view-message dont-show">${reserve.R_KEEPMONEY}</td>
								<td class="view-message inbox-small-cells">${reserve.R_YN}</td>
								<!-- db리뷰 select, insert-->
									<!--db리뷰 없는 회원 리뷰 남기기 버튼 -->
								<!--db리뷰 있는 회원 리뷰 보기 버튼 -->
								<c:choose>
									<c:when test="${reserve.RV_ID eq null}">
										<td class="view-message dont-show reviewadd"><input
											type="button" class="btn btn-default reviewadd1" value="리뷰 남기기"
											data-toggle="modal" data-target="#booktable" /></td>
									</c:when>
									<c:otherwise>
										<td class="view-message dont-show review"><input
											type="button" class="btn btn-default reviewselect" value="리뷰 보기"
											data-toggle="modal" data-target=".booktable${reserve.RV_ID}" /></td>
										<!-- 리뷰보기  다이어로그-->
										<div class="modal fade booktable tavleclose booktable${reserve.RV_ID}"
											tabindex="-1" role="dialog" aria-labelledby="booktable">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-body">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<div class="table-title">
															<h2>리뷰 보기</h2>
															<h6 class="heade-xs">${reserve.R_DATE}</h6>
														</div>
															<div class="memberpic" class="reviewleft">
																<img id = "reviewleft" alt="" src="/images/img56.png">
																<textarea id = "reviewright" readonly >${reserve.RV_CONTENT}</textarea>
													</div>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</aside>
		</div>
	</div>

	<!-- 리뷰작성 다이어로그 -->
	<div class="modal fade booktable tavleclose" id="booktable"
		tabindex="-1" role="dialog" aria-labelledby="booktable">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="table-title">
						<h2>리뷰 작성</h2>
					</div>
					<form action="/user/reviewInsert.do">
						<div>
							<input type="hidden" name="rId" id="reviewid"value="">
							<textarea rows="100%" cols="100%" id="recontent" name="rvContent"></textarea>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<button class="btn-main btn-big" id='reviewdb'>등록하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>