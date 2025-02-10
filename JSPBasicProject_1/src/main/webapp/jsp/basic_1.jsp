<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
      JSP : Java Server Page => 서버에서 실행되는 자바 파일 
            = Back-End 
            = JSP : Servlet을 쉽게 작성이 가능하게 만든 파일 
                    => 영역 : doGet/doPost
                    => 메소드 영역이다 => 대부분은 지역변수
                    => JSP는 View역할 (화면 출력)
                    => Front-End로 전향 
            = Servlet : 보안 (라이브러리 , 보안 파일 , 연결)
                            --------- 스프링 
                            
            Back-End : Java / oracle / servlet / spring 
            Front-End : HTML / CSS / JavaScript / JSP
            ---------- + Full Stack
            
       JSP => HTML / CSS / JavaScript / Java / Oracle연동 
                           ----------
         1. HTML + 자바 : 구분 
            자바를 코딩하는 영역 : 스크립트 
            <%
                일반 자바 : 메소드 호출 / 변수 설정 / 제어문 ...
            %> : 스크립트릿 
            
            <%= %> : 표현식 => out.println()
                     데이터 출력 
                     
            전역변수 , 메소드 제작 : <%! %> : 선언문 
            *** 스크립트를 벗어나면 일반 문자열이다 
         2. 동작방식 => 정적페이지 / 동적페이지 
                     --------   -------- 
                                한개의 파일을 이용해서 데이터를 변경
                                => JSP / PHP / ASP / CGI
                                   ----------------------
                                   희망부서 : 자바 웹개발 
                     데이터변경이 없다 (HTML)
         3. JSP => 사용법 
            = 지시자 
              page : JSP 에 대한 정보를 저장 
                     1) 변환 => 브라우저 출력시 어떤 형식을 출력하지 지정 
                        html => text/html
                        xml  => text/xml
                        json => text/plain
                        ------------------
                        자바스크립트 객체 표현법 
                        => JavaScript Object Nontation 
                        => 자바 : VO => 자바스크립트에서는 VO인식이 불가능 
                           VO => {변수:값....}
                           let sawon={}
                           List => [] => Array
                           ------------------- java에서 변환후 전송 
                                               => Ajax / Vue / React
                     2) 라이브러리 읽기 : import 
                     3) 한글 변환 : pageEncoding 
                     4) 에러페이지 : errorPage
                     
              taglib : 자바 / HTML을 분리한 경우에 주로 사용 
                       JSTL / EL 
                       
              <%
                 for()
                 {
              %>
                   HTML <%= %>
              <%
                  }
              %>
              
              <c:forEach>
                <html> ${}
              </c:forEach>
              include
            = 자바 코딩 방법
            ---------------------------------------------
              <% %> : 스크립트릿 
                      일반 자바 (메소드 안에 코딩되는 자바) 
                      메소드 호출 / 지역변수 선언 / 연산자 처리 
              <%= %> : 표현식 => out.println() 
                       데이터 출력 
            ------------------ _jspService안에 첨부 
              <%! %> : 선언식 : 전역변수 , 메소드 선어시에 사용 
            ----------------- HTML외의 자바를 코딩하는 영역
              *** 이 영역에서는 자바문법을 따라간다 
              <% %>
              <%! %>
              --------------- 문장이 끝나면 ;을 사용  
              <%= name%> 
                  |
          println(name )
              --------------- 문장이 끝나면 ;을 사용하지 않는다
              out.println(=== 여기 코딩);
                
            = 지원 라이브러리 (내장 객체) 
              _jspService(HttpServletRequest request,
              HttpServletResponse response)
              PageContext pageContext;
              HttpSession session = null;
              ServletContext application;
              ServletConfig config;
              JspWriter out = null;
              Object page = this;
             
              
              request / response / session / out 
              application / pageContext 
                            ------------ 웹 흐름 
                            include / forward
                              |         |
                              ----------- 핵심기술 
                   화면 이동 
                   -------
                    sendRedirect() => request를 초기화 
                    forward() => request를 기억 (초기화가 안된다)
                    ---------- MVC
              config / exception / page 
              --------------------------9개 사용이 가능 
              미리 객체를 생성한 다음에 필요시마다 사용이 가능하게 만든 객체 
               
            = Cookie / Session : 일부 정보를 기억 (메모리 공간)
                       => 서버 
               => 브라우저 
            = JSP 액션태그 
               <jsp:include> : JSP 특정 영역에 다른 JSP를 포함 
                 => RequestDispatcher 
               <jsp:useBean> : 클래스 메모리 할당 
                 <jsp:useBean id="dao" class="BoardDAO">
                                   |       ------------
                                  객체명     메모리 할당 대상 
                   => BoardDAO dao=new BoardDAO()
                 
               <jsp:setProperty> : 멤버변수에 값을 채우는 경우 
               <jsp:param> : 다른 JSP로 값을 전송시에 사용 
               
               => 자바+HTML이 혼합 
                  => 최대한으로 자바소스를 줄여서 사용 => 태그형  
            = JSTL / EL 
            = ***MVC => MV => MVC
            
            *** <% %> 부분을 전체 없게 만든다 
                ------------------------
            => JSP 브라우저에서 실행 
                   -------------
                    => 톰캣 => 클래스로 변경 
                    a.jsp => a_jsp.java => 컴파일 => a_jsp.class
                                                   ------------
                                                   서블릿 파일 
                                                   |
                                                 인터프리터 
                                                   |
                                                 HTML만 메모리에 출력 (Buffer)
                                                 -----------------
                                                  | 브라우저에서 읽어 간다
                    
 --%>
 <%--
       doGet / doPost
        | GET/POST 통합 => servlet : service()
       public void _jspService(HttpServletRequest request,
              HttpServletResponse response)
       {
              PageContext pageContext;
              HttpSession session = null;
              ServletContext application;
              ServletConfig config;
              JspWriter out = null;
              Object page = this;
              --------------------------
                 JSP코딩 => 첨부 => 파일  
                  => 톰캣에 의해 자동 첨부 
              --------------------------      
       }
       
       _jspService => 미완성 
           => jsp파일을 이용해서 완성하는 프로그램 
              
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%! 
      int a=10;
      public void display(){}
 %>
 <%
  String name="홍길동";
  //out.println(name);
  //자바 문법 그대로 적용 
  
  /* */
 %>
 <%= name %>
 <!--  -->
</body>
</html>