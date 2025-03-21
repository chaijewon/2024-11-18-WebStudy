<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      동적쿼리 
      프로시저 / 트리거 
                | like / reply
        | all_reply , all_like , all_jjim    
      ==================================== 
      2중 include
      
      MVC 동작 순서 
 *      
 *      사용자 요청 
 *      --------
 *        <a href=".do"> , <form action=".do"> : ~.do
 *         |
 *        DispatcherServlet 
 *         |
 *        등록 위치 @RequestMapping() : URI 매핑 
 *         |
 *        사용자가 처리한 메소드 찾기 
                      | DAO연동 
 *         | request에 출력에 필요한 데이터 첨부 request.setAttribute()
 *        invoke() ==> 호출 
 *         | request전송 
 *        JSP 
           (화면 출력)
           
           => 소스 코딩 
              JSP에서 link 설정 <a> <form> ajax:url
           => mapper에서 SQL작성
           => DAO에서 호출
           => MODEL에서 DAO연결 => 기능 수행 
           => request에 담아서 JSP에서 출력 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
location.href="main/main.do"
</script>
</head>
<body>
  
</body>
</html>