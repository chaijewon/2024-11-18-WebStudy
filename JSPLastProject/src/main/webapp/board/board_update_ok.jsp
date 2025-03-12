<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:if test="${res==0 }">
  <script>
   alert("비밀번호가 틀립니다")
   history.back()
  </script>
</c:if>
<c:if test="${res==1 }">
  <c:redirect url="../board/board_detail.do?no=${no }&page=${page }"/>
</c:if>