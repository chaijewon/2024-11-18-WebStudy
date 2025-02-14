package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class MainModel {
   public void mainPage(HttpServletRequest request)
   {
	   String mode=request.getParameter("mode");
	   if(mode==null)
		   mode="1";
	   String jsp="";
	   switch(Integer.parseInt(mode))
	   {
	   case 1:
		   jsp="home.jsp";
		   break;
	   }
	   request.setAttribute("main_jsp", jsp);
   }
}
