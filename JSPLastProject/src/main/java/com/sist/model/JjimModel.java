package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.lang.annotation.Repeatable;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class JjimModel {
    private String[] table={"","project_food","recipe"};
    private String[] noName={"","fno","no"};
    private String[] urls={"","../food/food_detail.do?fno=",
    		"../recipe/recipe_detail.do?no="};
    @RequestMapping("jjim/jjim_insert.do")
    public String jjim_insert(HttpServletRequest request,
    		HttpServletResponse response)
    {
    	String rno=request.getParameter("rno");
    	String type=request.getParameter("type");
    	HttpSession session=request.getSession();
    	String id=(String)session.getAttribute("id");
    	
    	JjimVO vo=new JjimVO();
    	vo.setId(id);
    	vo.setRno(Integer.parseInt(rno));
    	vo.setType(Integer.parseInt(type));
    	JjimDAO.jjimInsert(vo);
    	return "redirect:"+urls[Integer.parseInt(type)]+rno;
    	
    }
    @RequestMapping("jjim/jjim_cancel.do")
    public String jjim_cancel(HttpServletRequest request,
    		HttpServletResponse response)
    {
    	String rno=request.getParameter("rno");
    	String jno=request.getParameter("jno");
    	JjimDAO.jjimDelete(Integer.parseInt(jno));
    	return "redirect:../food/food_detail.do?fno="+rno;
    }
    
}
