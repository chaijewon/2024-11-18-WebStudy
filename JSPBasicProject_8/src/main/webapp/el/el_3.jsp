<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
      논리연산자 : and (&&) , or (||) 
 --%>
 <%-- &#36;{10>6 && 5==6}=${10>6 && 5==6}: && = 두개의 조건이 true일경우에만 true<br>
 &#36;{10>6 and 5==6}=${10>6 and 5==6}<br>
 
 &#36;{10>6 || 5==6}=${10>6 || 5==6}: && = 두개의 조건중에 한개이상 true일경우에만 true<br>
 &#36;{10>6 or 5==6}=${10>6 or 5==6}<br>
 
 &#36;{10>6?"A":"B"}=${10>6?"A":"B" }<br> --%>
 
 <%--
        list.jsp?id=admin
                 -- ------
                 키   값
        => request.getParameter("id")
        => ${param.id}
                   --- 키
                   
        1. request.setAttibute(키,값) 
           => request.getAttribute(키)
              => ${키},${requestScope.키}
              => <%=request.getAttribute(키) %>
        2. session.setAttribute(키,값)
           => session.getAttribute(키) 
              => ${sessionScope.키}
              => <%= session.getAttribute(키) %>
        3. request.getParameter("키")
              => <%= request.getParameter("키")%> 
              => ${param.키}
              => System.out.println(값)
  --%>
 
 
</body>
</html>