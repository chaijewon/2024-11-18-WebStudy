<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    // 사용자 전송 데이터 받기 
    // detail.jsp?no=1
    // 자바 (Model)/ HTML(View)
    // Model => View
    /*
        자바 ======> 사용자 요청 처리 => 해당 데이터 읽기 
                    데이터 관리
                    ----- 저장 : 오라클 
        HTML/CSS ===> 읽어온 데이터만 출력 
        --------- 브라우저에서는 HTML/XML만 사용이 가능
        
        자바스크립트 : 브라우저안에서 데이터 관리 
                    서버 연결 부분이 아니다 
                    
        오라클 = 자바 = 자바스크립트 = HTML
        -----------------------------
         => 한셋트 (Spring)
    */
    
    String no=request.getParameter("no");
    DataBoardDAO dao=DataBoardDAO.newInstance();
    DataBoardVO vo=dao.databoardDetail(Integer.parseInt(no));
%>
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
       <td width=30% align="center"><%= vo.getNo() %></td>
       <th width=20%>작성일</th>
       <td width=30% align="center"><%= vo.getRegdate().toString() %></td>
      </tr>
      <tr>
       <th width=20%>이름</th>
       <td width=30% align="center"><%=vo.getName() %></td>
       <th width=20%>조회수</th>
       <td width=30% align="center"><%=vo.getHit() %></td>
      </tr>
      <tr>
       <th width=20%>제목</th>
       <td colspan="3"><%=vo.getSubject() %></td>
      </tr>
      <%
         if(vo.getFilesize()>0)
         {
      %>
      <tr>
       <th width=20%>첨부파일</th>
       <td colspan="3"><a href="download.jsp?fn=<%=vo.getFilename() %>"><%=vo.getFilename() %></a>(<%=vo.getFilesize() %>Bytes)</td>
      </tr>
      <%
         }
      %>
      <tr>
        <td colspan="4" align="left" valign="top" height="200">
         <pre style="white-space: pre-wrap;"><%=vo.getContent() %></pre>
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