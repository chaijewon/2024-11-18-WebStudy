<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
               <tr>
                <th class="text-center table-danger" width=20%>번호</th>
                <td class="text-center" width=30%>${vo.no }</td>
                <th class="text-center table-danger" width=20%>작성일</th>
                <td class="text-center" width=30%>${vo.dbday }</td>
               </tr>
               <tr>
                <th class="text-center table-danger" width=20%>이름</th>
                <td class="text-center" width=30%>${vo.name }</td>
                <th class="text-center table-danger" width=20%>조회수</th>
                <td class="text-center" width=30%>${vo.hit }</td>
               </tr>
               <tr>
                <th class="text-center table-danger" width=20%>제목</th>
                <td colspan="3">${vo.subject }</td>
               </tr>
               <tr>
                <td colspan="4" class="text-left"
                  valign="top" height="200"><pre style="white-space:pre-wrap;border:none;background-color: white">${vo.content }</pre></td>
               </tr>
              
              </table>
              
              <form method="post" action="../qna/qna_admin_insert_ok.do">
              <table class="table">
              
               <tr>
                <th class="text-center table-warning" width=20%>제목</th>
                <td width=80%>
                 <input type=text name=subject id=subject size=50
                  class="input-sm" required>
                 <input type=hidden name=group_id value="${vo.group_id }">
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>내용</th>
                <td width=80%>
                 <textarea rows="10" cols="52" name=content required></textarea>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>비밀번호</th>
                <td width=80%>
                 <input type=password name=pwd id=pwd size=20
                  class="input-sm" required>
                </td>
               </tr>
               
               <tr>
                 <td colspan="2" class="text-center">
                  <input type=submit value="답변" class="btn-primary btn-sm">
                  <input type=button value="취소" class="btn-danger btn-sm"
                   onclick="javascript:history.back()"
                  >
                 </td>
               </tr>
              </table>
              </form>
</body>
</html>