<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<%
    // 사용자가 보내준 값을 받는다 
    String fno=request.getParameter("fno");
    FoodVO vo=dao.foodDetailData(Integer.parseInt(fno),1);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72fa81817487692b6dc093004af97650&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
  margin: opx auto;
  width: 960px;
}
</style>
</head>
<body>
 <div class="container">
  <div class="row">
    <table class="table">
      <tr>
        <td width=30% class="text-center" rowspan="8">
         <img src="<%=vo.getPoster() %>" style="width: 300px;height: 350px">
        </td>
        <td colspan="2">
          <h3><%=vo.getName() %>&nbsp;<span style="color:orange;"><%=vo.getScore() %></span></h3>
        </td>
      </tr>
        
      <tr>
        <th width=20% style="color:gray">음식종류</th>
        <td width=50%><%=vo.getType() %></td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">주소</th>
        <td width=50%><%=vo.getAddress() %></td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">전화</th>
        <td width=50%><%=vo.getPhone() %></td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">가격대</th>
        <td width=50%><%=vo.getPrice() %></td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">영업시간</th>
        <td width=50%><%=vo.getTime() %></td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">주차</th>
        <td width=50%><%=vo.getParking() %></td>
      </tr>
      
      <tr>
        <th width=20% style="color:gray">테마</th>
        <td width=50%><%=vo.getTheme() %></td>
      </tr>
    </table>
    <table class="table">
     <tr>
      <td><%=vo.getContent() %></td>
     </tr>
     <tr>
      <td class="text-right">
        <a href="list.jsp" class="btn btn-xs btn-success">목록</a>
      </td>
     </tr>
    </table>
  </div>
  <div style="height: 10px"></div>
  <div class="row">
   <div id="map" style="width:100%;height:350px;"></div>
  </div>
 <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=vo.getAddress()%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=vo.getName()%></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>