<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#all').click(function(){
		if($(this).is(':checked')){
			$('input[name=dbox]').prop("checked",true)
		}
		else
		{
			$('input[name=dbox]').prop("checked",false)
		}
	})
})
</script>
</head>
<body>
<form method=post action="../admin/notice_delete.do">
<table class="table">
              <tr>
               <td>
                <a href="../admin/notice_insert.do" class="btn btn-danger btn-sm">새글</a>
               </td>
              </tr>
             </table>
             <table class="table">
              <tr>
                <th width=10% class="text-center">번호</th>
                <th width=45% class="text-center">제목</th>
                <th width=15% class="text-center">이름</th>
                <th width=20% class="text-center">작성일</th>
                <th width=10% class="text-center">조회수</th>
              </tr>
                <tr>
                  <td colspan="5">
                   <input type="checkbox" value="all" id="all">전체선택
                   &nbsp;
                   <input type=submit value="삭제" class="btn-sm btn-danger">
                  </td>
                </tr>
              <c:set var="count" value="${count }"/>
              <c:forEach var="vo" items="${list }">
                <tr>
                 <td width=10% class="text-center">
                 <input type="checkbox" name="dbox" value="${vo.no }">
                 ${count }</td>
                 <td width=45%><a href="../admin/notice_detail.do?no=${vo.no}">[${vo.types}]&nbsp;${vo.subject }</a></td>
                 <td width=15% class="text-center">${vo.name }</td>
                 <td width=20% class="text-center">${vo.dbday }</td>
                 <td width=10% class="text-center">${vo.hit }</td>
               </tr>
               <c:set var="count" value="${count-1 }"/>
              </c:forEach>
             </table>
             <table class="table">
               <tr>
                <td class="text-right">
                 <a href="../admin/notice_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-info btn-sm">이전</a>
                  ${curpage } page / ${totalpage } pages
                 <a href="../admin/notice_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-success btn-sm">다음</a>
                </td>
               </tr>
             </table>
           </form>
</body>
</html>