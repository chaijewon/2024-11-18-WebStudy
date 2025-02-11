<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     113page 
     -------
      JSP의 기초 
      
      1. HTML과 Java 분리 
         ---------------
         
         public class basic_jsp extends HttpBase
         {
              ---------------------------
              멤버변수 선언 / 메소드 제작 => 클래스로 제작 
              <%!  %> => 선언문 => 극히 드물다 
              ---------------------------
              public void _jspInit(){}
              public void _jspDestory(){}
              public void _jspService(***request,***response)
              {
                  내장 객체 
                  -------------------------
                  ***HttpSession session
                  PageContext pageContext
                  JspWriter out
                  Exception exception
                  Object page=this
                  ***ServletContext application
                  ServletConfig config
                  -------------------------
                  
                  try
                  {
                     -------------------
                      <%
                          
                      %> 스크립트릿 
                      JSP 코딩 내용 
                      
                      out.println("<html>")
                      ------------
                       <%= %> : 표현식
                     -------------------
                  }catch(Exception e){}
              }
         }
         
         = <%@ %> : 선언문 
           <%@ page %>
               => 파일에 대한 정보 
               => 변환 : contentType="|"
                                 파일 형식 지정 
                                 1) text/html => html전송 
                                 2) text/xml => xml전송 
                                 3) text/plain => json전송 
               => pageEncoding="UTF-8"; => 한글 처리 
               => import : 외부 라이브러리 / 사용자 정의 라이브러리 
               => buffer : HTML를 출력할 메모리 공간의 크기 
                  => 8kb => 16kb
               => errorPage=> error가 발생시 자동으로 화면 이동 
                  ***200 : 정상 수행 => 화면 출력 
                  ***404 : 파일이 없는 경우 
                  403 : 접근 거부 
                  405 : GET/POST => 서블릿 (JSP => service)
                                          |
                                          동시처리 
                  412 : 한글변환 => UTF-8 / UFT-8
                  400 : badRequest => 데이터전송시에 데이터형이 다른 경우
                        => Spring에서 등장 => request를 사용하지 않고 
                           매개변수로 처리 
                  ***500 : 자바 소스 에러 발생 
           <%@ taglib %> : 자바의 제어문 / URL / Format과 관련된
                           라이브러리 => 태그형으로 제작 
                           <%
                              if(조건문)
                              {
                           %>
                                  HTML
                           <%
                              }
                           %>
                           
                           => <c:if test="">
                                 HTML
                              </c:if>
                           => <c:forEach> , <c:formatDate> 
                                 for             SimpleDateFormat
                              <c:formatNumber> 
                                 DecimalFormat...
                              -------------------- MVC
                               => 1차 / 2차 
           <%@ include %> : JSP 특정부분에 다른 JSP를 첨부 
                          : 정적 => 고정 => 실제 소스를 묶어서 처리
                          : 동적 => <jsp:include> 액션 태그 
                                   -------------
                                   따로 컴파일 => HTML을 묶어서 처리 
         = <%! %> : 선언문 
                    전역변수 / 메소드 제작 
         = <%  %> : 일반자바 => 메소드안에서 코딩 => 지역변수 / 메소드 호출 
                              제어문 / 연산자
                              스크립트릿  
         = <%= %> : 화면에 데이터 출력 : 표현식 
              |
  out.println( );
         <%! %> <% %> => 자바 문법 사용 
           문장이 종료시에는 ; 
           // 
           /* */
          <%= %> => 실제 출력문만 추가 
         --------------- HTML / Java구분
         
         => <!-- 남아 있다 (html) --> 
         <% 
            <%
            %>  오류
         %>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%!
      // 선언문 : 멤버변수 , 메소드 => class영역 
      public int add(int a,int b)
      {
    	  return a+b;
      }
  %>
  <%
      // _jspService영역 (메소드 영역)
      int a=10;
      int b=20;
      int c=add(a,b);
  %>
  <%= c %>
</body>
</html>