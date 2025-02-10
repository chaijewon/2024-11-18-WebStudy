<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     18page 
     ------
     
     1) 웹동작 
        요청 / 응답 
              --- 서버 (response)  => C/S => 네트워크 
        ---  클라이언트 (request)
             => 서버연결시 브라우저를 이용한다 
                -------- 브라우저에서 서버 연결되는 부분 
                         ------------------------ 주소창 
        => 반드시 URL을 이용할때는 
           http://서버IP:PORT/프로젝트명/폴더명/파일명 
                                          -----
           파일명 생략이 가능한 파일 : welcome파일 
           index.html / index.jsp 
           ** 파일의 확장자는 개발자가 설정할 수 있다
              .회사명 ( .naver , .daum , .do )
        => 나머지는 반드시 파일명을 첨부한다  
        
        http://localhost /JSPBasicProject_1/jsp/basic_2.jsp
        -------------------------------------------------- URL
        ---------------- ---------------------------------
           서버 정보                      URI 
                        -------------------
                           ContextPath
           |                                          |
           --------------------------------------------
                               |
                             request
                             
           사용자가 html/jsp/servlet을 요청 
           서버에서는 출력된 => HTML을 브라우저로 전송 실행 
                   ---------- 소스보기
                   
           => JSP를 활용하는 이유 : 동적페이지 
                           한개의 파일을 이용해서 데이터 변경후 출력
                           --------- 여러개 처럼 사용이 가능 
              서블릿 ====> JSP
                     |
                   사용이 편리 
                   
              서블릿 => HTML출력에 불편 
                      수정시마다 컴파일을 해야 된다 , .class파일(보안 뛰어나다)
                      로직 , 중요한 데이터가 있는 경우
                |
              html을 그대로 사용이 가능 
              수정시에 컴파일 없이 실행 => jsp 
              => 자바로 변경 (톰캣에 의해 변경) 
              => 소스가 노출 (보안에 취약)
              => 화면 출력 
       구성요소 
        브라우저 : 크롬 / 파이어폭스 / IE
        웹서버 : Apache / IIS
        웹애플리케이션 : 자바번역 / JSP를 자바로 변경 
                     => tomcat
                     => 테스트용 웹서버를 내장 
        데이터베이스 : 오라클 / MySQL 
        
        
        동작 
        ---
          a.jsp
          1. 사용자가 요청한 JSP파일 찾기 
             = 없는 경우 : 404 전송 
             = 있는 경우 :
                           |
          2. JSP에 해당되는 Java파일이 생성되어 있는지 확인 
             = 자바 파일이 있는 경우 => 수정후 컴파일 
             = 자바 파일이 없는 경우 => 생성후 컴파일 
             a_jsp.java
             
             main.jsp => main_jsp.java
             a_1.jsp  => a_005f.java
             
             => 파일명은 숫자로 시작하면 안된다 
          3. 컴파일 : a_jsp.class 
             인터프리터 : 한줄씩 번역 
                       ---------
                       자바는 사라진다 
                       out.write("<html>");
                       |
                     브라우저에서 읽어가는 메모리에 저장 
                     
                     
      19page 
      -------
        파일 => 웹(페이지) 
        상용화된 파일 ==> 75페이지 
        => 자바파일 
        => 정적페이지 : HTML/CSS => 데이터 갱신이 불가능 
        => 동적페이지 : JSP/Servlet => 자바가 데이터 관리 
                                    필요시에 데이터 갱신
                     => CGI , ASP , PHP , Django 
                              ---   ---
                               |     |
                               -------
                               
                            교보정보통신 (2차) : 서울 시청 
                               C# + ASP
      22page
      ------
       Servlet / JSP 
       -------------
       1. 자바 기본문법 
       2. 오라클 연동 
       3. HTML / CSS 
       ------------------> 
       4. 자바스크립트 
       -------------------- + JSP 
       
       Servlet 
       Server + let 
         : 서버에서 실행되는 가벼운 프로그램 
           Applet / MIDlit => 사라졌다 
         : 확장자 .java 
         : 자바만 이용하는 웹 프로그램 (자바 웹프로그램의 시작) 
         : 2000(servlet) => 2002 (jsp) 
         : 단점 => 바로 변경된 소스를 확인이 안된다 
                  : 컴퍼일후에 확인 가능 
                  => 바로 수정 내용을 확인 => JSP
           장점 : 보안 , 보안과 관련된 웹파일 (데이터베이스 연동)
           라이브러리 => 서블릿으로 제작 (Spring , Spring-Boot)
           
         : 서블릿 => JSP가 컴파일이 되면 서블릿으로 변경 
                   ---------------------------- 톰캣 , 레진
         : 서블릿 , JSP는 => HTML+Java 
         : 분리 작업 => HTML , 자바 
           -------
             ThymeLeaf (HTML로 되어 있다) 
                        ---- 제어문 사용 
                        ---- 사용빈도가 낮다 : JSP보다 속도가 느리다
           최근 
           ---
            React == Spring 
              => TanStack Query , Redux 
              => NextJS
              => Component기반 
            Vue   == Spring   => 여러개를 만들어서 한번에 처리 
                                 MSA 
              => CDN기반 
            ---------------  
            => JDK / Tomcat / 이클립스 => .zip
            
     61page 
     -------
          => 편집기 => 톰캣연결 
     66page 
     -------
       JSP 코드 
       
        
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  URL : <%= request.getRequestURL() %><br><br> 
  URI : <%= request.getRequestURI() %><br>
  ContextPath : <%=request.getContextPath() %><br>
  Server정보: <%= request.getServerName() %><br>
  ServerPort: <%= request.getServerPort() %>
</body>
</html>