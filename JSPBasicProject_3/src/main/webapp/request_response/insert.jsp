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

</style>
</head>
<body>
  <div class="container">
   <h3>글쓰기</h3>
   <%--
      multipart/form-data : 파일업로드 사용하는 프로토콜
    --%>
   <form method="post" action="insert_ok.jsp"
    enctype="multipart/form-data"
   >
   <table class="table_content">
     <tr>
      <th width=15%>이름</th>
      <td width=85%>
       <input type=text name=name size=20 required>
      </td>
     </tr>
     <tr>
      <th width=15%>제목</th>
      <td width=85%>
       <input type=text name=subject size=50 required>
      </td>
     </tr>
     <tr>
      <th width=15%>내용</th>
      <td width=85%>
       <textarea rows="5" cols="52" name=content required></textarea>
      </td>
     </tr>
     <tr>
      <th width=15%>첨부파일</th>
      <td width=85%>
       <input type=file name=upload size=30>
      </td>
     </tr>
     <tr>
      <th width=15%>비밀번호</th>
      <td width=85%>
       <input type=password name=pwd size=10 required>
      </td>
     </tr>
     <tr>
       <td colspan="2" align=center>
         <input type=submit value="글쓰기">
         <input type=button value="취소"
          onclick="javascript:history.back()"
         >
       </td>
     </tr>
   </table>
   </form>
  </div>
</body>
</html>