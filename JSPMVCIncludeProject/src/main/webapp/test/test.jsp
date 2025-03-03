<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>이력서</title>
	<style>
		h1{
			text-align: center;
			font-size: 60px;
			border-top: 3px solid rgb(0, 102, 255);
			border-bottom: 3px solid rgb(0, 102, 255);
		
		}
		table{
			width: 100%;
            border: 1px solid black;
            border-collapse: collapse;
			text-align: center;
        }
		
		td,th{
			width: 20%;
			border: 1px solid black;
		
		}
		tr{
			height: 30;
		}
		
		
	</style>
</head>
<!--colspan: 셀 너비 지정 rowspan: 셀 높이 지정-->

<body>
    <h1> 이 력 서 </h1>
	<p>1.기초자료</p>
	<table align="center"  border="1" cellspacing="0">
		<tr align="center"  bgcolor="#fff">
			<td  rowspan="6" >사 진</td>

		<!--성명 한문-->
			<td  bgcolor="#e3fcff">성 명</td>
			<td colspan="1"></td>
			<td  bgcolor="#e3fcff">한 문</td>
			<td colspan="5"></td>
		</tr>

		<!--주민등록번호-->
		<tr align="center"   bgcolor="#ffffff">
			<td rowspan="1" bgcolor="#e3fcff">주민등록번호</td>
			<td colspan="5"></td>
		</tr>

		<!--이메일-->
		<tr align="center"  bgcolor="#ffffff">
			<td bgcolor="#e3fcff">E-mail</td>
			<td colspan="5"></td>
		</tr>
		<!--전화번호, 휴대폰-->
		<tr align="center"  bgcolor="#ffffff">
			<td bgcolor="#e3fcff">전화번호</td>
			<td colspan="1"></td>
			<td bgcolor="#e3fcff">휴대폰</td>
			<td colspan="4">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td>
		</tr>

		<!--우편번호, 비상연락처-->
		<tr align="center"  bgcolor="#ffffff">
			<td bgcolor="#e3fcff">우편번호</td>
			<td colspan="1"></td>	
			<td bgcolor="#e3fcff">비상연락처</td>
			<td colspan="5">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td>
		</tr>
		<!--주소-->
		<tr align="center"  bgcolor="#ffffff">
			<td bgcolor="#e3fcff">주소</td>
			<td colspan="5"></td>
		</tr>	
	</table>

<p>2.학력사항</p>
<table>
	<thead>
		<th bgcolor="#e3fcff">기간</th>
		<th bgcolor="#e3fcff">상세내용</th>
		<th bgcolor="#e3fcff">비고</th>
	</thead>
	<tbody>
		<tr>
			<td>&nbsp</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>&nbsp</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>&nbsp</td>
		</tr>
	</tbody>
</table>
<p>3. 경력사항</p>
<table>
	<thead>
		<th bgcolor="#e3fcff">기간</th>
		<th bgcolor="#e3fcff">관련</th>
	</thead>
	<tbody>
		<tr>
			<td>&nbsp</td>
			<td>&nbsp</td>
		
		</tr>
		<tr>
			<td>&nbsp</td>
			<td>&nbsp</td>
		
		</tr>
		<tr>
			<td>&nbsp</td>
			<td>&nbsp</td>
			
		</tr>
		<tr>
			<td>&nbsp</td>
			<td>&nbsp</td>
		
		</tr>
	</tbody>
</table>
<p>4. 개인능력 및 장단점</p>
<table>
	<tbody>
		<tr height="30" align="center">
			<td rowspan="2" bgcolor="#e3fcff">자격 및 포상</td>
			<td colspan="3"></td>
			<td colspan="1"></td>
			
		</tr>
		
		<tr height="30"bgcolor="#fff"  align="center"> 
            <td colspan="3"></td>
            <td colspan="3"></td>
			
        </tr>
		<tr height="30"bgcolor="#fff"  align="center"> 
            <td rowspan="2" bgcolor="#e3fcff">컴퓨터능력</td>
			<td colspan="2"></td>
            <td bgcolor="#e3fcff">상/중/하</td>
        </tr>
		<tr height="30" bgcolor="#fff"  align="center"> 
			<td colspan="2"></td>
            <td bgcolor="#e3fcff">상/중/하</td>
			<td></td>
        </tr>
		<tr height="30"bgcolor="#fff"  align="center"> 
			<td rowspan="2" bgcolor="#e3fcff">취미</td>	
			<td colspan="2"></td>
            <td bgcolor="#e3fcff">특기</td>
			<td></td>
        </tr>
	</tbody>
</table>
<p align="center" > 위의 사실이 틀림이 없음을 서약합니다.</span><br><br>
<p2> 작성일 월 일</p2><br><br>
<p2> 작성자 (인) </p2>

</body>
</div>
</html>