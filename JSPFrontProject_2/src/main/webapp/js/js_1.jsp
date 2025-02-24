<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     294
     1. HTML/CSS : 브라우저에 출력 (XML) 
     2. Java : 오라클 연결 / 브라우저 연결 
               데이터 관리 
               => 오라클 데이터를 읽어서 브라우저로 전송 
     3. Oracle : 사이트에 필요한 데이터를 저장 
     4. JavaScript : 브라우저에서 사용자 요청 처리 담당 
                     ------
                     => 브라우저에서는 오라클을 연결 할 수 없다 
                        => 오라클 연결(서버측 사이드 : NodeJS)
                     => React / Vue / Next => 동적으로 화면 출력 
                        ------------------ Java연결 
        브라우저    ================= 자바 =============== 오라클 
         => 자바스크립트            --------
              |                      |
              ------------------------
                         | 매칭 
                        ~VO ===> {} Object => ***JSON 
                                     자바스크립트 객체 표현법 
                        List ==> [] Array
         => 브라우저안에서 자바에서 전송을 받아서 동적으로 화면 출력 
                       ---------------------
                       
         => 동적 
            언어
               소스코드 === 컴파일러 == 기계어 출력 === 출력 
                          ------------------
            자바스크립트 
               소스코드 === 인터프리터 === 출력 
                         ---------
                         | 한줄씩 읽어서 출력 
                         | 에러 처리가 어렵다 (에러 출력이 없다)
                         | 흰 화면만 출력 
         => 사용법 
            1) 내부스크립트 : 파일 한개만 제어 
               <script type="text/javascript">
                 처리 내용 
               </script>
               => React / Vue 
               <script type="text/babel">
               => HTML안에서 자바스크립트 작업 : CDN
               </script> 
            2) 외부스크립트 : 파일을 제작해서 필요시마다 첨부 
                           확장자 (.js)
               <script type="text/javascript"
                   src="파일명|URL"></script>
                => import 
            3) 인라인스크립트 : 태그 한개에 대한 처리
               <태그 이벤트="javascript:함수">
               <a href="javascript:history.back()">
        => 버전
           ES5 => 변수 선언 : var 
                            --- 자동 지정 변수 
                            --- scope가 명확하지 않다 
                                ----- 사용범위
                            --- 지역변수 : {} 종료 
                  function a()
                  {
                     if()
                     {
                        var i=10;
                     }
                     // => 사용이 가능 
                  }
           ES6 => let / const 
                        | 상수형 변수 
                  | {}이 종료되면 메모리 회수 
                  
                  function a()
                  {
                     if()
                     {
                       let a=10;
                     } // => 메모리가 사라진다 (지역변수 역할)
                  }
                  
                  const => final 
                  
                  화살표 함수 
                  ---------
                  function a(){}
                  let a=function(){}
                  ***let a=()=>{} => function과 return 제거 
                     ------------
                     | 함수안에서 처리가 가능 
         자바스크립트 출력 : System.out.println() => 297
         ------------- 브라우저에 출력 
         1) alert() : 팝업창 
         2) console.log() => 도스 출력 
         3) document.write() => 브라우저 출력 
         4) innerHTML : 태그와 태그사이에 데이터 출력 
            => Ajax / React / Vue / Jquery 
         
         
      => 자바스크립트의 문법 
         변수 선언 / 연산자 / 제어문 
         함수 제작 => 처리 
         태그제어 (DOM) => 이벤트 처리 
         -------------------------
         내장함수 / 브라우저 함수 
         -------------------------
         라이브러리 : Jquery  
         
         1) 변수 선언 299
            변수의 데이터형을 사용하지 않는다 / 자동 데이터형 
            예) 
                설정값에 따라 데이터형이 다르다
                let i=10 => int => Number
                let i="aaa" => string 
                let i=10.0; => double => Number
                let i='A' => string 
                let i={}  => object
                let i=[]  => array
                let i=function(){} => function 
                      ------------ 데이터형으로 취급 
                      
                function a(){}
                function b(a){}
                         ---- callback => 이벤트 처리시에 주로 등장
                단점) 
                     let i=10;
                     i="aaa";
                     i=[1,2,3,4..]
              => 변수 식별자 
                 1) 키워드는 사용 불가 (if / let / const)
                 2) 특수문자 사용 가능 (_ , $)
                 3) 숫자 사용이 가능 (앞에 사용 금지)
                 4) 공백이 있으면 안된다 
                 5) 대소문자 구분 
                 6) 문자열 길이는 상관없다 (3~10)
              => 오류가 나도 에러출력이 없다 
                 => 소스가 길어지면 => 직접 확인 => 개발자 도구 
              => 데이터형 확인이 어렵다 (가독성) 
                 => let i=10.5  => i:double => TypeScript
              => let sa={name:"홍길동",age:20}
                         ----        ----
                           |           |
                           ------------- 멤버변수 => JSON
                   | object형 
                   | 자바스크립트 자체에서 데이터를 읽거나 (X) 
                     => 자바에서 데이터를 전송 : JSON 
                                           ------
                                           Ajax / Vue / React
                                           => View 역할 
                                           => 서버 연결 
                                              axios => 데이터 받기
           => 자바 : main()
              자바스크립트 : window.onload=function(){}
                  Jquery : $(function(){})
                  react : componentDidMount() => useEffect()
                  vue : mounted()
                  ------------------------------------------
            
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