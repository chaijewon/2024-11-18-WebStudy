<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   String
   StringBuffer
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:hover{
  cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#ss').val('마포')
	commons(1)
	
	$('#findBtn').click(function(){
		commons(1)
	})
	$('#ss').keydown(function(e){
		if(e.keyCode==13)
		{
			commons(1)
		}
	})
})
function commons(page)
{
	let fd=$('#fd').val()
	let ss=$('#ss').val()
	$.ajax({
		type:'post',
		url:'../food/food_find_ajax.do',
		data:{"fd":fd,"ss":ss,"page":page},
		success:function(result){
			//$('#view').text(result)
		  	let json=JSON.parse(result)
		  	
		  	jsonView(json)
		}
	})
}
function prev(page)
{
	commons(page)
}
function next(page)
{
	commons(page)
}
function pageChange(page)
{
	commons(page)
}
function jsonView(json)
{
	// 이미지 
	let html=''
	json.map(function(food){
		html+='<div class="col-12 col-md-6 col-lg-4">'
		+'<div class="single-post wow fadeInUp" data-wow-delay="0.1s">'
        +'<div class="post-thumb">'
        +'<a href="../food/food_detail_before.do?fno='+food.fno+'">'
        +'<img src="https://www.menupan.com'+food.poster+'" alt="">'
        +'</a>'
        +'</div>'
        +'<div class="post-content">'
        +'<div class="post-meta d-flex">'
        +'<div class="post-author-date-area d-flex">'
        +'<div class="post-author">'
        +'<a href="#">'+food.type+'</a>'
        +'</div>'
        +'<div class="post-date">'
        +'<a href="#">'+food.score+'</a>'
        +'</div>'
        +'</div>'
        +'<div class="post-comment-share-area d-flex">'
        +'<div class="post-favourite">'
        +'<a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>'+food.likecount+'</a>'
                    +'</div>'
                    +'<div class="post-comments">'
                        +'<a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>'+food.replycount+'</a>'
                    +'</div>'
                    +'<div class="post-share">'
                        +'<a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>'
                    +'</div>'
                +'</div>'
            +'</div>'
            +'<a href="../food/food_detail_before.do?fno='+food.fno+'">'
                +'<h4 class="post-headline">'+food.name+'</h4>'
            +'</a>'
            +'</div>'
            +'</div>'
            +'</div>'
	})
	
	html+='<div class="col-12">'
	html+='<div class="pagination-area d-sm-flex mt-15">'
	html+='<nav aria-label="#">'
	html+='<ul class="pagination">'
      if(json[0].startPage>1)
      {
       html+='<li class="page-item">'
       html+='<a class="page-link" onclick="prev('+(json[0].startPage-1)+')">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>'
       html+='</li>'
      }
            
      for(let i=json[0].startPage;i<=json[0].endPage;i++)
      {
    	  if(json[0].curpage===i)
    	  {
    		  html+='<li class="page-item active"><a class="page-link" onclick="pageChange('+i+')">'+i+'</a></li>'
    	  }
    	  else
    	  {
    		  html+='<li class="page-item"><a class="page-link" onclick="pageChange('+i+')">'+i+'</a></li>'
    	  }
    	  
      }
            
            if(json[0].endPage<json[0].totalpage)
            {
            	html+='<li class="page-item">'
            	html+='<a class="page-link" onclick="next('+(json[0].endPage+1)+')">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>'
            	html+='</li>'
            }
            
            html+='</ul>'
            html+='</nav>'
            html+='<div class="page-status">'
            html+='<p>Page '+json[0].curpage+' of '+json[0].totalpage+' results</p>'
            html+='</div>'
            html+='</div>'
            html+='</div>'

	$('#view').html(html)
	// 페이지 
}
</script>
</head>
<body>
<!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>맛집 검색</h2>
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
                            <li class="breadcrumb-item">
                             <select id="fd" class="input-sm">
                               <option value="name">업체명</option>
                               
              
                               <option value="type">음식종류</option>
                               <option value="theme">테마</option>
                               <option value="address" selected>주소</option>
                             </select>
                             <input type=text size=15 id="ss" class="input-sm">
                             <input type=button value="검색" class="btn-sm btn-primary" id="findBtn">
                             
                             
                            </li>
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
            <div class="row" id="view">
               
                
              
            </div> 
        </div>
    </section>
    <!-- ****** Archive Area End ****** -->

</body>
</html>