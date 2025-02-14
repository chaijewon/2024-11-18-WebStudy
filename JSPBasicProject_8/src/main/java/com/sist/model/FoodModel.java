package com.sist.model;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
public class FoodModel {
   public void foodListData(HttpServletRequest request)
   {
	   FoodDAO dao=new FoodDAO();
	   String strPage=request.getParameter("page");
	    if(strPage==null)
	    	strPage="1";
	    int curpage=Integer.parseInt(strPage);
	    List<FoodVO> list=dao.foodListData(curpage);
	    
	    int totalpage=dao.foodTotalPage();
	    
	    final int BLOCK=10;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	    /*
	         1 2 3 .... 10
	         -          --
	         startPage  endPage 
	         
	         11 12 ...... 20
	    */
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	    if(endPage>totalpage)
	    	endPage=totalpage;
	    // JSP에서 출력할 데이터 전송 
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("main_jsp", "home.jsp");
   }
}
