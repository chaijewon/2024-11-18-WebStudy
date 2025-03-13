<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>공지사항</h2>
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
            <div class="row" style="width:800px;margin:0px auto">
              <table class="table">
               <tr>
                <th class="text-center table-success" width=20%>공지</th>
                <td class="text-center" width=30%>${vo.types }</td>
                <th class="text-center table-success" width=20%>작성일</th>
                <td class="text-center" width=30%>${vo.dbday }</td>
               </tr>
               <tr>
                <th class="text-center table-success" width=20%>이름</th>
                <td class="text-center" width=30%>${vo.name }</td>
                <th class="text-center table-success" width=20%>조회수</th>
                <td class="text-center" width=30%>${vo.hit }</td>
               </tr>
               <tr>
                <th class="text-center table-success" width=20%>제목</th>
                <td colspan="3">${vo.subject }</td>
               </tr>
               <tr>
                <td colspan="4" class="text-left"
                  valign="top" height="200"><pre style="white-space:pre-wrap;border:none;background-color: white">${vo.content }</pre></td>
               </tr>
               <tr>
                <td colspan="4" class="text-right">
                 <a href="../notice/notice_user_list.do" class="btn btn-warning btn-xs">목록</a>
                </td>
               </tr>
               
              </table>
            </div>
         </div>
    </section>
</body>
</html>