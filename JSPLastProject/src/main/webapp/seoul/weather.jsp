<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/2020/swiper.min.css?bust=20221228_01" class="css">
<link rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/2019/animate.css?bust=20221228_01"/>
<link rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/2019/content.css?bust=20230712_01"/>
<link rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/2019/layout.css?bust=20221228_01"/>
<link rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/content.css?dt=20221228_01"/>
<link rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/seoul_stay.css?bust=20221228_01"/>
<link type="text/css" rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/malay/common.css">
<link type="text/css" rel="stylesheet" href="https://korean.visitseoul.net//resources/theme/style/malay/sub.css">
<style type="text/css">
.tbcon01,.tbcon02,.tbcon03{
   color:black;
}
</style>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>오늘의 날씨</h2>
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
    <div class="container">
        <div class="row">
                <div class="col-12">    
                 ${html }
                </div>
        </div>
          
      </div>
    <%-- <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" style="width: 960px;margin: 0px auto">
            ${html }
            </div>
        </div>
    </section> --%>
</body>
</html>