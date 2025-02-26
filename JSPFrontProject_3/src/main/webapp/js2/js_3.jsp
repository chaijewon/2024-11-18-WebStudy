<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     문서 객체 
     -------
       태그를 가지고 와서 객체로 변환 (태그: 객체 , 속성 : 멤버변수)
       <a href="" target="">
       
       let a=document.querySelector("a")
       a.href="";
       a.target="_blank"
       
       => document.querySelector()
                               ----
                               1. id => #id명
                               2. class => .class명
                               3. tag명 => tag명 
       => document.getElementById(아이디명)
       
       ***=> document.getElementByClassName(클래스명)
       ***=> document.getElementByTagName(태그명) 
       ***=> 같은 태그 여러개 
          document.querySelectorAll()
       ---------------------- 배열로 읽어 온다 
       createElement("태그명") => 태그 생성 
         => react
       createElement("a") => <a></a>
       createTextNode("aaa") <a>aaa</a> => 태그와 태그사이 값 생성
       속성 설정 : setAttribute() => $().attr()
       속성 읽기 : getAttribute()
       태그를 여러개 생성 
         => appendChild() => $("a").append()
                             --- document.querySelector()
       태그와 태그사이에 값을 첨부 
       ---------------------
       태그.innerHTML="<h1>aaa</h1>" => aaa => 
         $().html()
       태그.textContent="<h1>aaa</h1>" => <h1>aaa</h1>
         $().text()
       
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
    .js / .ts 
    .jsx / .tsx 
 -->
<script type="text/javascript" src="img.js"></script>
</head>
<body>
  
</body>
</html>