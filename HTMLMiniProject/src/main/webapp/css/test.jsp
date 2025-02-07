<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <center>
    <h3>구구단</h3>
    <table border=1 bordercolor=black width=600>
     <tr>
       <%
          for(int i=2;i<=9;i++)
          {
       %>
            <td align=center><%= i+"단" %></td>   
       <%
          }
       %>
     </tr>
     <%
        for(int i=1;i<=9;i++)
        {
     %> 
          <tr>
          <%
             for(int j=2;j<=9;j++)
             {
          %>
                <td align=center>
                  <%= j+"*"+i+"="+(j*i) %>
                </td>
          <%
             }
          %>
          </tr>
     <% 
        }
     %>
    </table>
  </center>
</body>
</html>