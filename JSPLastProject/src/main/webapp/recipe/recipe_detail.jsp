<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a.updates{
  cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bClick=false
$(function(){
	$('.updates').click(function(){
		let rno=$(this).attr("data-rno")
		$('.ups').hide()
		$(".updates").text("수정")
		if(bClick===false)
		{
			$(this).text("취소")
			$('#up'+rno).show()
			bClick=true
		}
		else
		{
			$(this).text("수정")
			$('#up'+rno).hide()
			bClick=false
		}
	})
})
</script>
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
              
              <!-- ****** Archive Area End ****** -->
                    <div class="comment_area section_padding_50 clearfix">
                                <h4 class="mb-30">댓글(${count })</h4>

                                <ol>
                                   <c:forEach var="rvo" items="${rList }">
                                    <li class="single_comment_area">
                                        <div class="comment-wrapper d-flex">
                                            <!-- Comment Meta -->
                                            <div class="comment-author">
                                                <c:if test="${rvo.sex=='남자' }">
                                                 <img src="../img/images/man.png" alt="">
                                                </c:if>
                                                <c:if test="${rvo.sex=='여자' }">
                                                 <img src="../img/images/woman.png" alt="">
                                                </c:if>
                                            </div>
                                            <!-- Comment Content -->
                                            <div class="comment-content">
                                                <span class="comment-date text-muted">${rvo.dbday}</span>
                                                <h5>${rvo.name }</h5>
                                                <p>${rvo.msg }</p>
                                                <c:if test="${sessionScope.id!=null }">
                                                   <a href="#" class="active">좋아요</a>
                                                   <a href="#" class="active">댓글</a>
                                                   <c:if test="${sessionScope.id==rvo.id }">
                                                     <a class="active updates" data-rno="${rvo.cno }">수정</a>
                                                     <a href="../reply/reply_delete.do?cno=${rvo.cno }&rno=${rvo.rno}&type=1" class="active">삭제</a>
                                                   </c:if>
                                                </c:if>
                                                
                                                <div class="comment-form ups" style="display:none" id="up${rvo.cno }">
                                  
				                                    <form action="../reply/reply_update.do" method="post">
				                                        
				                                        <div class="form-group">
				                                            <textarea name="msg" id="msg" cols="50" rows="3" placeholder="Message" style="float: left" required>${rvo.msg }</textarea>
				                                            <input type=hidden name="type" value="2">
				                                            <input type=hidden name="rno" value="${vo.no }">
				                                            <input type=hidden name="cno" value="${rvo.cno }">
				                                            <button type="submit" class="btn btn-primary" style="width:100px;height: 85px;float: left">댓글수정</button>
				                                        </div>
				                                        
				                                    </form>
				                                </div>
                                                
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ol>
                            </div>

                            <!-- Leave A Comment -->
                            <c:if test="${sessionScope.id!=null }">
                            <div class="leave-comment-area section_padding_50 clearfix">
                                <div class="comment-form">
                                  
                                    <form action="../reply/reply_insert.do" method="post">
                                        
                                        <div class="form-group">
                                            <textarea name="msg" id="msg" cols="70" rows="4" placeholder="Message" style="float: left" required></textarea>
                                            <input type=hidden name="type" value="2">
                                            <input type=hidden name="rno" value="${vo.no }">
                                            <button type="submit" class="btn btn-primary" style="width:100px;height: 95px;float: left">댓글쓰기</button>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                          </c:if>
              
            </div>
        
           
        
        </div>
        
        
        
    </section>
    

                        
</body>
</html>