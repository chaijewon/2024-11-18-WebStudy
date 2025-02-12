<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
    // 사용자가 보내준 값을 받는다 => page 
    String strPage=request.getParameter("page");
    /*
       list.jsp  ===> null  
       list.jsp?page= ==> "" => strPage.equals("")
       list.jsp?page=1 ==> 1
       
       list.jsp?page=1&no=10
                ------------
                
       => 크롤링 => 오라클 : & => no값을 입력하시요 
    */
    if(strPage==null)
        strPage="1";
       
    int curpage=Integer.parseInt(strPage);
    // 데이터베이스 연결 
    DataBoardDAO dao=DataBoardDAO.newInstance();
    // 데이터베이스에서 출력할 데이터를 가지고 온다
    List<DataBoardVO> list=dao.databoardListData(curpage);
    int totalpage=dao.databoardTotalPage();
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
  width: 600px;
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
    <h3>자료실</h3>
    <table class="table_content">
     <tr>
      <td>
       <a href="insert.jsp">새글</a>
      </td>
     </tr>
    </table>
    <table class="table_content">
      <tr>
        <th width=10%>번호</th>
        <th width=45%>제목</th>
        <th width=15%>이름</th>
        <th width=20%>작성일</th>
        <th width=10%>조회수</th>
      </tr>
      <%
         for(DataBoardVO vo:list)
         {
      %>
             <tr>
		        <td width=10% align=center><%=vo.getNo() %></td>
		        <td width=45%><%=vo.getSubject() %></td>
		        <td width=15% align=center><%=vo.getName() %></td>
		        <td width=20% align=center><%=vo.getRegdate().toString() %></td>
		        <td width=10% align=center><%=vo.getHit() %></td>
		      </tr>
      <%
         }
      %>
      <%--
         삼항연산자 => 소스가 많거나 프로그램언어가 여러개를 사용 
                    ---------- ---------------------
                               | HTML + Java
                    | 게임 (복잡도) 
         if ~ else를 대체 
       --%>
      <tr>
       <td colspan="5" align=center>
        <a href="list.jsp?page=<%= curpage>1?curpage-1:curpage%>">이전</a>
        &nbsp; <%=curpage %> page / <%=totalpage %> pages
        &nbsp;
        <a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage%>">다음</a>
        <%-- <%
           if(curpage<totalpage)
           {
        %>
             <a href="list.jsp?page=<%=curpage+1%>">다음</a>
        <%
           }
           else
           {
        %>	
             <a href="list.jsp?page=<%=curpage%>">다음</a>
        <%   
           }
        %> --%>
       </td>
      </tr>
    </table>
  </div>
</body>
</html>