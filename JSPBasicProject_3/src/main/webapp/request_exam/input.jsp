<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
.container{
  width: 600px;
  margin-top: 50px;
}
h3{
  text-align: center;
}
.table_content{
  width: 500px;
  margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
   <h3>개인 정보</h3>
   <form method=POST action="output.jsp">
   <!-- output.jsp에 요청한 데이터를 request에 묶어서 보내준다 
        톰캣에 의해 자동으로 묶어진다
   -->
   <table class="table_content">
     <tr>
       <th width=20%>이름</th>
       <td width=80%>
        <input type=text name=name size=20>
       </td>
     </tr>
     <tr>
       <th width=20%>성별</th>
       <td width=80%>
        <input type="radio" name=sex checked value="남자">남자
        <input type="radio" name=sex value="여자">여자
       </td>
     </tr>
     <tr>
       <th width=20%>지역</th>
       <td width=80%>
        <select name="loc">
          <option>서울</option>
          <option>경기</option>
          <option>인천</option>
          <option>부산</option>
          <option>제주</option>
        </select>
       </td>
     </tr>
     <tr>
       <th width=20%>소개</th>
       <td width=80%>
        <textarea rows=5 cols=30 name="content"></textarea>
       </td>
     </tr>
     <tr>
       <th width=20%>취미</th>
       <td width=80%>
        <input type="checkbox" name=hobby value="등산">등산
        <input type="checkbox" name=hobby value="여행">여행
        <input type="checkbox" name=hobby value="게임">게임
        <input type="checkbox" name=hobby value="낚시">낚시
        <input type="checkbox" name=hobby value="운동">운동
       </td>
     </tr>
     <tr>
       <td colspan="2" align=center>
         <input type=submit value="전송">
       </td>
     </tr>
   </table>
   </form>
  </div>
</body>
</html>