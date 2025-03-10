<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#chatArea{
   height: 450px;
   overflow-y:auto;
   border: 1px solid black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
// 서버연결 
function connection()
{
	// 소켓연결 
	websocket=new WebSocket("ws://localhost:8080/JSPLastProject/site/chat/chat-ws")
	websocket.onopen=onOpen
	websocket.onclose=onClose
	websocket.onmessage=onMessage
}
// 연결처리 => Callback 
function onOpen(event)
{
	 alert("채팅 서버와 연결되었습니다...")
}
function onClose(event)
{
	  alert("채팅 서버와 연결 해제되었습니다...")
}
function onMessage(event)
{
	 let data=event.data // 전송된 데이터 
	 
	 if(data.substring(0,3)==="my:") // oto , makeroom  ==> 100 200 300...
	 // msg:[이름] 메세지
	 {
		 appendMyMessage(data.substring(3))
	 }
	 if(data.substring(0,4)==="you:") // oto , makeroom  ==> 100 200 300...
		 // msg:[이름] 메세지
     {
		 appendYouMessage(data.substring(4))
	 }
	 if(data.substring(0,4)==="msg:") // oto , makeroom  ==> 100 200 300...
		 // msg:[이름] 메세지
     {
		 appendMsgMessage(data.substring(4))
	 }
}
function disConnection()
{
	websocket.close()
}
// 퇴장처리 => Callback
// 메세지 전송 => Callback
function appendMsgMessage(msg)
{
	 $('#recvMsg').append("<font color=red>"+msg+"</font><br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function appendMyMessage(msg)
{
	 $('#recvMsg').append("<font color=blue>"+msg+"</font><br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function appendYouMessage(msg)
{
	 $('#recvMsg').append(msg+"<br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function send()
{
	/*let name=$('#name').val()
	if(name.trim()==="")
	{
		$('#name').focus()
		return
	}*/
	
	let msg=$('#sendMsg').val()
	if(msg.trim()==="")
	{
		$('#sendMsg').focus()
		return 
	}
	
	websocket.send(msg)
	$('#sendMsg').val("")
	$('#sendMsg').focus()
}
$(function(){
	$('#inputBtn').click(function(){
		connection() 
	})
	$('#outputBtn').click(function(){
		disConnection()
	})
	$('#sendBtn').click(function(){
		send()
	})
	$('#sendMsg').keydown(function(key){
		if(key.keyCode===13)//enter @keydown.13 => enter
		{
			send()
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
                        <h2>실시간 채팅</h2>
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
                            <li class="breadcrumb-item"><a href="#">Archive</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Single Post Blog</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
  <section class="single_blog_area section_padding_80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="row no-gutters">
     <table class="table">
      <tr>
        <td class="inline">
         <!-- 이름:<input type=text id="name" size=15 class="input-sm"> -->
         <input type=button value="입장" class="btn-danger btn-sm" id="inputBtn">
         <input type=button value="퇴장" class="btn-success btn-sm" id="outputBtn">
        </td>
      </tr>
      <tr>
       <td>
        <div id="chatArea">
          <div id="recvMsg"></div>
        </div>
       </td>
      </tr>
      <tr>
        <td class="inline">
          <input type=text id="sendMsg" size=70 class="input-sm">
          <input type=button id="sendBtn" value="전송" class="btn-sm btn-primary">
        </td>
      </tr>
     </table>
   </div>
   </main>
  </div>
  </div>
  </div>
  </section>
</body>
</html>