<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,java.util.*"%>
<%--
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String address=request.getParameter("address");
    String phone=request.getParameter("phone");
    
    MemberVO vo=new MemberVO();
    vo.setId(id);
    vo.setName(name);
    vo.setSex(sex);
    vo.setAddress(address);
    vo.setPhone(phone);
   
--%>  
<jsp:useBean id="vo" class="com.sist.vo.MemberVO">
 <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 아이디:<%= vo.getId() %><br>
 이름:<%=vo.getName() %><br>
 성별:<%=vo.getSex() %><br>
 주소:<%=vo.getAddress() %><br>
 전화:<%=vo.getPhone() %>
</body>
</html>