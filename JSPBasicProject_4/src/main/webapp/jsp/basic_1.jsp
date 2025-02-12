<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
     EmpDAO dao=EmpDAO.newInstance();
     List<EmpVO> list=dao.empListData();
     request.setAttribute("list", list);
%>
<%--
       prefix="c"
       <c:if>
       prefix="core"
       <core:if>
 --%>
<%--
   1. 자바 / HTML 구분
      <% 일반 자바 : 변수 , 메소드 호출 , 제어문 사용 %>
      <%= 출력할 변수 / 출력할 데이터 %>
   2. 지시자 
      page 
       contentType=""
                   = HTML => text/html
                   = XML  => text/xml
                   = JSON => text/plain
       import="java.util.*,java.io.*"
       errorPage="에러가 난 경우 이동"
    3. 내장 객체 
       request / response 
         |          |
                   setHeader()
                   sendRedirect()
       getParameter()
       getParameterValues() 
    =====================================
    => jar 
       1. upload 
       2. database연동 
       3. spring
       ---------------- 1차 프로젝트 
       
       175page 
       내장객체 / 내부객체 => 미리 객체를 생성한 후 필요시마다 사용이 가능 
       => JSP / JavaScript  
       1) 객체명 
       2) 클래스명 
       3) 용도 
       4) 주요 메소드 
          => request/response/application/session
       1. request 
          클래스명 => HttpServletRequest 
          용도 => 클라이언트의 요청 값을 묶어서 저장 (톰캣)
                 클라이언트 정보 확인 (IP,PORT)
                 세션 , 쿠키 생성 
                 ***HttpSession session=request.getSession()
                 ***Cookie cookies=request.getCookie()
                 한글변환이 가능 
                 데이터를 추가하는 기능 
          주요메소드 
                 클라이언트의 요청 값 가지고 오기
                 ***= getParameter("키") =>  단일 데이터 
                 ***= getParameterValues("키") => 다중데이터 
                   => checkbox
                 = setCharacterEncoding("UTF-8")
                   => 한글 깨짐 방지 
                 클라이언트 정보 확인 (IP,PORT)
                 = getRemoteAddr() : 접속자의 IP
                 세션 , 쿠키 생성 
                 HttpSession session=request.getSession()
                 Cookie cookies=request.getCookie()
                 = 서버 정보 => URL => MVC
                 getRequestURL()
                 ***getRequestURI()
                 ***getContextPath() => 루트(프로젝트명)
                 -------------------
                 추가정보 => JSTL/EL => MVC구조
                 ***setAttribute(키,값)
                 ***getAttribute(키)
                 -------------------
        2. response 
        클래스명 : HttpServletResponse 
        용도 : 전송 (요청에 대한 처리 결과) 
              --- HTML , Cookie
              response.setContentType("text/html")
              ***response.addCookie(cookie)
              화면 이동 : 서버에서 사용자의 화면을 변경하는 역할 
              ***sendRedirect("이동할 파일명")
              헤더 관리  
              setHeader() => 다운로드시에 사용
        3. 175page out : 출력 버퍼 관리 
                   ---- <%= %> 
           클래스명 : JspWriter
                    => 출력버퍼(HTML을 출력해두는 메모리 공간)
                       => 브라우저가 읽어서 출력 
                          ----------------- 자동으로 메모리를 비워준다
                          ---- 출력버퍼는 브라우저당 한개만 생성
                          ---- 기본크기 8kb
           용도 : 화면 출력
                  out.println() / out.print() => <%= %> 
                 버퍼관리 
                  1) 버퍼 크기 
                     getBufferSize()
                  2) 남아있는 버퍼 크기 
                     getRemaining() 
        4. 페이지 흐름 : pageContext 
                      ------------ include / forward 
                      => <jsp:include>
                      => <jsp:forward> : request가 초기화되지 않는다
           클래스명: PageContext
           용도 : 내장 객체 얻기 => 사용빈도는 거의 없다 (99.999999999)
                 HttpServletRequest request=pageContext.getRequest();
                 getRequest() ,getResponse() ,getSession()
                 getPage() , getException()...
                 => request
                 웹 흐름 제어
                    --- 송신 / 수신
                              response 
                        request > 공유
                                  include()/forward() 
                                     |
                                   JSP 특정부분에 다른 JSP를 추가
                                   => 조립식으로 변경 => 유지보수가 편하다
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
  <h3><% out.println("사원 목록"); %></h3>
  <table class="table_content" width=700>
   <tr>
     <th>사번</th>
     <th>이름</th>
     <th>직위</th>
     <th>급여</th>
   </tr>
   <%-- for(EmpVO vo:list) --%>
   <c:forEach var="vo" items="${list }">
     <tr>
      <td>${vo.empno }</td>
      <td>${vo.ename }</td>
      <td>${vo.job }</td>
      <td>${vo.sal }</td>
     </tr>
   </c:forEach>
  </table>
</body>
</html>