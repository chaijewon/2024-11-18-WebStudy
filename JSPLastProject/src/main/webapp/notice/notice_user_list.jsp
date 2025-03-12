<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
                <th width=10% class="text-center">번호</th>
                <th width=45% class="text-center">제목</th>
                <th width=15% class="text-center">이름</th>
                <th width=20% class="text-center">작성일</th>
                <th width=10% class="text-center">조회수</th>
              </tr>
                
              <c:set var="count" value="${count }"/>
              <c:forEach var="vo" items="${list }">
                <tr>
                 <td width=10% class="text-center">
                 
                 ${count }</td>
                 <td width=45%><a href="../notice/notice_user_detail.do?no=${vo.no }">[${vo.types}]&nbsp;${vo.subject }</a></td>
                 <td width=15% class="text-center">${vo.name }</td>
                 <td width=20% class="text-center">${vo.dbday }</td>
                 <td width=10% class="text-center">${vo.hit }</td>
               </tr>
               <c:set var="count" value="${count-1 }"/>
              </c:forEach>
             </table>
             <table class="table">
               <tr>
                <td class="text-left">
                 <input type="checkbox" name=fs value="N">이름
                 <input type="checkbox" name=fs value="S">제목
                 <input type="checkbox" name=fs value="C">내용
                 <input type=text name=ss size=15 class="input-sm">
                 <input type=button value="검색" class="btn-primary btn-sm">
                </td>
                <td class="text-right">
                 <a href="../notice/notice_user_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-info btn-sm">이전</a>
                  ${curpage } page / ${totalpage } pages
                 <a href="../notice/notice_user_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-success btn-sm">다음</a>
                </td>
               </tr>
             </table>
            </div>
        </div>
    </section>
</body>
</html>