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
     *   
     *   1.돼지갈비는 찬물에 담궈 핏물을 제거해주세요. (물은 갈아주시면서) 핏물을 제거한 돼지갈비는 끓는물에 청주를 넣고 데쳐주세요. 찬물에 헹궈 여분의 불순물을 제거한뒤 물기를 제거해주세요.^https://recipe1.ezmember.co.kr/cache/recipe/2015/09/30/024bd28dab36732e1b35c7772a9a9f221.jpg
         2.당근은 가장자리를 살짝 정리(?)해주세요. 마른 표고버섯은 미지근한물에 설탕을 조금 넣고 불린뒤 물기를 짜주세요.^https://recipe1.ezmember.co.kr/cache/recipe/2015/09/30/23c9af311cff069c19dea408d74f23c61.jpg
         3.미리 만들어둔 양념장에 돼지갈비를 넣고 30분정도 재워두세요. 재워둔 돼지갈비에 멸치&다시마육수를 넣고 불을 켜주세요.^https://recipe1.ezmember.co.kr/cache/recipe/2015/09/30/3e69d9cf76d3afd74526a9a8aaf803581.jpg
         4.돼지갈비가 반쯤 익어가면 야채들을 넣어주세요. 야채들이랑 돼지갈비랑 알맞게 맛있게 익었다면 마지막에 참기름을 두르고 센불에서 후다닥 섞어주세요.^https://recipe1.ezmember.co.kr/cache/recipe/2015/09/30/d7425dff8657b175d14831db4b06fa5a1.jpg

     */
    @RequestMapping("recipe/recipe_detail.do")
    public String recipe_detail(HttpServletRequest request,
    		HttpServletResponse response)
    {
    	String no=request.getParameter("no");
    	RecipeDetailVO vo=RecipeDAO.recipeDetailData(Integer.parseInt(no));
    	
    	List<String> mList=new ArrayList<String>();
    	List<String> iList=new ArrayList<String>();
    	
    	String[] datas=vo.getFoodmake().split("\n");
    	for(String make:datas)
    	{
    		StringTokenizer st=new StringTokenizer(make,"^");
    	    mList.add(st.nextToken());
    	    iList.add(st.nextToken());
    	}
    	/*
    	 *   <c:forEach var="make" item="${mList}">
    	 *    
    	 */
    	request.setAttribute("vo", vo);
    	request.setAttribute("mList", mList);
    	request.setAttribute("iList", iList);
    	request.setAttribute("main_jsp", "../recipe/recipe_detail.jsp");
    	return "../main/main.jsp";
    }
    
    
}










