package com.sist.model;
// 사용자 요청시 처리하는 클래스 
// JSP => <% 데이터 읽기 %>
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;

import com.sist.dao.*;
public class GoodsModel {
   public void goodsListData(HttpServletRequest request)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   int rowSize=12;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   
	   map.put("start", start);
	   map.put("end", end);
	   
	   List<GoodsVO> list=GoodsDAO.goodsListData(map);
	   int totalpage=GoodsDAO.goodsTotalPage();
	   // JSP로 전송 
	   // => 화면 출력 => ${}
	   request.setAttribute("list", list);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("curpage", curpage);
   }
}
