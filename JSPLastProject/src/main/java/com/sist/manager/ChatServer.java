package com.sist.manager;

import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.*;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.websocket.EndpointConfig;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;

@ServerEndpoint(value="/site/chat/chat-ws",configurator = WebSocketSessionConfigurator.class)
public class ChatServer {
   // 접속자 저장 
   private static Map<Session,ChatVO> users=
		   Collections.synchronizedMap(new HashMap<Session, ChatVO>());
   // 접속시 처리 
   @OnOpen
   public void onOpen(Session session,EndpointConfig config) throws Exception
   {
	   ChatVO vo=new ChatVO();
	   
	   //로그인시에 세션에 저장된 값을 읽어 온다 
	   HttpSession hs=(HttpSession)config.getUserProperties().get(HttpSession.class.getName());
	   vo.setId((String)hs.getAttribute("id"));
	   vo.setName((String)hs.getAttribute("name"));
	   vo.setSession(session);
	   
	   users.put(session, vo); // 사용자 정보 저장 
	   
	   // => 입장 메세지 전송 
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next(); // 접속자 한명씩 읽어 온다 
		   if(ss.getId()!=session.getId()) // 본인이 아닌 경우 
		   {
			     // 이미 접속이 되어 있는 사람에게 전송 
			   ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getName()+"님이 입장하셨습니다");
		   }
	   }
	   // 서버확인
	   System.out.println("클라이언트 접속:"+vo.getId()+","
			   +vo.getName()+","+vo.getSession());
	   
   }
   // 메세지 전송시 처리 
   @OnMessage
   public void onMessage(String message,Session session) throws Exception
   {
	   System.out.println("수신된 메세지:"+message+"===> 보낸사람:"+session.getId());
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   
		   if(session.getId()==ss.getId())//본인
		   {
			   ss.getBasicRemote().sendText("my:["+vo.getName()+"]"+message);
		   }
		   else // 상대방 
		   {
			   ss.getBasicRemote().sendText("you:["+vo.getName()+"]"+message);
		   }
	   }
   }
   // 접속 해제 Session session= 접속자에 대한 구분자 => 접속자마다 번호가 부여
   @OnClose
   public void onClose(Session session) throws Exception
   {
	   Iterator<Session> it=users.keySet().iterator();
	   //전체 저장된 데이터를 모아서 처리 Collection은 전체 Iterator를 가지고 있다 
	   while(it.hasNext())
	   {
		   Session ss=it.next(); // 저장되어 있는 모든 사용자를 한명씩 읽어 온다 
		   // Map => key : session , value : ChatVO
		   ChatVO vo=users.get(session); 
		   if(ss.getId()!=session.getId())
		   {
			   ss.getBasicRemote().sendText("msg:[알림 ☞]"+vo.getName()+"님이 퇴장하셨습니다");
		   }
	   }
	   System.out.println("클라이언트 퇴장:"+users.get(session).getName());
	   users.remove(session);
   }
   @OnError
   public void onError(Session session,Throwable ex)
   {
	   ex.printStackTrace();
   }
}
