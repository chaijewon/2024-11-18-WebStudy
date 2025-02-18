<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       JSTL 
         => JSP Standard Tag Library 
         => JS 표준 태그라이브러리 
       ------------------------
       core : 일반 프로그램에서 사용되는 변수 / 제어문 / 화면 이동
              변수 
               <c:set var="변수명" value="값">
               => request.setAttribute("변수",값)
               <c:out value="값"> => 그래프 
               => out.println("값")
               => JQuery => $() , ${}:EL
                  ----------------------- javascript영역 
              제어문 
               <c:if test="조건문">
                          ------- EL을 이용한다 
                 조건이 true일때 
               </c:if>
               => 단점은 <c:else>가 없다
               예) 
                  <c:if test="${id=="admin"}">
                  </c:if>
               <c:forEach var="i" begin="1" end="10" step="1">
                  반복 수행문장    1부터 10까지 1씩 증가 
               </c:forEach> 
                단점은 감소식은 없다 
               <c:forEach var="vo" items="">
                 가장 많이 사용되는 for => for-each구문
               </c:forEach> 
               
               <c:forTokens var="변수명" items="값" delims="구분자">
                 StringTokenizer st=
                      new StringTokenizer(값,구분자)
                 => 메뉴 , 이미지 ...
               </c:forTokens>
               
              => 다중조건문 
                 <c:choose>
                   <c:when test="조건문">출력물</c:when>
                   <c:when test="조건문">출력물</c:when>
                   <c:when test="조건문">출력물</c:when>
                   <c:otherwise></c:otherwise> else
                 </c:choose>
             => 화면이동 
                <c:redirect url="이동할 파일명">
                => response.sendRedirect()
                *** JSP안에서는 자바코딩을 하지 않는다 
                              ------ 태그를 이용해서 처리 
                <% %> <%= %> 사용하지 않는다 
                <c:import> <c:include> => 사용 빈도가 거의 없다 
                <jsp:include> => 거의 사용
               
       format
         <fmt:formatDate> => SimpleDateFormat => 날짜 변환
           request.setAttribute("today",new Date())
           <fmt:formatDate value="${today}" pattern="yyyy-MM-dd">
         <fmt:formatNumber> => DecimalFormat => 숫자 변환 
           request.setAttribute("price",30000)
          <fmt:formatNumber value="${price}" pattern="###,###">
                        30,000
                        ------ portone => 실제 숫자가 있어야 한다 
       functions : String이 가지고 있는 메소드만 지원 
         request.setAttribute("msg","홍길동입니다")
         => <c:set var="msg" value="홍길동입니다"/>
         ${fn:length(msg)} => 6
         ${fn:substring(msg,1,3)}=>길동
         ${fn:replace(msg,'홍','김')} 
       sql/xml => 자바로 사용 (사용빈도가 거의 없다) => 보안 / 로직 
       
       <%@ taglib prefix="c" uri="jakarta.tags.core"%>
       <%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
       <%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
       
       JSTL + EL => JSP를 구현 
 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>일반 자바</h3>
  <%
     for(int i=1;i<=10;i++)
     {
    	 if(i%2==0)
    	 {
  %>
             <%=i %>&nbsp;
  <%
    	 }
     }
  %>
  <h3>JSTL을 이용한 출력</h3>
  <c:forEach var="i" begin="1" end="10" step="1">
    <c:if test="${i%2==0 }">
      ${i }&nbsp;
    </c:if>
  </c:forEach>
  <h3>다중 조건문</h3>
  <%
      int star=3;
  %>
  <%
     if(star==0)
     {
  %>
         <span style="color:orange">☆☆☆☆☆</span>
  <%
     }
     else if(star==1)
     {
  %>
         <span style="color:orange">★☆☆☆☆</span>
  <%	 
     }
     else if(star==2)
     {
  %>
         <span style="color:orange">★★☆☆☆</span>
  <%  	 
     }
     else if(star==3)
     {
  %>
        <span style="color:orange">★★★☆☆</span>
  <%  	 
     }
     else if(star==4)
     {
  %>
        <span style="color:orange">★★★★☆</span>
  <%	 
     }
     else if(star==5)
     {
  %>
         <span style="color:orange">★★★★★</span>
  <% 
     }
  %>
  <h3>JSTL이용한 다중 조건문</h3>
  <c:set var="star" value="3"/>
  <c:choose>
    <c:when test="${star==0 }"><span style="color:orange">☆☆☆☆☆</span></c:when>
    <c:when test="${star==1 }"><span style="color:orange">★☆☆☆☆</span></c:when>
    <c:when test="${star==2 }"><span style="color:orange">★★☆☆☆</span></c:when>
    <c:when test="${star==3 }"><span style="color:orange">★★★☆☆</span></c:when>
    <c:when test="${star==4 }"><span style="color:orange">★★★★☆</span></c:when>
    <c:when test="${star==5 }"><span style="color:orange">★★★★★</span></c:when>
  </c:choose>
  <h3>자바 선택 조건문</h3>
  <%
     int sex=1;
  %>
  <%
      if(sex==1)
      {
  %>
         남자
  <%
      }
      else
      {
  %>
         여자
  <%	  
      }
  %>
  <h3>JSTL 선택조건문</h3>
  <c:set var="sex" value="1"/>
  <c:choose>
    <c:when test="${sex==1 }">남자</c:when>
    <c:otherwise>여자</c:otherwise>
  </c:choose>
</body>
</html>