<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
    List<FoodVO> list=dao.foodListData(curpage);
    int totalpage=dao.foodTotalPage();
    
    final int BLOCK=10;
    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    /*
         1 2 3 .... 10
         -          --
         startPage  endPage 
         
         11 12 ...... 20
    */
    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    if(endPage>totalpage)
    	endPage=totalpage;
%>
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
  margin: opx auto;
  width: 960px;
}
p{
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="container">
   <div class="jumbotron">
    <h3 class="text-center">맛집 목록</h3>
   </div>
   <div class="row">
    <%
       for(FoodVO vo:list)
       {
    %>
          <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="<%=vo.getPoster() %>" style="width:239px;height: 180px">
		        <div class="caption">
		          <p><%=vo.getName() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
    <%
       }
    %>
   </div>
   <div style="height: 20px"></div>
   <div class="row text-center">
     <ul class="pagination">
      <li class="active"><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
     </ul>
   </div>
  </div>
</body>
</html>