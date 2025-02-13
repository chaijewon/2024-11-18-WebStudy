<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     Cookie 
       => 상태의 지속성 (Cookie / Session)
          --- 데이터의 변경 상황 
          React / Vue => state관리 프로그램 (데이터 상태프로그램) 
       => 데이터를 유지하기 위한 메모리 저장 공간 
          브라우저 (클라이언트)
       => 사용법 
          1. 저장 
             new Cookie(키 , 값)
                       (String key,String value)
                       =>  Map방식으로 사용한다 
                       =>  key를 중복할 수 없다 (중복된 키는 저장이 안된다)
             ## response 
                => 한개 JSP에서 한가지 일만 수행 
                   -------    -------
                               HTML 전송   => 2
                               Cookie 전송 => 1
                               => 여러번 전송이 가능 
               
          2. 읽기 
          3. 삭제 
          4. 저장기간 지정
          5. 저장된 데이터 읽기
             => 키 읽기
             => 값 읽기
          6. 저장 경로 설정 
          7. 저장할 수 있는 데이터 : String만 가능
          8. port가 다르면 서버에서 Cookie를 다를 수 없다 
          
             React     Spring-Boot 
                       | => 80port / 8080port
               |       | => 포트 허용 
            3000port
            => 자바스크립트 쿠키를 이용한다
               -------------
                react-cookie 
 --%>
<%
    // 사용자 전송값을 받는다 
    String fno=request.getParameter("fno");
%>