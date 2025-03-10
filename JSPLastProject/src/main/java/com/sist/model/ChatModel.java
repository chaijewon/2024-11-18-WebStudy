package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ChatModel {
   @RequestMapping("chat/chat.do")
   public String chat_chat(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../site/chat/chat.jsp");
	   return "../main/main.jsp";
   }
}
