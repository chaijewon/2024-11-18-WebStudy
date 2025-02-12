<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JspWriter : 버퍼관리</h1>
1.버퍼 크기:<%= out.getBufferSize() %><%-- 8*1024 --%><br>
2.남아 있는 버퍼 : <%= out.getRemaining() %><br>
3.사용중인 버퍼:<%=out.getBufferSize()-out.getRemaining() %>
4.사용처 : 복잡한 HTML이 있는 경우에 사용 => 답변형 / 대댓글
  <table border=1 bordercolor=black width=300>
    <tr>
      <td>Hello JSP!!</td>
    </tr>
    <tr>
      <td>
      <% 
         for(int i=1;i<=2;i++) 
         {
             out.println("&nbsp;&nbsp;");
         }
      %>
      Hello JSP2...
      <%
          if(true) // 오늘 날짜 => new
          {
        	  out.println("<sup>new</sup>");
          }
      %>
      </td>
    </tr>
  </table>
</body>
</html>