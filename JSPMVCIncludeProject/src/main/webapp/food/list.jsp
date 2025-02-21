<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Lorem</a></li>
      <li><a href="#">Ipsum</a></li>
      <li><a href="#">Dolor</a></li>
    </ul>
   </div>
</div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <div class="content"> 
      <div id="gallery">
        <figure>
          <header class="heading">맛집 목록</header>
          <ul class="nospace clear">
           <c:forEach var="vo" items="${list }" varStatus="s">
            <li class="${s.index%4==0?'one_quarter first':'one_quarter'}"><a href="../food/detail_before.do?fno=${vo.fno }"><img src="https://www.menupan.com${vo.poster }" title="${vo.name }"></a></li>
           </c:forEach> 
          </ul>
        </figure>
      </div>
      <nav class="pagination">
        <ul>
        <%-- startPage : 1 11 21... --%>
         <c:if test="${startPage>1 }">
          <li><a href="../food/list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
         
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <li ${curpage==i?"class=current":"" }><a href="../food/list.do?page=${i }">${i }</a></li>
         
         </c:forEach>
         
         <%--
              endPage : 10 20 30
          --%>
         <c:if test="${endPage<totalpage }">
          <li><a href="../food/list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
      </nav>
      </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>