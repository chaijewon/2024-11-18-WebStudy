package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;

@Controller
public class LikeModel {
	private String[] tables = { "", "project_food", "recipe"};
	private String[] noName = { "", "fno", "no"};
	@RequestMapping("like/likeOn.do")
	public void LikeOn(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String rno = request.getParameter("rno");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("rno", Integer.parseInt(rno));
		map.put("type", Integer.parseInt(type));
		map.put("id", id);
		map.put("table", tables[Integer.parseInt(type)]);
		map.put("noName", noName[Integer.parseInt(type)]);
		int result = LikeDAO.likeOn(map);
		System.out.println(result);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (Exception e) {
		}
	}

	@RequestMapping("like/likeOff.do")
	public void LikeOff(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String rno = request.getParameter("rno");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("rno", Integer.parseInt(rno));
		map.put("type", Integer.parseInt(type));
		map.put("id", id);
		map.put("table", tables[Integer.parseInt(type)]);
		map.put("noName", noName[Integer.parseInt(type)]);
		int result = LikeDAO.likeOff(map);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (Exception e) {
		}
	}
	@RequestMapping("like/likeCheck.do")
	public void LikeCheck(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String rno = request.getParameter("rno");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("rno", Integer.parseInt(rno));
		map.put("type", Integer.parseInt(type));
		map.put("id", id);
		int count = LikeDAO.likeCheck(map);
		try {
			PrintWriter out = response.getWriter();
			if (count == 0) {
				out.write("NO");
			} else {
				out.write("OK");
			}
		} catch (Exception e) {
		}
	}


}
