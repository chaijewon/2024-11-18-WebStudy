package com.sist.model;
import java.lang.annotation.Repeatable;
import java.net.http.HttpRequest;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 *   MVC 
 *    => jsp : 링크 (요청)
 *    => 요청 내용 받기 
 *       ----------- request.getParameter()
 *    => 요청 처리 => DAO연동 
 *    => JSP로 결과값 전송 
 *    
 *    <%@ page .... %>
 *    <%
 *        자바 => 출력할 데이터 
 *    %>
 *    
 *    Spring : MVC
 *    
 *    => 오라클 
 *    => 브라우저 전송 
 *    => 자바 핵심 
 */
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class RecipeModel {
	// if(uri.equals("recipe/recipe_list.do"))
    @RequestMapping("recipe/recipe_list.do") //if추가
    public String recipe_list(HttpServletRequest request,
    		HttpServletResponse response)
    {
    	// 처리 => 주문서 , 처리후=> 어떤 테이블
    	// request       addAttribute() => return 
    	String page=request.getParameter("page");
    	if(page==null)
    		page="1";
    	int curpage=Integer.parseInt(page);
    	Map map=new HashMap();
    	map.put("start", (12*curpage)-11);
    	map.put("end", 12*curpage);
    	List<RecipeVO> list=RecipeDAO.recipeListData(map);
    	int totalpage=RecipeDAO.recipeTotalPage();
    	final int BLOCK=10;
  	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
  	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
  	  
  	    if(endPage>totalpage)
  		  endPage=totalpage;
  	    
  	    
  	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
  	    request.setAttribute("main_jsp", "../recipe/recipe_list.jsp");
  	    return "../main/main.jsp";
    	
    }
    @RequestMapping("recipe/chef_list.do")
    public String chef_list(HttpServletRequest request,
    		HttpServletResponse response)
    {
    	String page=request.getParameter("page");
    	if(page==null)
    		page="1";
    	int curpage=Integer.parseInt(page);
    	Map map=new HashMap();
    	map.put("start", (12*curpage)-11);
    	map.put("end", 12*curpage);
    	List<ChefVO> list=RecipeDAO.recipeChefListData(map);
    	int totalpage=RecipeDAO.recipeChefTotalPage();
    	
    	request.setAttribute("list", list);
    	request.setAttribute("curpage", curpage);
    	request.setAttribute("totalpage", totalpage);
    	
    	request.setAttribute("main_jsp", "../recipe/chef_list.jsp");
    	return "../main/main.jsp";
    }
    
    @RequestMapping("recipe/recipe_find.do")
    public String recipe_find(HttpServletRequest request,
    		HttpServletResponse response)
    {
    	String[] findArr=request.getParameterValues("fs");
    	if(findArr==null)
    		findArr=new String[] {"T"};
    	String ss=request.getParameter("ss");
    	if(ss==null)
    		ss="만개";
    	Map map=new HashMap();
    	map.put("findArr", findArr);
    	map.put("ss", ss);
    	List<RecipeVO> list=RecipeDAO.recipeFindData(map);
    	request.setAttribute("list", list);
    	request.setAttribute("main_jsp", "../recipe/recipe_find.jsp");
    	return "../main/main.jsp";
    }
    /*
     *   1. return "../main/main.jsp"
     *   2. return "../food/food.jsp"
     *   3. return "redirect:../main/main.do"
     */
    
    
}










