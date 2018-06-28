<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="plugin/bootstrap/bootstrap.css" rel="stylesheet">
<link href="/plugin/bootstrap/minwoo.css" rel="stylesheet">
</head>
<body>
<div class="container">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-body">
                         <div class="mail-option">
                             <div class="chk-all">
                                 <input type="checkbox" class="mail-checkbox mail-group-checkbox">
                                 <div class="btn-group">
                                     <a data-toggle="dropdown" href="#" class="btn mini all" aria-expanded="false">
                                         All
                                         <i class="fa fa-angle-down "></i>
                                     </a>
                                     <ul class="dropdown-menu">
                                         <li><a href="#"> None</a></li>
                                         <li><a href="#"> Read</a></li>
                                         <li><a href="#"> Unread</a></li>
                                     </ul>
                                 </div>
                             </div>
                             <!-- 새로고침 버튼 -->
                             <div class="btn-group">
                                 <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
                                     <i class=" fa fa-refresh"></i>
                                 </a>
                             </div>
                             <!-- 새로고침 버튼 끝 -->
                             <!-- 여분 드롭다운 버튼 -->
                             <div class="btn-group hidden-phone">
                                 <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
                                     More
                                     <i class="fa fa-angle-down "></i>
                                 </a>
                                 <ul class="dropdown-menu">
                                     <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
                                     <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
                                     <li class="divider"></li>
                                     <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                                 </ul>
                             </div>
                             <!-- 드롭다운버튼 끝 -->
                         </div>
                         <!-- 테이블 시작 -->
                          <table class="table table-inbox table-hover">
                            <tbody>
                            <!-- 테이블 제목 -->
                              <tr class="unread">
                              <thead>
                                  <td class="inbox-small-cells"></td>
                                  <td class="view-message dont-show">분류</td>
                                  <td class="view-message dont-show">주문번호</td> 
                                  <td class="view-message dont-show">업소명</td> 
                                  <td class="view-message dont-show">등록일</td>
                              </thead>
                              </tr>
                              <!-- 테이블 제목 끝 -->
                              <!-- 테이블 내용 시작 -->
                              <tr class="">
                                  <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                  </td>
                                  <td class="view-message dont-show">리뷰분류</td>
                                  <td class="view-message dont-show">TEST_NUMBER</td> 
                                  <td class="view-message dont-show">기며니의 와따큰보쌈</td> 
                                  <td class="view-message dont-show">2017/11/23</td>
                              </tr>
                              <!-- 테이블 내용 끝 -->
                          </tbody>
                          </table>
                          <!-- 테이블 끝 -->
                      </div>
                  </aside>
              </div>
</div>
</body>
</html>