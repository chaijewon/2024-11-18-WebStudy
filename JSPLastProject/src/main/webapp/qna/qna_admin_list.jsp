<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
   RestFul => 다른 프로그램 연동 
              자바 = 자바스크립트
              자바 = HTML
      | GET/POST/PUT/DELETE
                     |DELETE
                 |UPDATE 
            |INSERT
         |SELECT
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

             <table class="table">
              <tr class="table-info">
                <th width=10% class="text-center">번호</th>
                <th width=40% class="text-center">제목</th>
                <th width=10% class="text-center">이름</th>
                <th width=15% class="text-center">작성일</th>
                <th width=10% class="text-center">조회수</th>
                <th width=15% class="text-center"></th>
              </tr>
              <c:set var="count" value="${count }"/>
              <c:forEach var="vo" items="${list }">
                <tr>
                 <td width=10% class="text-center">${count }</td>
                 <td width=40%>
           
                  
                  ${vo.subject }
                 
                  
                 </td>
                 <td width=10% class="text-center">${vo.name }</td>
                 <td width=15% class="text-center">${vo.dbday }</td>
                 <td width=10% class="text-center">${vo.hit }</td>
                 <td width="15%" class="text-center">
                  <c:if test="${vo.anok=='y' }">
                   <a href="#" class="btn btn-warning btn-sm">수정</a>
                   <a href="../qna/qna_admin_delete.do?gi=${vo.group_id }" class="btn btn-warning btn-sm">삭제</a>
              
                  </c:if>
                  <c:if test="${vo.anok=='n' }">
                   <a href="../qna/qna_admin_insert.do?gi=${vo.group_id }" class="btn btn-danger btn-sm">답변대기</a>
                  </c:if>
                 </td>
               </tr>
               <c:set var="count" value="${count-1 }"/>
              </c:forEach>
             </table>
             <table class="table">
               <tr>
                
                <td class="text-right">
                 <a href="../qna/qna_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-info btn-sm">이전</a>
                  ${curpage } page / ${totalpage } pages
                 <a href="../qna/qna_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-success btn-sm">다음</a>
                </td>
               </tr>
             </table>
          
</body>
</html>