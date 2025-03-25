<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/reserve_food_info.do',
		success:function(result)
		{
			$('#food_list').html(result)
		}
	})
})
</script>
</head>
<body>
<!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>예약하기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">food-list Page</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row">
              <table class="table">
                <tr>
                  <td width="30%" height="600">
                    <table class="table">
                     <tr><td class="table-danger"><h4 class="text-center">맛집 정보</h4></td></tr>
                     <tr>
                       <td>
                        <div id="food_list" style="height:600px;overflow-y:scroll "></div>
                       </td>
                     </tr>
                    </table>
                  </td>
                  <td width="40%" height="600">
                    <table class="table">
                     <tr><td class="table-info"><h4 class="text-center">예약일 정보</h4></td></tr>
                     <tr>
                       <td id="food_rdays"></td>
                     </tr>
                    </table>
                  </td>
                  <td width="30%"  height="850" rowspan="2">
                    <table class="table">
                     <tr><td class="table-success" colspan="2"><h4 class="text-center">예약 정보</h4></td></tr>
                     <tr>
                       <td class="text-center" colspan="2">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5R6QRNst_kdWB8R08hMQMSDNVflcIzrZwQQ&s" style="width:250px;height: 180px" id="food_poster">
                       </td>
                     </tr>
                     <tr>
                       <td width=30% style="color:gray">업체명</td>
                       <td width=70%><span id="food_name"></span></td>
                     </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td width="30%"  height="250">
                    <table class="table">
                     <tr><td class="table-primary"><h4 class="text-center">시간 정보</h4></td></tr>
                    </table>
                  </td>
                  <td width="40%"  height="250">
                    <table class="table">
                     <tr><td class="table-info"><h4 class="text-center">인원 정보</h4></td></tr>
                    </table>
                  </td>
                </tr>
              </table>
            </div>
         </div>
    </section>
</body>
</html>