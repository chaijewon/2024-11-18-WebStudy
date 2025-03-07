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
                        <h2>쉐프 목록</h2>
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
                <td>
                  <%--
                     <%= request.getAttribute("list")%>
                   --%>
                  <c:forEach var="vo" items="${list }">
                    <table class="table">
                     <tr>
                       <td width="25%" rowspan="2" class="text-center">
                        <div class="about-me-widget-thumb">
                           <img src="${vo.poster }" style="width: 100px;height: 100px">
                        </div>
                       </td>
                       <td colspan="4">
                        <h4 style="color: orange;">${vo.chef }</h4>
                       </td>
                     </tr>
                     <tr>
                       <td class="text-center">
                        <img src="../recipe/icon/m1.png">&nbsp;${vo.mem_cont1 }
                       </td>
                       <td class="text-center">
                        <img src="../recipe/icon/m2.png">&nbsp;${vo.mem_cont3 }
                       </td>
                       <td class="text-center">
                        <img src="../recipe/icon/m3.png">&nbsp;${vo.mem_cont7 }
                       </td>
                       <td class="text-center">
                        <img src="../recipe/icon/m4.png">&nbsp;${vo.mem_cont2 }
                       </td>
                     </tr>
                    </table>
                  </c:forEach>
                </td>
               </tr>
              </table>
              <table class="table">
               <tr>
                 <td class="text-center">
                  <a href="../recipe/chef_list.do?page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-danger">이전</a>
                     ${curpage } page / ${totalpage } pages
                  <a href="../recipe/chef_list.do?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm btn-danger">다음</a>
                 </td>
               </tr>
              </table>
            </div>
        </div>
    </section>
    <!-- ****** Archive Area End ****** -->

</body>
</html>