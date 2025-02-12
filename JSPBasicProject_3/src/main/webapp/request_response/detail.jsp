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
  width: 900px;
  margin-top: 50px;
}
h3{
    text-align: center;
}
.table_content{
  width: 500px;
  margin: 0px auto;
}
a{
   text-decoration: none;
   color:black;
}
a:hover{
   text-decoration: underline;
   color:green;
}
</style>
</head>
<body>
  <div class="container">
    <h3>내용보기</h3>
    <table class="table_content">
      <tr>
       <th width=20%>번호</th>
       <td width=30% align="center"></td>
       <th width=20%>작성일</th>
       <td width=30% align="center"></td>
      </tr>
      <tr>
       <th width=20%>이름</th>
       <td width=30% align="center"></td>
       <th width=20%>조회수</th>
       <td width=30% align="center"></td>
      </tr>
      <tr>
       <th width=20%>제목</th>
       <td colspan="3"></td>
      </tr>
      <tr>
       <th width=20%>첨부파일</th>
       <td colspan="3"></td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="top" height="200">
         <pre style="white-space: pre-wrap;"></pre>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="right">
         <a href="#">수정</a>
         <a href="#">삭제</a>
         <a href="list.jsp">목록</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>