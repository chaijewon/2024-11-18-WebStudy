package com.sist.manager;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.HandshakeResponse;
import jakarta.websocket.server.HandshakeRequest;
import jakarta.websocket.server.ServerEndpointConfig;
import jakarta.websocket.server.ServerEndpointConfig.Configurator;
// HttpSession => 연결 
public class WebSocketSessionConfigurator extends Configurator{

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession session=(HttpSession)request.getHttpSession();
		if(session!=null)
			sec.getUserProperties().put(HttpSession.class.getName(), session);
		// properties에 Session을 사용할 수 있게 저장 
	}
   
}
