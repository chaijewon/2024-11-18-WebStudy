<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    1) 데이터베이스 => 테이블 => 크롤링
    2) GIT => Repository (조별) => Pull (템플릿)
    3) => mainpage 
    => mainpage / join / login
                  ------------- ajax : 검색 , 예약 , 결재 
                                ---- 7.5/2.5
    1. 라이브러리 로드 
       <script src="http://code.jquery.com/jquery.js"> 
       => 라이브러리 충돌 
       => main.jsp에 추가 
    2. jquery는 자바스크립트 라이브러리 
       1) 변수 설정 => var / let / const:서버에서 데이터 읽기
       2) 데이터형 : number / string / date / boolean 
          / object:{},[]
       3) 연산자 => 자바스크립트 이용 
          + : 문자열 결합 , HTML를 제어하는 프로그램 : 읽기 => 문자열
          => 형변환 : Number,parseInt
       4) 제어문 
          if / if ~ else 
          for => 일반 for 
          for-each => map / forEach
       5) 서버에서 데이터 전송을 받는 경우  => Ajax 
          => 검색 : List => [] 
          => VO : {키:값,키:값} => JSON 
          
       6) 객체모델 / 문서 모델 => 태그제어 ***
          자바스크립트 : document.querySelector(CSS)
          Jquery : $(CSS) => selector 
          --------------------------- 태그 선택 / 내장 객체
        7) 자바스크립트에서 지원하는 라이브러리 
           Array / String / Number / Date / Math
                            ------          -----
                                            | ceil() , round()
                            | 형변환 , toLocaleString()
                            | parseInt
           | push() : 데이터 추가 , slice() : 잘라서 새로운 배열
           | pop() : 데이터 삭제 , ... 배열 복사
                  | trim() , indexOf() , substring() , substr()
                  | split() , replace()
        8) 브라우저 객체 
           window => open() , close() , scrollbar()
           location => href : 화면 이동 
           history => back , go(-1)
           document => write() , querySelector()
        ------------------- Jquery에서 자바스크립트 이용 
        jquery 
        ------ selector => 태그 제어(읽기 / 쓰기) => 출력 
                        => Ajax
        1) selector 
           태그명 : $('태그명') = 멀티
           아이디명 : $('#아이디명') = 싱글 
           클래스명: $('.클래스명') = 멀티 
                  -------------------- 해당 태그 $(this)
           => CSS 
              후손 / 자손 => $('태그명>태그명') $('태그명 태그명')
              속성 => $('태그명[속성=값]')
              가상선택자 => 목록 (table , dl , ul) 
                         $('li:eq(0)')
                         $('li:nth-child(1)')
        2) 태그 제어 
           = 감추기 / 보여주기 
             display:'' / display:none
               show           hide
           = 태그와 태그 사이 값 읽기 / 쓰기 
             <td>aaa</td> => $('td').text()  = 읽기 => aaa
             <td></td>    => $('td').text("aaa")  = 쓰기 
               ----> 자바스크립트 td.textContent=""
             <td><span>aaa</span></td> => $('td').html() 
                                       <span>aaa</span>
                                       => $('td').text() 
                                          aaa
             => html => td.innerHTML=html
           = 태그의 속성값 읽기 쓰기 
             <태그 속성=값> => $('태그').attr(속성명) : 읽기
                          => $('태그').attr(속성명,값): 쓰기 
           = value => input / select / textarea
             <input type=text> => $('input').val() 
                               => $('input').val(값)
           = append() => 추가를 계속할때 사용 
           
       3) 읽기 / 쓰기 시점 => 이벤트 
          버튼 / 이미지 => click 
             => $('태그').click(function(){}) : 고전적 이벤트 
             => $('태그').on('click',function(){}) : 리스너 이용
          => onchange : select 
             onkeydown / onkeyup 
             onmouseout / onmouseover 
             ------------------------ hover
       4) 애니메이션 
       5) Ajax 
          => 비동기적인 자바스크립트 and XML    
             -------- async / sync 
             
          동작 
          ---
          브라우저에서 서버를 연결하는 객체 얻기 
                    -------------------
                    XMLHttpRequest : 브라우저에 내장 
          브라우저                         서버 
                   XMLHttpRequest:요청     | 요청 처리
                   
                   <------------------
                    요청 처리된 데이터 응답
                    => XML / JSON
           |
          화면출력  
          
          한페이지에서 송신 / 수신이 가능 => 페이지 변경이 없다 
                    --------- 유지보수 
          => Ajax를 이용한 로그인 처리 
          
          => 30줄 : 4줄 
       
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let httpRequest=null
function getXMLHttpRequest() // 브라우저에서 HttpXMLRequest객체 읽기
{
	// 브라우저마다 객체명이 다르다 
	if(window.XMLHttpRequest) // null 이 아니면 
	{
		// 크롬 / FF => IE(X) , Internal (이클립스 내장)
		return new XMLHttpRequest() 
		// XMLHttpRequest : 서버에 요청 => 결과값을 읽어오는 역할 
		// $.ajax({})
	}
	else
	{
	    return null	
	}
}
// 전송 => 수신 
function sendRequest(url,params,callback,method)
{
	 // callback => 시스템에 의해 자동 호출되는 함수 => 결과값을 받아서 출력
	 /*
	    $.ajax({
	    	url: ,
	    	type: ,
	    	data:{},
	    	success:function()
	    	{
	    		// 데이터 받아서 출력 
	    	}
	    })
	    
	    // => Vue / React
	    axios.get(url,{params}).then(function(){})
	    axios.post(url,{params}).then(function(){})
	 */
	 // 1. 객체 생성 
	 httpRequest=getXMLHttpRequest()
	 // <form action=""> GET <form method="POTS")
	 // 2. method방식 지정 
	 let httpMethod=method?method:'GET'
	 if(httpMethod!='GET' && httpMethod!='POST')
	 {
		 httpMethod='GET'
	 }
	 // Param 처리 => ?id=admin  
	 let httpParams=(params===null||params==="")?null:params
	 // URL 처리 
	 let httpUrl=url
	 // GET방식이고 전송할 데이터가 있는 경우
	 if(httpMethod==='GET' && httpParams!=null)
	 {
		 httpUrl=httpUrl+"?"+httpParams
	 }
	 
	 // 서버연결 => open함수는 이미 제작됨 
	 httpRequest.open(httpMethod,httpUrl,true) 
	 // true => 비동기 , false => 동기
	 // 한글 처리 
	 httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
	 // 자동호출되는 함수 지정 
	 httpRequest.onreadystatechange=callback
	 // 데이터 전송 
	 httpRequest.send(httpMethod==='POST'?httpParams:null)
     // 데이터 읽기 : responseText / responseXML(JSON)
}
function send()
{
	  sendRequest('sub.jsp',null,ok,'POST')// 요청
}
function ok()
{
	/*
	    0 => 서버 연결 준비 
	    1 => 서버 연결 => open
	    2 => 서버연결 완료 
	    3 => 데이터 전송 준비 => send()
	    4 => 데이터 전송 완료 
	*/
	if(httpRequest.readyState===4)
	{
		if(httpRequest.status===200)
		{
			// status => 정상 수행 (200) , 404,403,500...
			let div=document.querySelector("#print")
			div.innerHTML=httpRequest.responseText
		}
	}
}
</script>
</head>
<body>
  <button onclick="send()">전송</button>
  <div id="print"></div>
</body>
</html>