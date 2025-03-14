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
                        <h2>레시피 상세보기</h2>
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
            <div class="row" style="width:900px;margin:0px auto">
              <table class="table">
               <tr>
                <td colspan="3" class="text-center">
                  <img src="${vo.poster }" style="width:100%">
                </td>
               </tr>
               <tr>
                <td colspan="3" class="text-center">
                  <h3>${vo.title }</h3>
                </td>
               </tr>
               <tr>
                <td colspan="3" class="text-center">
                  <span style="color:gray;">${vo.content }</span>
                </td>
               </tr>
               <tr>
                 <td class="text-center"><img src="../recipe/icon/a1.png"></td>
                 <td class="text-center"><img src="../recipe/icon/a2.png"></td>
                 <td class="text-center"><img src="../recipe/icon/a3.png"></td>
               </tr>
               <tr>
                 <td class="text-center">${vo.info1 }</td>
                 <td class="text-center">${vo.info2 }</td>
                 <td class="text-center">${vo.info3 }</td>
               </tr>
              </table>
              <table class="table">
               <tr>
                 <td><h3>재료</h3></td>
               </tr>
               <tr>
                 <td>
                   <ul style="list-style: none">
                    <c:forTokens items="${vo.data }" 
                      delims="," var="d">
                      <li><b>${d }</b></li>
                    </c:forTokens>
                   </ul>
                 </td>
               </tr>
              </table>
              <table class="table">
               <tr>
                 <td><h3>조리방법</h3></td>
               </tr>
               <tr>
                 <td>
                   <c:forEach var="make" items="${mList }" varStatus="s">
                     <table class="table">
                      <tr>
                       <td width=80%>${make}</td>
                       <td width=20%>
                        <img src="${iList[s.index]}" style="width:250px;height: 120px">
                       </td>
                      </tr>
                     </table>
                   </c:forEach>
                 </td>
               </tr>
              </table>
              <table class="table">
               <tr>
                 <td colspan="2"><h3>레시피 작성자</h3></td>
               </tr>
               <tr>
                 <td width=20% class="text-center" rowspan="2">
                   <img src="${vo.chef_poster }" style="width:100px;height: 100px" class="rounded-circle">
                 </td>
                 <td width=80%>
                   <h3>${vo.chef }</h3>
                 </td>
               </tr>
               <tr>
                 <td width=80%>
                   ${vo.chef_profile }
                 </td>
               </tr>
              </table>
            </div>
        </div>
    </section>
    <!-- ****** Archive Area End ****** -->

</body>
</html>