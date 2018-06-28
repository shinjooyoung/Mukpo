<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <% request.setCharacterEncoding("euc-kr");%>
   <%String rCid = request.getParameter("rCid"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Checkout - Laboom</title>
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
    <style type="text/css">
    	.jq-selectbox__trigger-arrow{top:5px;}
    	.button-default{line-height:30px}
    	.select-dropbox{height:21px;}
    	.button-default{min-width:100px;padding:0px;}
    	.shop-checkout-left{padding:40px 52px 34px;} 
    	.shop-checkout-right{background-color:#F4F2ED}
    	.btn-main .modi{min-width:100px; height:30px; line-height:30px;}
    	#bosstb {
   box-shadow: 5px 5px 5px 5px lightgray;
   color: #999999;
   background-color: white;
   padding: 10px;
   font-size: 10px;
   clear: both;
   border-radius: 10px;
}
.shop-checkout-right h5{
margin:0 0 0 0;
}
.shop-checkout-right h5 strong{
color:#e4b95b;
}

#addbtn {
	display: inline-block;
}
.storemg-ck{cursor:pointer;}
#storemodifybtn{cursor:pointer;}
#storedeletebtn{cursor:pointer;}
.menumg-ck{cursor:pointer;}
#menumgbtn{cursor:pointer;}
.reservemg-ck{cursor:pointer;}
#reservemgbtn{cursor:pointer;}
    	
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="/js/store/modify.js"></script>
</head>

                
<body>
   <input type="hidden" value=<%=rCid%> id="paramval">
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
        <!-- End Header -->
        <!-- Start Main -->
        <main>
            <div class="main-part">
                <!-- Start Breadcrumb Part -->
                
                <!-- End Breadcrumb Part -->
                <section style="background-color:white;" class="home-icon shop-cart bg-skeen">
                    
                    <div class="container">
                        
                        <div class="row"> 
                        	<div>
							  
							<h2><img src="/images/img10.png" alt="Laboom"/>${storeVO.sName} : 매장 설정</h2> 
							</div>    
                            <div class="col-md-3 col-sm-5 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
						
                                <div style="background-color:#F4F2ED;box-shadow: 4px 4px 3px #000;" class="shop-checkout-left">
                                  
                                  <div class="storemg-main">
                                  <h4 class="storemg-ck">매장정보관리</h4>
                                  <div class="storemg" style="display:none;">
                                  <h6 id="storemodifybtn">-매장 정보 수정</h6>
                                  <h6 id="storedeletebtn">-매장 삭제</h6> 
                                  </div>
                                  </div>
                                  
                                  <div class="menumg-main">
                                  <h4 class="menumg-ck">메뉴 관리</h4>
                                  <div class="menumg" style="display:none;">
                                  <h6 id="menumgbtn">-메뉴 관리</h6>
                                  </div>
                                  </div>
                                  
                                  <div class="reservemg-main">
                                  <h4 class="reservemg-ck">예약 관리</h4> 
                                  <div class="reservemg" style="display:none;">
                                  <h6 id="reservemgbtn">-예약 관리</h6>
                                  </div>
                                </div>
                                </div>
                            </div>
                            
                            
                            <div class="col-md-9 col-sm-7 col-xs-12 wow" data-wow-duration="1000ms" data-wow-delay="300ms">
                            
                            
                            
                            <!-- 메뉴 리스트 가져오기 -->
                            <div id="list" style="display: block" class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <div style="box-shadow: 4px 4px 3px #000;" class="shop-checkout-right">
                           
                           <h3>메뉴 관리</h3> 
                           <div class="portfolioFilter">
                              <input type='image' src='/images/plus.png' id="addbtn"
                                 style="width: 6%; height: 6%;">
                                 <div class="portfolioFilter-inner">
                                 <a href="javascript:;" data-filter="*" class="current">전체메뉴</a>
							<c:choose>
							<c:when test="${cateList=='[]'}">
           		 <a href="javascript:;" data-filter="" class="current">카테고리가 없습니다.</a> 
        		</c:when>
        			<c:otherwise>
						 
				<c:forEach var="list" items="${cateList}" end="30" >
							<a href="javascript:;" data-filter=".${list.mCate }">${list.mCate }</a> 
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</div>
                              </div>
                              
                <div class="portfolioContainer row">
<!-- 				메뉴 리스트 화면 -->
				<c:choose>
				<c:when test="${menuList == '[]'}">
 				<div><h3>등록된 메뉴가 없습니다.</h3></div>
        		</c:when>
        		<c:otherwise>
				<c:forEach var="list" items="${menuList}" end="30" >
				
					    <div class="col-md-3 col-sm-6 col-xs-12 ${list.mCate}">
                                <div>
                                    <div class="shop-product">
                                        <img src="/images/img56.png" alt="">
                                        <div class="cart-overlay-wrap">
                                            <div class="cart-overlay">
                                                <input type="button" name="${list.mId}" class="shop-cart-btn" value="ADD TO CART"/>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#"><h5 style="height: 60px;"class="${list.mId}">${list.mName }</h5></a>
                                    <h5><strong class="${list.mId}">${list.mPrice }</strong></h5>
                                </div>
                            </div>
					
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
                        </div> 
                        </div>
                        
                        <!-- 메뉴상세 -->
                        <div align="center" style="display: none" id="detail" class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                           <img src="/images/img2.png" style="width: 400px; height: 300px;"><br>
                           <div align="center">
                              <div>

                                 <h5 style="color: #e4b95b; margin-left: 33%;">
                                    <label>CAPO STEAK</label> <span style="margin-right: 50%">&nbsp;&nbsp;$
                                       45.00</span>
                                 </h5>
                                 <hr
                                    style="display: block; border: black 0 none; border-top: black 1px dotted; height: 1px; width: 300px;">
                                 <p>여기는 음식 상세정보가 들어갈 곳</p>
                              </div>
                           </div>
                        </div> 
                        <!-- 메뉴등록 -->
                        <div id="addmenu" style="display: none" class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                           <div class="modal-content">
                              <div class="modal-body" style="border: 0; outline: 0;">
                                 <div>
                                    <h3>
                                       <img src="/images/food.png"
                                          style="width: 60px; height: 60px">메뉴등록
                                    </h3>
                                    <hr />

                                 </div>

                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div>
                                       <!--                                 <img src="images/img2.png" class="img-circle" style=width:380px;height:330px;> -->
                                       <img src="/images/img2.png" class="img-circle"
                                          onmouseover="this.src='images/insert2.png';"
                                          onmouseout="this.src='images/img2.png';"
                                          style="width: 380px; height: 330px; cursor: pointer;" />
                                          
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                       <input type="text" class="form-control"
                                          placeholder="선택 테이블"> <input type="text"
                                          class="form-control" placeholder="메뉴명"> <input
                                          type="text" class="form-control" placeholder="가격">
                                       <textarea class="form-control" rows="3" placeholder="상세설명"
                                          style="border-radius: 80px;height:30%;"></textarea>
                                    </div>
                                 </div>
                                 <button type="button" class="btn btn-default btn-lg active"
                                    style="margin-left: 90%">등록</button>
                              </div>
                           </div>

                        </div> 
                        
                        <!-- 메뉴수정 -->
                        <div id="modifymenu" style="display: none" class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                           <div class="modal-content">
                              <div class="modal-body" style="border: 0; outline: 0;">
                                 <div>
                                    <h3>
                                       <img src="/images/food.png"
                                          style="width: 60px; height: 60px">메뉴수정
                                    </h3>
                                    <hr />

                                 </div>

                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div>
                                       <img src="/images/img2.png" class="img-circle"
                                          onmouseover="this.src='images/reverse3.png';"
                                          onmouseout="this.src='images/img2.png';"
                                          style="width: 380px; height: 330px; cursor: pointer;" />
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                       <input type="text" class="form-control"
                                          placeholder="선택 테이블"> <input type="text"
                                          class="form-control" placeholder="메뉴명"> <input
                                          type="text" class="form-control" placeholder="가격">
                                       <textarea class="form-control" rows="3" placeholder="상세설명"
                                          style="border-radius: 80px;"></textarea>
                                    </div>
                                 </div>
                                 <button type="button" class="btn btn-default btn-lg active"
                                    style="margin-left: 90%">등록</button>
                              </div>
                           </div>

                        </div> 
                        
                              
                        <!-- 예약관리 -->
                        <div id="managere" style="display: none;" class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                           <div style="box-shadow: 4px 4px 3px #000;" class="shop-checkout-right">
                           <table class="shop-cart-table">
                              <thead>
                                 <tr>
                                    <th style="font-size: 15px; text-align: center;">회원ID</th>
                                    <th style="font-size: 15px; text-align: center;">예약 유형</th>
                                    <th style="font-size: 15px; text-align: center;">예약 날짜</th>
                                    <th style="font-size: 15px; text-align: center;">인원 수</th>
                                    <th style="font-size: 15px; text-align: center;">테이블 번호</th>
                                    <th style="font-size: 15px; text-align: center;">예약 상태</th>
                                     <th style="font-size: 15px; text-align: center;">수락/거절</th>
                                 </tr>
                              </thead>
                              <tbody id="relist">
                              
                              <!-- 동적 예약 리스트 생성 -->
                 
                              </tbody>
                           </table>
                           </div>
                        </div>  
                        <!--매장 삭제 화면 -->
                        <div id="storedelete" style="display:none;"class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                                <div style="box-shadow: 4px 4px 3px #000;" class="shop-checkout-right">
                                <form action="storeDeleteOk.do" name="store" method="post">
                                <h3>매장 삭제</h3> 
                                <FONT SIZE="4">안녕하세요! 밍키사장님,</FONT><br/> 
                                <FONT SIZE="4">매장을 삭제하려고 하신다니 아쉽네요.</FONT>
                                <br/>
                                <h4>삭제하기 전에 이유를 알려주세요.</h4>
                                <div class="col-md-7 col-sm-12 col-xs-12">
                                                <select class="select-dropbox">
                                                    <option>--</option>
                                                    <option>폐업을 하게 되었어요.</option>
                                                    <option>서비스를 그만 이용하고 싶어요.</option>
                                                    <option>다른 계정을 사용해요.</option>
                                                    <option>서비스에 문제가 많아요.</option>
                                                    <option>기타</option>
                                                </select>
                                            </div>
                                             <div class="col-md-5 col-sm-12 col-xs-12">
                                             <input type="hidden" name="bId" value="${storeVO.bId }"/>
                                             <input type="hidden" name="rCid" value="${storeVO.rCid }"/>
                                             <input name="submit" class="btn-black" type="submit" value="삭제"/>
                                             </div>
                                             </form>
                                </div>
                            </div>
                            
                            
                            
                  				<!--매장 정보 수정 화면 --> 
                                <div id="storemodify" style="display:none;"class="col-md-12 col-sm-7 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                                <div style="box-shadow: 4px 4px 3px #000;" class="shop-checkout-right">
                               <form action="storeModifyOk.do" name="store" method="post">

										<div class="row">
											<h3>매장 정보 수정</h3>
											<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
												<h5>매장 정보</h5>
											</div>
											<div class="col-md-4 col-sm-12 col-xs-12">
												<input type="text" name="sName" placeholder="${storeVO.sName }" value="${storeVO.sName }">
											</div>
											<div class="col-md-4 col-sm-12 col-xs-12">
												<input type="text" name="sPw" placeholder="${storeVO.sPw}" value="${storeVO.sPw}">
											</div>

											<div class="col-md-12 col-sm-12 col-xs-12">
												<div class="col-md-7 col-sm-12 col-xs-12">
													<input type="text" name="sTel" placeholder="${storeVO.sTel}" value="${storeVO.sTel}">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="text" name="sOpentime" placeholder="${storeVO.sOpentime}" value="${storeVO.sOpentime}">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="text" name="sClosetime" placeholder="${storeVO.sClosetime}" value="${storeVO.sClosetime}">
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12">
													<textarea name="sDetail" placeholder="${storeVO.sDetail}">${storeVO.sDetail}</textarea>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>카테고리 선택</h5>
												</div>
												<div class="col-md-4 col-sm-12 col-xs-12">
													<select class="select-dropbox" name="sCate">
														<option value="한식">한식</option>
														<option value="분식">분식</option>
														<option value="일식">일식</option>
														<option value="중식">중식</option>
														<option value="양식">양식</option>
														<option value="패스트푸드">패스트푸드</option>
														<option value="카페">카페</option>
														<option value="뷔페식">뷔페식</option>
													</select>
												</div>
												<div class="col-md-8 col-sm-12 col-xs-12"></div>

												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="text" name="sZipcode" placeholder="${storeVO.sZipcode}" value="${storeVO.sZipcode}">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<input type="button" name="submit" value="우편번호 검색"
														class="button-default button-default-submit btn2">
												</div>
												<div class="col-md-7 col-sm-12 col-xs-12">
													<input type="text" name="sAddress" placeholder="${storeVO.sSido} ${storeVO.sSigungu}" value="${storeVO.sSido} ${storeVO.sSigungu}">
												</div>
												<div class="col-md-9 col-sm-12 col-xs-12">
													<input type="text" name="sSido" placeholder="${storeVO.sAddress}" value="${storeVO.sAddress}">
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>휴무일 선택</h5>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12">
													<label> <input type="checkbox" name="checkbox"
														name="day" value="월">월
													</label> <label> <input type="checkbox" name="checkbox"
														value="화">화
													</label> <label> <input type="checkbox" name="checkbox"
														value="수">수
													</label> <label> <input type="checkbox" name="checkbox"
														value="목">목
													</label> <label> <input type="checkbox" name="checkbox"
														value="금">금
													</label> <label> <input type="checkbox" name="checkbox"
														value="토">토
													</label> <label> <input type="checkbox" name="checkbox"
														value="일">일
													</label>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>먹포 선택</h5>
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12">
													<select class="select-dropbox" name="sMp">
														<option value="M">먹고 간다.</option>
														<option value="P">포장 한다.</option>
														<option value="MP">둘다 한다.</option>
													</select>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>매장 테이블 정보</h5>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<div class="col-md-3 col-sm-12 col-xs-12">
														<h6>매장 테이블 갯수</h6>
														<select class="select-dropbox" name="tCnt">
															<option value="0">0</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
															<option value="9">9</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
														</select>
													</div>
													<div class="col-md-4 col-sm-12 col-xs-12">
														<h6>테이블당 인원수</h6>
														<input type="text" name="tMax" placeholder="테이블당 최대 인원">
													</div>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo">
													<h5>매장 혼잡도 설정</h5>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
													<h6>여유</h6>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<input type="text" name="GcsCnt" placeholder="주문건수">
													</div>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<select class="select-dropbox" name="GcsTime">
															<option value="0">0분</option>
															<option value="10">10분</option>
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="50">50분</option>
															<option value="60">60분</option>
														</select>
													</div>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
													<h6>보통</h6>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<input type="text" name="YcsCnt" placeholder="주문건수">
													</div>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<select class="select-dropbox" name="YcsTime">
															<option value="0">0분</option>
															<option value="10">10분</option>
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="50">50분</option>
															<option value="60">60분</option>
														</select>
													</div>
												</div>
												<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
													<h6>혼잡</h6>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<input type="text" name="RcsCnt" placeholder="주문건수">
													</div>
													<div class="col-md-3 col-sm-12 col-xs-12">
														<select class="select-dropbox" name="RcsTime">
															<option value="0">0분</option>
															<option value="10">10분</option>
															<option value="20">20분</option>
															<option value="30">30분</option>
															<option value="40">40분</option>
															<option value="50">50분</option>
															<option value="60">60분</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12 col-sm-12 col-xs-12 storeinfo2">
												<a href="storeMain.do"
													class="button-default button-default-submit btn">뒤로가기</a> <input
													type="submit" name="store" value="등록"
													class="button-default button-default-submit btn"/>
													<input type="hidden" name="rCid" value="${storeVO.rCid}"/>
											</div>
										</div>
									</form>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <!-- End Main -->
        <!-- Start Footer -->
        
        <!-- End Footer -->
        <!-- Start Book Table -->
        <div class="modal fade booktable" id="booktable" tabindex="-1" role="dialog" aria-labelledby="booktable">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="table-title">
                            <h2>Reservation</h2>
                            <h6 class="heade-xs">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h6>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="select-dropbox">
                                    <option>Hour</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="select-dropbox">
                                    <option>Number of People</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="txt" placeholder="Pick a Date" class="date-pick">
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="txt" placeholder="Phone Number">
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="email" name="email" placeholder="Email Address">
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <button class="btn-main btn-big">BOOK A TABLE</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Book Table -->
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
</body>

</html>