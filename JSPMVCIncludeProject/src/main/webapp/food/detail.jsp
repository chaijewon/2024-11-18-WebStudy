<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="map.css">
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Lorem</a></li>
      <li><a href="#">Ipsum</a></li>
      <li><a href="#">Dolor</a></li>
    </ul>
    </div>
</div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <div class="content"> 
      <div class="flexslider carousel basiccarousel btmspace-80">
       <ul class="slides">
        <c:forTokens var="image" items="${vo.images }" delims=",">
         <li>
          <figure>
           <img class="radius-10 btmspace-10" src="https://www.menupan.com${image }" style="width: 320px;height: 185px">
          </figure>
         </li>
        </c:forTokens>
       </ul>
      </div>
      <table class="table">
       <tr>
         <td width=30% class="text-center" rowspan="8">
           <img src="https://www.menupan.com${vo.poster }" style="width: 100%">
         </td>
         <td colspan="2">
           <h3>${vo.name }&nbsp;<span style="color: orange;">${vo.score }</span></h3>
         </td>
       </tr>
       <tr>
         <th width=20%>음식종류</th>
         <td width=50%>${vo.type }</td>
       </tr>
       <tr>
         <th width=20%>주소</th>
         <td width=50%>${vo.address }</td>
       </tr>
       <tr>
         <th width=20%>전화</th>
         <td width=50%>${vo.phone }</td>
       </tr>
       <tr>
         <th width=20%>가격대</th>
         <td width=50%>${vo.price }</td>
       </tr>
       <tr>
         <th width=20%>주차</th>
         <td width=50%>${vo.parking }</td>
       </tr>
       <tr>
         <th width=20%>영업시간</th>
         <td width=50%>${vo.time }</td>
       </tr>
       <tr>
         <th width=20%>테마</th>
         <td width=50%>${vo.theme }</td>
       </tr>
      </table>
      <table class="table">
        <tr>
         <td>${vo.content }</td>
        </tr>
        <tr>
         <td class="text-right">
          <a href="../food/list.do" 
             class="btn btn-sm btn-primary">목록</a>
         </td>
        </tr>
      </table>
      <!-- 지도  -->
      <div id="comments">
        <h2>Comments</h2>
        <ul>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
        </ul>
        <h2>Write A Comment</h2>
        <form action="#" method="post">
          <div class="block clear">
            <textarea name="comment" id="comment" cols="25" rows="5"></textarea>
          </div>
        </form>
      </div>
     </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>