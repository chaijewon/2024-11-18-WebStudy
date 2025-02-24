<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     논리연산자 
       && , ||
            -- 병렬연산자 => 두개의 조건중에 1개 이상 true 
            -- 범위를 벗어난 경우 
       --직렬연산자 => 두개의 조건이 true일때 true
       --범위에 포함 
       
       형식) 조건 &&(||) 조건 
            ---    ---
             |      |
             --------
                |
              결과값
        =====================
                     &&    ||
        =====================
        true true   true  true
        =====================
        true false  false true
        =====================
        false true  false true
        =====================
        false false false false 
        ===================== 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let i=(6<7) && (6===7)
	console.log("i="+i) // false
	let j=(6<7) || (6===7)
	console.log("j="+j) // true
	
	// 대입연산자 = , += , -= 
    /*
         let k=10;
	     k+=10 ====== k=k+10 => k=20
	     k-=10 ====== k=k-10 => k=0
    */
    let k=10
    k+=10;
	console.log("k="+k) // k=20
	k-=10
	console.log("k="+k) // k=10
	
	let n=10/0
	console.log("n="+n) // Infinity => 0으로 나눈 경우 처리 
	
	let g=(6%2===0)?"짝수":"홀수"
	console.log("g="+g)		
			
}
</script>
</head>
<body>

</body>
</html>