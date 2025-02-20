<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
  margin: 0px auto;
  width: 800px;
}
</style>
</head>
<body>
   <div class="container">
     <h3 class="text-center">글쓰기</h3>
     <div class="row">
      <form method="post" action="insert_ok.do">
       <table class="table">
        <tr>
          <th width=20%>이름</th>
          <td width=80%>
           <input type=text name=name size=15 class="input-sm" required>
          </td>
        </tr>
        <tr>
          <th width=20%>제목</th>
          <td width=80%>
           <input type=text name=subject size=45 class="input-sm" required>
          </td>
        </tr>
        <tr>
          <th width=20%>내용</th>
          <td width=80%>
           <textarea rows="10" cols="45" name=content required></textarea>
          </td>
        </tr>
        <tr>
          <th width=20%>비밀번호</th>
          <td width=80%>
           <input type="password" name=pwd size=10 
           class="input-sm" required>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit value="글쓰기" class="btn-sm btn-success">
            <input type=button value=취소 class="btn-sm btn-info"
             onclick="javascript:history.back()"
            >
          </td>
        </tr>
       </table>
       </form>
     </div>
   </div>
</body>
</html>