package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class EmpModel {
  @RequestMapping("emp/list.do")
  public String emp_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../emp/list.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("emp/list_js.do")
  public void emp_list_js(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  List<EmpVO> list=FoodDAO.empListData();
		  JSONArray arr=new JSONArray(); // [{},{},...]
		  for(EmpVO vo:list)
		  {
			  JSONObject obj=new JSONObject();
			  obj.put("empno", vo.getEmpno());
			  obj.put("ename", vo.getEname());
			  obj.put("job", vo.getJob());
			  obj.put("hiredate", vo.getDbday());
			  obj.put("sal", vo.getSal());
			  arr.add(obj);
		  }
		  out.write(arr.toJSONString());
		  System.out.println(arr.toJSONString());
	  }catch(Exception ex) {}
  }
  
}
