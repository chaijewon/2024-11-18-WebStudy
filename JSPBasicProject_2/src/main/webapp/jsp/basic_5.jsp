<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%--
   139page 
   지시자 / 내장 개체 / 액션 태그  ==> JSP 기초 
   Cookie / Session / 데이터베이스 
   JSTL / EL => MVC (Spring)
   ------------------------------ 자바관련 (데이터 관리) 
   => 브라우저안에서 처리 (팝업 , 애니메이션 , ...) : JavaScript 
      JSPFront
      
   지시자 
     page / taglib (597page) / include (X) => <jsp:include>
     ----
     => JSP에 대한 정보 
     4개 
       => import : 라이브러리 로드 
          <%@ page import="java.io.*,java.util.*"%>
                           ---------------------
          <%@ page import="java.io.*"%>
          <%@ page import="java.util.*"%>
       => contentType : 브라우저에 보낼 데이터 형식 지정 
            HTML  => contentType="text/html;charset=UTF-8"
            XML   => contentType="text/xml;charset=UTF-8"
            JSON  => contentType="text/plain;charset=UTF-8"
            
            AJax 
               -- XML => 유지보수 
       => errorPage : 에러발생시 화면 이동 
            404/403/405/412/500 => 화면 이동 
            errorPage="error.jsp"
       => buffer : 출력에 필요한 HTML을 저장할 메모리 공간 크기 
          --------- 8kb 
            buffer="16kb"
       => isErrorPage="true" => exception사용시에 주로 사용
          
       *** page에서 제공하는 모든 속성은 한번만 사용이 가능 
           예) import는 예외 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%= application.getRealPath("/") %>
</body>
</html>