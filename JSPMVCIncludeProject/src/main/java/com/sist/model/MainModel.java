package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 *   MainModel model=new MainModel()
 *   model.main_main()
 */
@Controller
public class MainModel {
   @RequestMapping("main/main.do")
   public String main_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
        List<FoodVO> rList=FoodDAO.foodTop12("fno");
        List<FoodVO> hList=FoodDAO.foodTop12("hit");
        List<FoodVO> sList=FoodDAO.foodTop12("score");
        
        request.setAttribute("rList", rList);
        request.setAttribute("hList", hList);
        request.setAttribute("sList", sList);
        // include파일 전송 
        request.setAttribute("main_jsp", "home.jsp");
        
        // include => 포함된 모든 JSP는 request를 공유
        return "../main/main.jsp";
   }
}




