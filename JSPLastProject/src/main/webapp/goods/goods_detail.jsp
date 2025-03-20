<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.a{
	    white-space:nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	#image{
		width: 100%;
		height: 350px;
		border-radius: 20px;
	}
	#title{
		font-size: 25px;
		font-weight: bold;
	}
	#sub{
		color:grey;
		text-align: center;
	}
	#percent{
		font-size: 25px; /*h3*/
		color: pink;
		font-weight: bold;
	}
	#price{
		font-size: 25px; /*h3*/
		font-weight: bold;
	}
	#psub{
		font-size: 12px;
		color: #999;
	}
	#star{
		color: orange;
		font-weight: bold;
	}
	#blod{
		font-weight: bold;
	}
	#count{
		color:gray
	}
	#sel{
		width: 100%;
		height: 40px;
	}
	#cart,#buy,#list{
		width: 150px;
		height: 70px;
		border: 2px green solid;
		font-size: 20px;
		font-weight: bold;
		border-radius: 10px;
		box-shadow: 5px 5px 5px #A9A9A9;
	}
	#cart:hover , #buy:hover{
		cursor: pointer;
	}
	#cart{
		
		background-color: white;
		color:green;
	}
	#buy{
		background-color: green;
		color:white;
	}
	#list{
		background-color: blue;
		color:white;
	}
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let sel=0;
var IMP = window.IMP; 
IMP.init("imp68206770"); 
function requestPay(json,name,price) {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: name,
        amount: price,         // 숫자 타입
        buyer_email: json.email,
        buyer_name: json.name,
        buyer_tel:json.phone,
        buyer_addr: json.address,
        buyer_postcode: json.post
    }, function (rsp) { // callback
    	location.href='http://localhost/JSPLastProject/mypage/mypage_buy_list.do' 
    });
}
$(function(){
	
	$('#sel').change(function(){
		let account=$('#sel').val()
		if(account==='수량선택')
		{
			alert("수량을 선택하세요")
			return
		}
		let price=$('#sel').attr("data-price")
		let total=Number(price)*Number(account)
		$('#total').text(total.toLocaleString()+"원")
		$('#account').val(account)
        sel=1		
	})
	$('#cart').click(function(){
		if(sel===0)
		{
		  alert("수량을 선택하세요")
		  return;
		}
		$('#frm').submit()
	})
	$('#buy').click(function(){
		if(sel===0)
		{
			alert("수량 선택하세요")
			return
		}
		let gno=$('#gno').val();
		let price=$('#price2').val();
		let account=$('#account').val();
		let name=$('#title').text()
		$.ajax({
			type:'post',
			url:'../cart/buy_insert.do',
			data:{"gno":gno,"price":price,"account":account},
			success:function(result)
			{
				alert(result)
				let json=JSON.parse(result)
				requestPay(json,name,price)
			}
		})
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
                        <h2>상품 상세보기</h2>
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
		   <td width="30%" align="center" rowspan="9">
			   <img src="${vo.goods_poster}"
			     id="image" 
			   >
		   </td>
		   <td width="70%" class="tdcenter">
			   <span id="title">
				  ${vo.goods_name}
			   </span>
		   </td>
	   </tr>
	   <tr>
		   <td width="70%">
			   <span id="sub">${vo.goods_sub}</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="70%">
			   <span id="percent">${vo.goods_discount}%</span>&nbsp;
			   <span id="price" data-value="${vo.price}">${ vo.goods_price}</span>
			   <!--  데이터를 저장할때 속성은 사용자 정의로 가능하다 -->
			   <p>
				   <del id="psub">599,000원</del>
			   </p>
		   </td>
	   </tr>
	   <tr>
		   <td width="70%">
			   <span id="star">★★★★★</span>
			   <span id="blod">4.8</span>
			   <span id="count">(5)</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="70%">
			   <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png" width="20" height="20">
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <span id="del">${vo.goods_delivery}</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="70%">
			   <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_point.png" width="20" height="20">
			   적립&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <span id="del">1,595원</span> 적립 (모든 회원 구매액의 0.5% 적립)</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="70%">
			   <select id="sel" data-price="${vo.price }">
				   <option>수량선택</option>
				   <c:forEach var="i" begin="1" end="10">
				    <option>${i }</option>
				   </c:forEach>
			   </select>
		   </td>
	   </tr>
	   <tr>
	     <td width="70%" class="text-right">
	       총금액:<span id="total">${vo.price}원</span>
	     </td>
	   </tr>
	   <tr>
		   <td width="70%">
		     <c:if test="${sessionScope.id!=null and sessionScope.admin=='n'}">
		      <form method="post" action="../cart/cart_insert.do" style="float: left" id="frm">
		        <input type="hidden" name="gno" value="${vo.no}" id="gno">
		        <input type="hidden" name="price" value="${vo.price}" id="price2">
		        <input type="hidden" name="account" value="" id="account">
		        <input type="button" value="장바구니" id="cart" style="float: left">
		      </form>
			   <input type="button" value="바로구매" id="buy" style="float: left">
			 </c:if>
			   <input type="button" value="목록" onclick="javascript:history.back()" id="list">
		   </td>
	   </tr>
   </table>
            </div>
        </div>
    </section>
</body>
</html>