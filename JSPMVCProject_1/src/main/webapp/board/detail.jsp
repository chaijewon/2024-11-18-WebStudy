<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

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
   <h3 class="text-center">내용보기</h3>
   <div class="row">
     <table class="table">
      <tr>
       <th width="20%" class="text-center danger">번호</th>
       <td width="30%" class="text-center">${vo.no }</td>
       <th width="20%" class="text-center danger">작성일</th>
       <td width="30%" class="text-center"><fmt:formatDate value="${vo.regdate }" 
                     pattern="yyyy-MM-dd"/></td>
      </tr>
      <tr>
       <th width="20%" class="text-center danger">이름</th>
       <td width="30%" class="text-center">${vo.name }</td>
       <th width="20%" class="text-center danger">조회수</th>
       <td width="30%" class="text-center">${vo.hit }</td>
      </tr>
      <tr>
       <th width="20%" class="text-center danger">제목</th>
       <td colspan="3">${vo.subject }</td>
      </tr>
      <tr>
        <td colspan="4" class="text-left" valign="top" height="200">
          <pre style="white-space: pre-wrap;border: none;background-color: white;">${vo.content }</pre>
        </td>
      </tr>
      <tr>
       <td colspan="4" class="text-right">
         <a href="#" class="btn btn-xs btn-warning">수정</a>
         <a href="#" class="btn btn-xs btn-info">삭제</a>
         <a href="list.do" class="btn btn-xs btn-success">목록</a>
       </td>
      </tr>
     </table>
   </div>
  </div>
</body>
</html>