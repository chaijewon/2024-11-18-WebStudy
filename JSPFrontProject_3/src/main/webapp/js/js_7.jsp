<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 전역변수 
let emp=[
	     {"ename":"KING","empno":7839,"job":"PRESIDENT","hiredate":"1981-11-17","sal":5000},
	     {"ename":"BLAKE","empno":7698,"job":"MANAGER","hiredate":"1981-05-01","sal":2850},
	     {"ename":"CLARK","empno":7782,"job":"MANAGER","hiredate":"1981-05-09","sal":2450},
	     {"ename":"JONES","empno":7566,"job":"MANAGER","hiredate":"1981-04-01","sal":2975},
	     {"ename":"MARTIN","empno":7654,"job":"SALESMAN","hiredate":"1981-09-10","sal":1250},
	     {"ename":"ALLEN","empno":7499,"job":"SALESMAN","hiredate":"1981-02-11","sal":1600},
	     {"ename":"TURNER","empno":7844,"job":"SALESMAN","hiredate":"1981-08-21","sal":1500},
	     {"ename":"JAMES","empno":7900,"job":"CLERK","hiredate":"1981-12-11","sal":950},
	     {"ename":"WARD","empno":7521,"job":"SALESMAN","hiredate":"1981-02-23","sal":1250},
	     {"ename":"FORD","empno":7902,"job":"ANALYST","hiredate":"1981-12-11","sal":3000},
	     {"ename":"SMITH","empno":7369,"job":"CLERK","hiredate":"1980-12-09","sal":800},
	     {"ename":"SCOTT","empno":7788,"job":"ANALYST","hiredate":"1982-12-22","sal":3000},
	     {"ename":"ADAMS","empno":7876,"job":"CLERK","hiredate":"1983-01-15","sal":1100},
	     {"ename":"MILLER","empno":7934,"job":"CLERK","hiredate":"1982-01-11","sal":1300}]
const sawonList=()=>{
	console.log(emp)
}
const sawonDetail=(empno)=>{
	let sawon=emp.find(sa=>sa.empno===empno)
	console.log(sawon)
	/*for(let e of emp)
	{
		if(e.empno===empno)
		{
			console.log(e)
			break;
		}
	}*/
}
const sawonInsert=()=>{
	emp.push({"ename":"홍길동","empno":8000,"job":"사원","hiredate":"2025-02-25","sal":1000})
}
window.onload=function(){
	sawonInsert()
	sawonList()
	sawonDetail(7788)
}
</script>
</head>
<body>

</body>
</html>