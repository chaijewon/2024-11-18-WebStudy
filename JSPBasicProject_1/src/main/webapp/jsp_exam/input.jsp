<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=post action="output.jsp">
  <table border=1 bordercolor=black width=500>
    <tr>
     <td width=20%>아이디</td>
     <td width=80%>
      <input type=text name=id size=15>
     </td>
    </tr>
    <tr>
     <td width=20%>이름</td>
     <td width=80%>
      <input type=text name=name size=15>
     </td>
    </tr>
    <tr>
     <td width=20%>성별</td>
     <td width=80%>
      <input type=radio name=sex value=남자 checked>남자
      <input type=radio name=sex value=여자>여자
     </td>
    </tr>
    <tr>
     <td width=20%>주소</td>
     <td width=80%>
      <input type=text name=address size=35>
     </td>
    </tr>
    <tr>
     <td width=20%>전화</td>
     <td width=80%>
      <input type=text name=phone size=20>
     </td>
    </tr>
    <tr>
      <td colspan="2" align=center>
        <input type=submit value="전송">
      </td>
    </tr>
  </table>
  </form>
</body>
</html>