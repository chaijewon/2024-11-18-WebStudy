<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
   JDBC / DBCP => MyBatis / JPA 
   -----------    -------
                   1. XML => 1차 
                   2. Annotation => 2차 
                      + XML 통합  
   <c:forEach> 실전 
   => 맛집 => 상세보기 
 --%>
<%
	List<String> names=new ArrayList<String>();
	names.add("홍길동");
	names.add("박문수");
	names.add("심청이");
	names.add("이순신");
	names.add("강감찬");
	List<String> sexs=new ArrayList<String>();
	sexs.add("남자");
	sexs.add("남자");
	sexs.add("여자");
	sexs.add("남자");
	sexs.add("남자");
	// => 홍길동(남자)
			
    request.setAttribute("names", names);
	request.setAttribute("sexs", sexs);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>일반 for문</h3>
  <ul>
    <%
       for(int i=0;i<names.size();i++)
       {
    	   String name=names.get(i);
    	   String sex=sexs.get(i);
    	   
    %>
         <li><%=name %>(<%=sex %>)</li>
    <%
       }
    %>
  </ul>
  <h3>&lt;c:forEach&gt;</h3>
  <ul>
    <c:forEach var="name" items="${names }" varStatus="s">
      <li>${name }(${ sexs[s.index]})</li>
    </c:forEach>
  </ul>
</body>
</html>