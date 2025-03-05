<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>자바 날짜 변환</h3>
  <%
     // TO_CHAR(date,'YYYY-MM-DD')
     Date date=new Date();
     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  %>
  <%=sdf.format(date) %>
  <h3>JSTL 날짜 변환</h3>
  <c:set var="today" value="<%=date %>"/>
  <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
  <h3>자바 숫자 변환</h3>
  <%
     // TO_CHAR(price,'9,999,999')
     DecimalFormat d=new DecimalFormat("##,###,###");
  %>
  <%= d.format(1234567) %>
  <h3>JSTL 숫자 변환</h3>
  <%--
      TO_CHAR(price,'L999,999')
   --%>
  <fmt:formatNumber value="${1234567 }" type="currency"/>
</body>
</html>