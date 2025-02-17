<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      => MVC / Spring / Spring-Boot / 실무
      EL : 표현식 (브라우저에 데이터 출력) <%= %>
           ${출력할 데이터}
      JSTL : 태그형 라이브러리 => 자바의 제어문 , 변수선언 , 화면이동 
                              날짜변환 , 숫자 변환 
      JSP : 태그형 라이브러리 => 자바를 사용하지 않는다 
            HTML + Java 
             | => 결과값만 출력 (Front) 
                                | 자바스크립트 => Jquery 
                                   | Ajax / Axios 
      구조 : 자바에서 전송 => JSTL+EL => 화면 출력 
            1차 => MVC , 2차 => Spring 
            -------------------------- JSP는 변경이 없다
            
      동작 
             요청 
        JSP =====> Java =====> 요청처리 =====> JSP
                               ------       ----
                                |             |
                                ---------------
                                 request / session에 값을 담는다
                                 -----------------
                                  | ${} => request.getAttribute
                                  | setAttribute()  
        => 출력시 
           연산처리 => 조건 , 출력 (EL) 
             산술연산자 : + , - , * , / , %
                                       --
                                        % mod
                                   -- 정수/정수=실수  / 대신 div
                       == 순수하게 덧셈만 가능 
                       == 문자여 결합 ( =+ )
                ** ${"10"+10}
                    ----- 자동으로 Integer.parseInt("10") => 정수변경
                    ----- 결과값 20
                
                ** ${null + 10}
                     ----- 자동으로 0으로 대체
                ** EL에서 처리는 문자 / 날짜도 사용한다 
                              ----------
             비교연산자 => 결과값은 true/false 
                        문자 / 날짜도 비교가 가능 
                == (eq) ,  != (ne) , < (gt) , > (lt) ,
                <= (le) , >= (ge)
                ${10==10} ${10 eq 10}
                => ${vo.id==sessionScope.id}
                   ${vo.id eq sessionScope.id}
                => ${sessionScope.id==null} => 로그인이 안된 상태
             논리연산자 
                && (and) , || (or) 
                           => 병렬 (한개 이상 조건이 true => true)
                              범위 미포함 
                  => 직렬 (두개의 조건이 true=true) : 범위 포함
             비교연산자 / 논리연산자 => 
                       <c:if test="EL"> => if() 
                       <c:when test="EL"> => switch
             삼항연산자 => ${조건?값:값}
                          --- -- --
                           true
                           false
           출력형식 
             => ${데이터출력}
                  -------- 일반 변수는 사용할 수 없다 
                   | request에 담긴값
                     request.setAttribute("id","hong")
                     ${requestScope.id}
                                    --- 키
                     => <%= request.getAttribute("id")%>
                     => requestScope는 생략이 가능 
                     => ${id}
                   | session에 담긴값 
                     session.setAttribute("id","admin");
                     => <%= session.getAttribute("id") %>
                     => ${sessionScope.id} 
                                       -- 키
                     => sessionScope는 생략이 가능 
                   => request/session 
                      ------- 우선순위
                      
                   *** ${id} => request 
                   *** ${sessionScope.id} => session
                     
        => 제어문 (JSTL) => JSP=> MVC사용시에는 자바를 사용하지 않는다  
           ------------ 자바가 없는 것처럼 보인다 => 자바 제어문 
                        ------------------- 태그로 만들어진 라이브러리
           ***= core : 제어문 , 변수 선언 , 화면 이동 
                => import : uri="jakarta.tags.core"
                => 제어문 
                   조건문 => else가 없다 => if문만 사용한다 
                        => 단일 조건문만 사용이 가능 
                        형식) 
                            <c:if test="${조건문(논리/비교)}">
                                  ---- 조건문이 수행
                              조건이 true면 수행하는 HTML을 사용 
                            </c:if>
                            
                            <c:if test="${조건문(논리/비교)}">
                                  ---- 조건문이 수행
                              조건이 true면 수행하는 HTML을 사용 
                            </c:if>
                            <c:if test="${!조건문(논리/비교)}">
                                  ---- 조건문이 수행
                              조건이 true면 수행하는 HTML을 사용 
                            </c:if>
                   선택문 : 다중 조건문 사용 
                          <c:choose>
                            <c:when test=""></c:when>
                            <c:when test=""></c:when>
                            <c:when test=""></c:when>
                            ...
                            <c:otherwise></c:otherwise> => else
                          </c:choose>
                   반복문
                         for(int i=1;i<=10;i++)
                         <c:forEach var="i" begin="1" end="10" step="1">
                                                      -------- --------
                                                       <=10     1인경우에는 생략이 가능
                          *** 단점 : 감소식은 사용할 수 없다 
                                    -- 
                                    => 자바에서 반대로 데이터값 추가
                         </c:forEach>
                         
                         => forEach 
                         for(MovieVO vo:list)
                         
                         <c:forEach var="vo" items="${list}">
                         
                         </c:forEach>
                         
                         *** <c:forTokens> => StringTokenizer
                         *** JSP에서는 Java코딩이 없다 
                         <% %> <%= %> => 사용하지 않는다 
                => 변수 선언 
                   ------- <c:set var="id" value="hong">
                           String id="hong" (X) 
                           request.setAttribute("id","hong") (O)
                => 화면 이동 
                     response.sendRedirect("파일명")
                     <c:redirect url="파일명">
           ***= fmt : 날짜 변환 , 숫자 변환 => uri="jakarta.tags.fmt"
                      --------  -------
                                | DecimalFormat => 천단위 ,
                      | SimpleDateFormat => yyyy-MM-dd
                      -----------------------------------
                      | 많이 사용하지 않는다 : 오라클에서 변경이 가능 
                                          TO_CHAR
                      <fmt:formatDate>
                      <fmt:formatNumber>
           ***= fn : String클래스의 메소드 호출 => uri="jakarta.tags.functions"
                      length() , substring()...
                      ${fn:length(문자열)} => 자바에서 제어 
           --------
           = xml : 파싱 => 자바 
           = sql : DAO
           -------- MVC/MV구조에서는 사용하지 않는다 (순수 JSP로 제작)
           
 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
   core : 제어문을 지원 / 변수 선언 / 화면 이동 
   prefix="c" => <c:forEach>
   prefix="core" => <core:forEach>
   ------------- 개발자가 선택 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%-- forEach : for문 : 반복문 --%>
   <h3>일반 자바 for문</h3>
   <%
       for(int i=1;i<=10;i++)
       {
   %>
           <%= i %>&nbsp;
   <%
       }
   %>
   <h3>&lt;c:forEach&gt;사용</h3>
   <c:forEach var="i" begin="1" end="10" step="1">
      ${i }&nbsp;
   </c:forEach>
</body>
</html>