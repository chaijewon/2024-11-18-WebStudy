<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.EmpDAO"/>
<%
     List<EmpBean> list=dao.empListData();
%>
<%--
    EmpDAO dao=new EmpDAO()
 --%>
<%--
     8장 => Basic 
     ------------
     1. 빈즈 / 액션 
        JSP => Bean => VO(Spring) , DTO(MyBatis)
                       ----------
                       |= Spring : Java => 화면 출력 (JSP)
                                           ------------- View
                          ------------- Model
                          ====================== +
                                   스프링 라이브러리 : Servlet
                                                     |
                                                  Controller
        :데이터를 모아서 브라우저 한번에 전송 
        1) 자바빈즈 만들기 
           1. 데이터를 저장하는 변수 설정 
                            ------- 캡슐화 => private설정 
              => 설정된 변수마다 기능 부여 
                      ----
                      메모리에 저장 : setter
                      메모리에서 읽기 : getter
              => 변수는 이미 결정 
                 ------------- 데이터베이스 => 컬럼명 
                 ------------- 크롤링 필요한 데이터 
                 ------------- OpenAPI 
           2. 설정하는 방식 
              getter / setter : 자동완성기 / lombok
              => name 
                 setName() / getName()
                    -           -
              => boolean : 존재여부 확인 
                 boolean login
                 setter : isLogin()
                          --
                 getter : getLogin()
           3. 데이터를 보호 / 데이터를 모아서 처리 
           4. VO와 동일 
           5. 액션 태그 사용 
              -----------
              <jsp:useBean> : 객체 메모리 할당
               MemberVO vo=new MemberVO()
               <jsp:useBean id="vo" class="MemberVO"/>
              <jsp:setProperty> : 객체의 변수값 주입 
               vo.setName("aaa")
               => 일반 JSP => 사이트 (확장성 없다) => 소규모 / 홈페이지
                             ---------------- Model 1 방식 
               <jsp:setProperty name="vo" property="name" value="aaa">
               ***<jsp:setProperty name="vo" property="*">
                 => vo가 가지고 있는 모든 setter에 값을 채운다
               *** 스프링 
                   public String memberInsert(MemberVO vo)
                   => 매개변수                 ------------- command
              <jsp:getProperty> : 객체의 변수값 출력 
              <jsp:param> : 다른 페이지이동시 필요한 데이터 전송 
              
     2. DBCP : DataBase Coonection Pool 
               ------------------------ 293page 
               1) 데이터베이스 연결에 소모되는 시간을 단축할 수 있다
                            --------------- 가장 많은 시간이 투자
               2) 미리 Connection을 데이터베이스에 연결한 상태에서 저장 
                  -------------- Connection 생성 지정 
               3) 일반적으로 웹프로그램은 대부분 DBCP를 사용하다 
               4) Connection의 객체를 제한 
               5) 사용후에 재사용한다 
               6) Connection을 미리 생성했기 때문에 => 객체관리 쉽다 
               7) 쉽게 서버가 다운되지 않는다 
               <dataSource type="POOLED"> MyBatis에서 DBCP 
          목적 : 웹 사용자에게 응답시간을 단축시간 (빠른 속도)
                효율적인 데이터베이스 연동 
                
          DBCP 
          ----
           방법 
                1. 시작과 동시에 Connection객체 생성 (연결된 상태)
                   => 몇개 생성 
                      maxIdle="10"
                   => 만약에 초과되면 확장 => 추가 maxActive="10"
                2. 저장 => 저장 공간 (Pool)
                3. 사용자가 요청하면 Connection의 주소를 얻어온다 
                4. 사용자 요청 처리 
                5. 사용후에는 반드시 POOL에 반환 => 재사용 
                   포털 => 10000개 
           코딩 
               1. server.xml 등록 
               2. getConnection() => 미리 생성된 Connection객체 얻기
               3. disConnection() => 반환 
               4. 기능은 동일 
     3. Cookie / Session 
     -------------------
     4. JSTL / EL 
     5. MVC => Spring
     
     => 지도 / Cookie => 전체 
     
     A a=new A();
     
     a=new A();
     
     a=new A()
     
     
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
  <h3>사원목록</h3>
  <table class="table_content" width=500>
   <tr>
    <th>사번</th>
    <th>이름</th>
    <th>직위</th>
    <th>입사일</th>
    <th>급여</th>
   </tr>
   <%-- 출력 : 자바 / 자바스크립트:파일 변경을 하지 않는다 --%>
   <%
      for(EmpBean vo:list)
      {
   %>
         <tr>
		    <td><%=vo.getEmpno() %></td>
		    <td><%=vo.getEname() %></td>
		    <td><%= vo.getJob() %></td>
		    <td><%=vo.getHiredate().toString() %></td>
		    <td><%=vo.getSal() %></td>
		   </tr>
   <%
      }
   %>
  </table>
</body>




</html>