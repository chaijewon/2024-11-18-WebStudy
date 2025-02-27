<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--
     브라우저 내장객체
     -------------
               window (브라우저 외부관리) => 메뉴바 , 상태바 ..
                 | => open / close : 팝업 => shadowbox , whitebox
         ---------------------------------
         |          |          |         |
       document   location   screen     history : back() , go()
       --------   --------   -------    -------
                                        | 사이트 이동 => 정보
                             | 위치 , 화면 크기 
          |        | 화면 이동 => href 
        body / form .. (태그 관리) 
        
        => write / querySelector()
     내장 객체 
     ------- String / Number / Date / Array 
             ------------------------------- Java 
     => Jquery 기초 : AJAX 
 --%>
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
  width: 500px;
}
</style>
<script type="text/javascript">
// 000-000
// 우편번호 검색 / 아이디 중복체크 
function ok(zip,addr){
	opener.frm.post1.value=zip.substring(0,3)
	opener.frm.post2.value=zip.substring(4,7)
	opener.frm.addr1.value=addr
	self.close()
}
</script>
</head>
<body>
  <div class="container">
    <div class="row">
     <h3 class="text-center">우편번호 검색</h3>
     <form method=post action="../js/postfind.do">
     <table class="table">
      <tr>
        <td>
         <input type=text name=dong class="input-sm"
          placeholder="동/읍/면 입력">
         <input type=submit class="btn btn-sm btn-danger"
           value="검색">
        </td>
      </tr>
     </table>
     </form>
     <c:if test="${count!=0 }">
     <table class="table user-table">
      <thead>
       <tr>
        <th width=15% class="text-center">우편번호</th>
        <th width=85% class="text-center">주소</th>
       </tr>
      </thead>
      <tbody>
        <c:forEach var="vo" items="${list }">
          <tr>
           <td width=15% class="text-center">${vo.zipcode }</td>
           <td width=85%><a href="javascript:ok('${vo.zipcode }','${vo.address }')">${vo.address }</a></td>
          </tr>
        </c:forEach>
      </tbody>
     </table>
     </c:if>
    </div>
  </div>
</body>
</html>