<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
    FoodDAO dao=FoodDAO.newInstance();
    List<FoodVO> list=dao.foodListData(curpage);
    int totalpage=dao.foodTotalPage();
    
    final int BLOCK=10;
    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    
    if(endPage>totalpage)
    	endPage=totalpage;
    
    List<FoodVO> tList=dao.foodTop10();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.p_name{
  overflow: hidden;
  white-space:nowrap;
  text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="row">
   <div class="col-sm-9">
    <%
       for(FoodVO vo:list)
       {
     %>
          <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="main.jsp?mode=1&fno=<%=vo.getFno()%>">
		        <img src="<%=vo.getPoster() %>" style="width:180px;height:130px">
		        <div class="caption">
		          <p class="p_name"><%=vo.getName() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
     <%
       }
     %>
     <div>
       <div class="text-center">
         <ul class="pagination">
          <% 
             if(startPage>1)
             {
          %>
		  <li><a href="main.jsp?page=<%= startPage-1%>">&lt;</a></li>
		  <%
             }
		      for(int i=startPage;i<=endPage;i++)
		      {
		  %>
		  <li <%=i==curpage?"class=active":""%>><a href="main.jsp?page=<%=i%>"><%=i %></a></li>
		  <%
		      }
		      if(endPage<totalpage)
		      {
		  %>
		  <li><a href="main.jsp?page=<%= endPage+1%>">&gt;</a></li>
		  <%
		      }
		  %>
		</ul>
       </div>
     </div>
   </div>
   <div class="col-sm-3">
     <h3>인기맛집 Top10</h3>
     <table class="table">
       <tr>
         <th class="text-center"></th>
         <th class="text-center">업체명</th>
         <th class="text-center">평점</th>
       </tr>
       <%
          for(FoodVO vo:tList)    
          {
       %>
             <tr>
               <td class="text-center">
                <img src="https://www.menupan.com<%=vo.getPoster() %>"
                 width="35" height="35">
               </td>
               <td><%=vo.getName() %></td>
               <td class="text-center"><%=vo.getScore() %></td>
             </tr>
       <%
          }
       %>
     </table>
   </div>
  </div>
</body>
</html>