<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사용자 헤더</title>
<link href="/css/common/commonUserHeader.css" rel="stylesheet"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/js/common/commonUserHeader.js"></script>
</head>
<body>

	<!-- Start Header -->
	<header>
		<div class="header-part header-on">
			<div class="header-bottom">
				<!-- 메뉴헤더 시작 -->
				<div class="container">
						<!-- 로고 -->
						<div id="headerLogo" class="con-div">
							<img src="/images/common/로고1.png" />	
						</div>
						
						<!-- 먹포 구분 -->
						<div id="headerMP" class="con-div">
							<c:if test="${ sMp == 'M' }"> <img src="/images/common/m_icon.png" /> </c:if>
							<c:if test="${ sMp == 'P' }"> <img src="/images/common/p_icon.png" /> </c:if>
							<ul class="drop-nav" id="mpdrop">
								<li><a href="/common/userMmain.do"> ▶ 먹고갈래?</a></li>
								<li><a href="/common/userPmain.do"> ▶ 포장할래?</a></li>
							</ul>
						</div>
						
						<!-- 검색 -->
						
						<div id="headerSearch" class="con-div search-part">
								<img src="/images/common/search.png" />
								<ul class="drop-nav" id="searchdrop">
									<!-- 검색창 -->
									<li>
										<form id="searchForm" method="post" action="/store/storeList.do">
											<input id="txtSearch" type="text" name="sName" placeholder="입력하지 않으면 전체 식당이 검색됩니다." />
											<input id="btnSearch" type="button" value=""/>
											<input id="sMp" type="hidden" name="sMp" value="${ sMp }" />
											<input id="sCate" type="hidden" name="sCate" value="" />
											<input id="sSido" type="hidden" name="sSido" value="" />
											
										</form>
									</li>
									<!-- 지역 메뉴 -->
									<li class="mega-menu" style="padding-left: 35px;"><span class="menuname">지역</span>
										<ul id="locationdrop">
											<li id="selecgg"><input type="checkbox" name="" value="서울" />서울</li>
											<li id="Gyeonggi"><input type="checkbox" name="" value="경기도" />경기도</li>
											<li id="Chungcheongnam"><input type="checkbox" name="" value="충남" />충남</li>
											<li id="Daejeon"><input type="checkbox" name="" value="대전" />대전</li>
											<li id="Gwangju"><input type="checkbox" name="" value="광주" />광주</li>
											<li id="Busan"><input type="checkbox" name="" value="부산" />부산</li>
											<li id="loChk"></li>
										</ul>
									</li>
									<!-- 카테고리 메뉴 -->
									<li class="mega-menu"><span class="menuname">카테고리</span>
										<ul id="categorydrop">
											<li><input type="checkbox" name="sCate2" class='foodchk' value="뷔페식" />뷔페식</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="탕류" />탕류</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="카페" />키페</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="한식" />한식</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="일식" />일식</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="패스트푸드" />패스트푸드</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="중국식" />중국식</li>
											<li><input type="checkbox" name="sCate2" class='foodchk' value="BGM" />BGM</li>
											<li id="cataAll2">선택하지 않을 경우, <span style="color: #20202f;">전체 카테고리</span>가 검색됩니다.</li>
										</ul>
									</li>
								</ul>
						</div>
						
						<!-- 로그인 -->
						<div id="headerLoginJoin" class="con-div">
							<img src="/images/common/login_join.png" />
						</div>
					</div>
				<!-- 메뉴헤더 끝 -->

			</div>
		</div>
	</header>
	<!-- End Header -->

</body>
</html>