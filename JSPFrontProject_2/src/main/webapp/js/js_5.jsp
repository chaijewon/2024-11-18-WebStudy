<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 이항연산자 
/*
 *   1. 산술연산자 
        + , -  , *  , /  , %
        + : 뎃셈 , 문자열 결합 => NaN(연산이 안된 경우)
            --------------
            let a=10+10 => 20 
            let a="10"+"10" => 1010
        / : 0으로 나눌 수 없다
            ##### 정수/정수=실수
        % : 왼쪽 부호를 따라간다 
            + % +  => +
            - % +  => -
            + % -  => +
            - % -  => -
     2. 비교연산자 
     3. 논리연산자 
     4. 대입연산자 
 */
 window.onload=function(){
    // $(function(){})  , $(document).ready(function(){}) : jquery
    // mounted():vue , componentDidMount() , useEffect():react
    // 시작점 
    let a=5;
    let b=2;
    console.log("a+b="+(a+b)) // 7
    console.log("a-b="+(a-b)) // 3
    console.log("a*b="+(a*b)) // 10
    console.log("a/b="+(a/b)) // 2.5
    console.log("a%b="+(a%b)) // 1
    // 장바구니 계산 => select => 숫자(X) => 문자열  => *하면 NaN
    let c="A"
    let f=20000
    console.log(c+f) // 문자열 결합 1020000
    console.log(parseInt(c)*f)
    /*
       주의점 
       숫자가 아닌 경우=> +외에 다른 산술연산 => 연산이 불가능 => NaN
       "" , '' => 문자열이다 
       HTML을 통해서 숫자를 가지고 오는 경우 => 문자열 
    */
    
 }
</script>
</head>
<body>

</body>
</html>