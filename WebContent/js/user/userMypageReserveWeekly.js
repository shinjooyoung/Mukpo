$(document)
		.ready(
				function() {
					

					$("#search")
							.bind(
									"click",
									function() {
										var keyword = $('#term').val();
										if ($('#term').val() == "") {
											alert('검색값을 입력하세요');
										}
										$
												.ajax({
													url : "/user/ReservWeeklySearch.do",
													type : "POST",
													dataType : "json",
													data : {
														"search" : keyword
													},
													success : function(data) {
														if (data != null) {
															$('#searchList')
																	.html("");
															$(data)
																	.each(
																			function(
																					index,
																					item) {
																				var tag = "";
																				tag += "<input type='hidden' name='rCid'/>"
																						+ "<div class='store col-md-6 col-sm-6 col-xs-12 wow fadeInDown' data-wow-duration='1000ms' data-wow-delay='300ms'>"
																						+ "<div class='blog-right-listing'>"
																						+ "<div class='feature-img'>"
																						+ "<a data-toggle='modal' data-target='#ReservWeeklyMenu' class='storeImage' id='"
																						+ this.sRcid
																						+ "'><img src="
																						+ this.sUrl
																						+ " /></a>"
																						+ "<h3>"
																						+ this.sName
																						+ "</h3>"
																						+ "<div title='"
																						+ this.sAddress
																						+ "'>"
																						+ this.sAddressSubstring
																						+ "</div>"
																						+ "<div>"
																						+ this.sTel
																						+ "</div>"
																						+ "<div>"
																						+ this.sClose
																						+ "</div>"
																						+ "</div>"
																						+ "</div>"
																						+ "</div>";

																				$(
																						'#searchList')
																						.append(
																								tag);
																			});
														}
													},
													error : function(error) {
														// alert("error" +
														// error);
													}
												});
									});

					var rCid;

					//사업자등록번호 가져오기
					$("#searchList").on("click", ".storeImage", function() {
						rCid = $(this).attr("id");
						// alert(rCid);
						// $('body').css('padding-right', '0px');
					});

					//메뉴리스트
					(function($) {
						$(document)
								.on(
										"click",
										".feature-img",
										function() {

											//  메뉴 카테고리 가져오기
											$
													.ajax({
														url : "/store/reservWeeklyMenuCate.do",
														type : "POST",
														dataType : "json",
														data : JSON
																.stringify("/store/reservWeeklyMenuCate.do"),
														data : {
															"rCid" : rCid
														},
														success : function(data) {
															$("#menucate")
																	.html("");

															if (data.length > 0) {
																var tag = "";
																tag += '<div class="portfolioFilter-inner" id="cateMargin">'
																		+ '<a href="javascript:;" data-filter="*" class="current">전체메뉴</a>';
																$(data)
																		.each(
																				function(
																						index,
																						item) {
																					// alert(this.mCate);
																					tag += '<a href="javascript:;" data-filter=".'
																							+ this.mCate
																							+ '">'
																							+ this.mCate
																							+ '</a>';

																				});
																tag += '</div>';
																$('#menucate')
																		.append(
																				tag);
															} else {
																var tag = "";
																tag += "<h5>등록된 메뉴가 없습니다.</h5>";
																$('#menucate')
																		.append(
																				tag);

															}
														},
														error : function(error) {
															// alert("error" +
															// error);
														}
													});

											//메뉴리스트
											$.noConflict();
											jQuery(document)
													.ready(
															function($) {

																$
																		.ajax({
																			url : "/user/reservWeeklyMenu.do",
																			type : "POST",
																			dataType : "json",
																			data : JSON
																					.stringify("/user/reservWeeklyMenu.do"),
																			data : {
																				"rCid" : rCid
																			},
																			success : function(
																					data) {
																				if (data != null) {
																					$(
																							"#menulist")
																							.html(
																									"");
																					$(
																							data)
																							.each(
																									function(
																											index,
																											item) {

																										var tag = "";
																										tag += '<div class="col-md-6 col-sm-6 col-xs-12 menuListHeighEdit isotope-item wow fadeInDown animated shop-main-list" name="'
																												+ this.mCate
																												+ '" id="'
																												+ this.mId
																												+ '" title="'
																												+ this.mFullName
																												+ '">'
																												+ '<div class="menu-list">'
																												+ '<span class="menu-list-product menuListPriductEdit">'
																												+ '<img src="'
																												+ this.mUrl
																												+ '" alt="'
																												+ this.mFullName
																												+ '" >'
																												+ '<div class="cart-overlay-wrap" id="wrapHeight">'
																												+ '<div class="cart-overlay">'
																												+ '<a href="#" class="shop-cart-btn">ADD TO CART</a>'
																												+ '<input type="hidden" value="'+this.mName+'"/>' 
																												+ '</div>'
																												+ '</div>'
																												+ '<h5 id="cartMargin">'
																												+ this.mName
																												+ '<span>'
																												+ this.mPrice
																												+ '</span>'
																												+ '</h5>'
																												+ '<p>'
																												+ this.mDetail
																												+ '</p>'
																												+ '</span>'
																												+ '</div>'
																												+ '</div>';
																										$(
																												'#menulist')
																												.append(
																														tag);
																									});
																				}
																			},
																			error : function(
																					error) {
																				// alert("error2"
																				// +
																				// error);
																			}
																		});
															});
										});
					})(jQuery);

					$(".booktable").click(function() {
						$('body').css('padding-right', '0px'); // 모달 클릭 했을 때
						// padding-right:16px
						// 되는 오류 처리
					});
					//  카테고리 클릭 시 해당 카테고리의 메뉴 표시
					$(document)
							.on(
									'click',
									'#menucate a',
									function() {
										$("#menucate a").attr("class", ""); // 전체
										// 클래스
										// 속성
										// 지우기
										$(this).attr("class", "current"); // 클릭한
										// 카테고리의
										// 클래스
										// 속성
										// 부여

										$("#menulist>div").css("display",
												"none"); // 전체 메뉴에 display
										// none 속성 부여
										if ($(this).text() == '전체메뉴') { // 전체메뉴를
											// 클릭 했을
											// 때
											$("#menulist>div").css("display",
													"inline"); // 전체 메뉴에
											// display
											// inline 속성 부여
										} else {
											for (var i = 0; i < $("#menulist>div").length; i++) {
												if ($(this).text() == $(
														"#menulist>div").eq(i)
														.attr('name')) { // 클릭한
													// 카테고리의
													// 같은
													// 메뉴만
													$("#menulist>div").eq(i)
															.css("display",
																	"inline"); // display
													// inline
													// 속성
													// 부여
												}
											}
										}

										$("#menulist").animate({
											scrollTop : 0
										}, '100'); // 스크롤 위로 올리기

									});

				});