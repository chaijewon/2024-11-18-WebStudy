package com.sist.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sist.model.*;
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // 클래스 저장 
	private Map clsMap=new HashMap();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try
		{
			String xml_path="C:\\webDev\\webStudy\\JSPMiddleProject_4\\src\\main\\webapp\\WEB-INF\\application.xml";
			DocumentBuilderFactory dbf=
					DocumentBuilderFactory.newInstance();
			// 파서기 생성 => XML / WML / HDML / VML ... 
			DocumentBuilder db=dbf.newDocumentBuilder();
			// XML파서기 
			
			Document doc=db.parse(new File(xml_path));
			//System.out.println(doc.toString());
			
			// root 
			Element root=doc.getDocumentElement();
			//System.out.println(root.getTagName());
			NodeList list=root.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				
				// 클래스 메모리 할당 new ListModel()
				Class clsName=Class.forName(cls);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				System.out.println(id+":"+obj);
				
				clsMap.put(id, obj);
			}
			// DOM Parsing : 데이터를 메모리에 트리형태로 저장 관리 
			// 실제 데이터만 추출 => SAX => 스프링에서 주로 사용 
			// => 공공포털 / 네이버 카페 => xml,json 
		}catch(Exception ex){}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// http://localhost/JSPMiddleProject_4/list.do
		// http://localhost/JSPMiddleProject_4/list.do?page=1
		// 사용자 요청을 받는다 
		String uri=request.getRequestURI();
		//System.out.println(uri);
		uri=uri.substring(request.getContextPath().length()+1);
		//System.out.println(uri);
		Model model=(Model)clsMap.get(uri);
		String jsp=model.handlerRequest(request);
		
	}

}
