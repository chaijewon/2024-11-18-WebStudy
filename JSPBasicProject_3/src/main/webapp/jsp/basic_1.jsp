<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    165page 
    내부객체 , 내장객체 , 기본객체 => 미리 선언된 객체 
    public void _jspService(HttpServletRequest request, 
         HttpServletResponse response)
    {
       ServletContext application;
       ServletConfig config;
       JspWriter out = null;
       Object page = this;
       PageContext pageContext = null;
       
       try
       {
         ------------JSP----------------
         
              메소드 처리 내용을 만든다 => 파일형식으로 제공 
         
         ----------------------------
       
       }catch(Exception e){}
       
    }
    
    JSP는 파일이 아니고 => _jspService메소드 안을 코딩하는 부분 
                       ------------ 메소드 구현
    => 지역변수 
    
    내부객체의 종류 
    ***1. request 
    HttpServletRequest 객체 
    -----------------------
      1) 역할 
         http://localhost/JSPBasicProject_3/jsp/basic_1.jsp
         ---------------- ---------------------------------- 
                          ------------------
                            ContextPath
            서버정보            클라이언트 요청(URI)
            -----------------------------
                         |
                        URL
         서버정보 
           서버이름,프로토콜 ,전송방식 확인(GET/POST)
           URL 정보 
         브라우저 정보 
           클라이언트의 IP / 클라이언트의 PORT
         사용자 요청 정보 
         
      2) 주요메소드 
         서버 정보 관련 메소드 
           서버이름 : getServerName() => localhost
           프로토콜 : getProtocol() => 80
           전송방식 : getMethod()
           URL : getRequestURL()
           ***URI : getRequestURI()
           ***ContextPath : getRequestContextPath()
         브라우저 정보 관련 메소드 
           ***IP : getRemoteAddr() => 접속자 IP 
           PORT : getPort() 
         사용자 요청 관련 정보
           *** 사용자 서버로 요청데이터를 보내면 
               톰캣에 의해서 request에 저장을 해준다 
               request.setAttribute("key","값")
               -------------------------------- 여러개 사용이 가능
               ?name=aaa&sex=man&age=20
               request.setAttribute("name","aaa")
                 => getParameter("name")
               request.setAttribute("sex","man")
                 => getParameter("sex")
               request.setAttribute("age","20")
                 => getParameter("age");
                 
               ?hobby=aaa&hobby=bbb&hobby=ccc
               => checkbox
               String[] hobby=request.getParamterValues("hobby")
               
               ***=> 단일값 : getParameter()
               ***=> 다중값 : getParameterValues()
               ***=> 한글깨지는 경우 : setCharacterEncoding()
               
               http://localhost/JSPBasicProject_3/jsp/basic_1.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99
               
               => 웹에서 한글 전송 : byte[] 
                                   | 인코딩 
               %ED%99%8D%EA%B8%B8%EB%8F%99
                                   | 디코딩
                                  홍길동
                                  
               ** Window 11 => 자동 디코딩
               
           => 중요시 
              JSP는 메소드 영역에서 코딩 
              ---------------------
              => 매개변수 전송이 안된다 
                 -----------------
                  웹 URL을 이용해서 전송한다 
                  main.jsp?no=10 => main.jsp에 no변수를 보낸다
                  --------
                  | 받는 JSP
                  
                  <form action="main.jsp">
                               ---------- 보내준 모든 데이터를 받는다
               => request는 화면 변경/새로고침 => 자동 초기화 
                           ---------------
                           
               public void display(int a){}
               
               display(10)
               display(20)
               display(30)
         
    ***2. response
    *3. application 
    *4. out 
    ***5. session 
    *6. pageContext
    7. page=this
    8. config=web.xml
    9. exception=try~catch
    
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
</body>
</html>
