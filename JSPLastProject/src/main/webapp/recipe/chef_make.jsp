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
<!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>&laquo;${chef }&raquo; 레시피</h2>
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

                <!-- Single Post -->
                <c:forEach var="vo" items="${list }">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                          <a href="../recipe/recipe_detail.do?no=${vo.no}">
                            <img src="${vo.poster }" style="width:350px;height: 250px ">
                          </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">${vo.chef }</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">${vo.hit }</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>${vo.likecount }</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>${vo.replycount }</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../recipe/recipe_detail.do?no=${vo.no}">
                                <h4 class="post-headline">${vo.title }</h4>
                            </a>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                 <li class="page-item">
                                    <a class="page-link" href="../chef_make.do?no=${no}&page=${startPage-1 }">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                                
                                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                 <li class="page-item ${i==curpage?'active':'' }"><a class="page-link" href="../recipe/chef_make.do?no=${no}&page=${i }">${i }</a></li>
                                </c:forEach>
                                
                                <c:if test="${endPage<totalpage }">
                                 <li class="page-item">
                                    <a class="page-link" href="../recipe/chef_make.do?no=${no}&page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curpage } of ${totalpage } results</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ****** Archive Area End ****** -->

</body>
</html>