<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JSPHomePage</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">회원가입</a></li>
          <li><a href="#">아이디찾기</a></li>
          <li><a href="#">비밀번호찾기</a></li>
          <li><a href="#">카카오로그인</a></li>
        </ul>
      </li>
      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">상품
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">전체 상품</a></li>
          <li><a href="#">베스트 상품</a></li>
          <li><a href="#">특가 상품</a></li>
          <li><a href="#">신상품</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">여행
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">명소</a></li>
          <li><a href="#">자연 & 관광</a></li>
          <li><a href="#">호텔</a></li>
          <li><a href="#">쇼핑</a></li>
        </ul>
      </li>
      <li><a href="#">예약</a></li>
      <li><a href="#">마이페이지</a></li>
    </ul>
  </div>
</nav>
</body>
</html>