<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      MV 구조 
      =======> MVC 
      M : model => 자바  
      V : view => jsp
      ------------------> JSTL/EL
                          ---- --
                               <%=%> 대신 사용하는 표현식
                          | 자바의 제어문 / 메소드 호출 => 태그
                          | 태그형 프로그램 (실무)
      => 최대한 : JSP에서 자바를 사용하면 안된다 
                ----------------
                 확장성이 없다 => 재사용이 안된다 => Model 1방식
                 보안에 취약하다 => JSP 컴파일 방식이 아니다 
                                => 소스자체 노출 
                 ----
                 | 자바파일을 만들어야 한다 
                   ------ .class 
                   | 확장성 => extends (상속) 
                   | 보안이 뛰어나다 
                   | 재사용성이 좋다
      => request.setAttribute() : 오라클 데이터를 추가 
      => 주력 => 자바/HTML
                --- ----   
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>