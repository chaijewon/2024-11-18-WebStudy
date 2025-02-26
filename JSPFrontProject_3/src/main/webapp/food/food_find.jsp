<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid{
 margin-top: 50px;
}
.row{
  margin: opx auto;
  width: 100%;
}
p{
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
img:hover,a:hover {
   cursor: pointer
}

</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="food.js"></script>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
    <input type=text id="fd" size=20 class="input-sm">
    <input type=button id="btn" value="검색" class="btn-sm btn-success"
      onclick="foodFind()"
    >
    </div>
    <div class="row" style="margin-top: 20px">
      <div class="col-sm-6" id="poster">
        
      </div>
      <div class="col-sm-6" id="detail" style="display:none">
        <table class="table">
          <tr>
           <td width=30% class="text-center" rowspan="8" id="poster1">
             
           </td>
           <td colspan="2">
            <h3><span id="title"></span>&nbsp<span id="score" style="color:orange"></span></h3>
           </td>
          </tr>
          <tr>
            <td width=15% style="color:gray">음식종류</td>
            <td width=55% id="type"></td>
          </tr>
          <tr>
            <td width=15% style="color:gray">주소</td>
            <td width=55% id="address"></td>
          </tr>
          <tr>
            <td width=15% style="color:gray">전화</td>
            <td width=55% id="phone"></td>
          </tr>
          <tr>
            <td width=15% style="color:gray">가격대</td>
            <td width=55% id="price"></td>
          </tr>
          <tr>
            <td width=15% style="color:gray">주차</td>
            <td width=55% id="parking"></td>
          </tr>
          <tr>
            <td width=15% style="color:gray">영업시간</td>
            <td width=55% id="time"></td>
          </tr>
          <tr>
            <td width=15% style="color:gray">테마</td>
            <td width=55% id="theme"></td>
          </tr>
        </table>
        <table class="table">
          <tr>
            <td id="content"></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="row" style="margin-top: 10px">
      <div class="text-center" id="pages">
        
      </div>
    </div>
  </div>
</body>
</html>