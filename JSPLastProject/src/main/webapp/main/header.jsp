<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
function login(){
	Shadowbox.open({
		content:'../member/login.do',
		player:'iframe',
		width:300,
		height:260,
		title:'로그인'
	})
}
</script>
</head>
<body>
<!-- ****** Top Header Area Start ****** -->
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                           <c:if test="${sessionScope.id==null }">
                            <div class="login">
                                <a href="javascript:login()" class="btn btn-outline-primary">로그인</a>
                            </div>
                            <div class="register">
                                <a href="../member/join.do" class="btn btn-outline-warning">회원가입</a>
                            </div>
                           </c:if>
                           
                           <c:if test="${sessionScope.id!=null }">
                            <div class="login">
                                ${sessionScope.name}(${sessionScope.admin=='y'?"관리자":"일반사용자" })님 로그인되었습니다&nbsp;&nbsp;
                                <a href="../member/logout.do" class="btn btn-outline-danger">로그아웃</a>
                            </div>
                           </c:if>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center">
                        <a href="../main/main.do" class="yummy-logo">Recipe & Food & Travel</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="../main/main.do">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원</a>
                                    <c:if test="${sessionScope.id==null }">
                                     <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../member/join.do">회원가입</a>
                                        <a class="dropdown-item" href="../member/idfind.do">아이디찾기</a>
                                        <a class="dropdown-item" href="single.html">비밀번호찾기</a>
                           
                                     </div>
                                    </c:if>
                                    <c:if test="${sessionScope.id!=null }">
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="index.html">회원수정</a>
                                        <a class="dropdown-item" href="archive.html">회원탈퇴</a>
                                        
                                    </div>
                                    </c:if>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">맛집</a>
                                   <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../food/food_list.do">맛집목록</a>
                                        <a class="dropdown-item" href="../food/food_find.do">맛집검색</a>
                                        <c:if test="${sessionScope.id!=null }">
                                        <a class="dropdown-item" href="../reserve/reserve_main.do">맛집예약</a>
                                        </c:if>
                                   </div>
                                 
                          
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">레시피</a>
                                   <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <%--
                                             recipe_list.do      호출 명령 
                                                                  *.do => /*
                                             recipe_find.do  => DispatcherServlet (Controller)
                                                                      |
                                                                   Model중에 @RequestMapping을 찾는다
                                                                              |밑에 있는 메소드 호출 
                                                                               ================
                                                                                request.addAttribute()
                                                                                   | request를 받아서 
                                                                                   | return에 있는 JSP로 전송 
                                             스프링 
                                               => @RequestMapping을 찾아주는 역할 : HandlerMapping
                                               => JSP를 찾아서 request를 전송하는 역할 : ViewResolver
                                                                              
                                         --%>
                                        <a class="dropdown-item" href="../recipe/recipe_list.do">레시피목록</a>
                                        <a class="dropdown-item" href="../recipe/recipe_find.do">레시피검색</a>
                                        <a class="dropdown-item" href="../recipe/chef_list.do">쉐프</a>
                                        <c:if test="${sessionScope.id!=null }">
                                         <a class="dropdown-item" href="single.html">레시피등록</a>
                                        </c:if>
                                   </div>
                                 
                          
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">서울여행</a>
                                   <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../seoul/seoul_list.do?mode=1">명소</a>
                                        <a class="dropdown-item" href="../seoul/seoul_list.do?mode=2">자연 & 관광</a>
                                        <a class="dropdown-item" href="../seoul/seoul_list.do?mode=3">쇼핑</a>
                                        <a class="dropdown-item" href="../seoul/seoul_list.do?mode=4">음식</a>
                                        <a class="dropdown-item" href="../seoul/weather.do">날씨</a>
                                        <a class="dropdown-item" href="single.html">여행코스</a>
                                   </div>
                                 
                          
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="#">스토어</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                                   <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../board/board_list.do">자유게시판</a>
                                        <a class="dropdown-item" href="../notice/notice_user_list.do">공지사항</a>
                                        
                                        <a class="dropdown-item" href="../qna/qna_list.do">묻고답하기</a>
                                        <c:if test="${sessionScope.id!=null }">
                                        <a class="dropdown-item" href="../chat/chat.do">실시간채팅</a>
                                        </c:if>
                                   </div>
                                 
                          
                                </li>
                                <li class="nav-item">
                                   <c:if test="${sessionScope.id!=null }">
                                    <a class="nav-link" href="#">빠른예약</a>
                                   </c:if>
                                </li>
                                <c:if test="${sessionScope.id!=null }">
                                 <c:if test="${sessionScope.admin=='n' }">
                                  <li class="nav-item">
                                    <a class="nav-link" href="../mypage/my_main.do">마이페이지</a>
                                  </li>
                                 </c:if>
                                 <c:if test="${sessionScope.admin=='y' }">
                                  <li class="nav-item">
                                    <a class="nav-link" href="../adminpage/admin_main.do">관리자페이지</a>
                                  </li>
                                 </c:if>
                                </c:if>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ****** Header Area End ****** -->
</body>
</html>