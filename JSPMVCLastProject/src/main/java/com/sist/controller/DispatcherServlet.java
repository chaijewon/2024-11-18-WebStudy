package com.sist.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.FileReader;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sist.ann.*;
import java.net.*;
import java.io.*;
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private List<String> clsList=
    		          new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// 클래스만 가지고 오기 => XML 
		try
		{
			// RealPath 
			URL url=this.getClass().getClassLoader().getResource(".");
			// 
			// 파일로 변경 
			File file=new File(url.toURI());
			System.out.println(file.getPath());
			String path=file.getPath();
			path=path.replace("\\", File.separator);
			// => window : \\ , mac,linux : /
			// => AWS => 우분투
			path=path.substring(0,path.lastIndexOf(File.separator));
			// WEB-INF/classes
			path=path+File.separator+"application.xml";
			
			// 패키지 명칭 => XML파싱 
			// XML 파싱기 생성 
			DocumentBuilderFactory dbf=
					DocumentBuilderFactory.newInstance();
			// XML 파싱기
			DocumentBuilder db=dbf.newDocumentBuilder();
			// XML 파싱 시작 => 태그나 속성에 있는 데이터 추출 
			Document doc=db.parse(new File(path));
			// 최상위 태그 => 데이터베이스 (테이블 역할)
			Element beans=doc.getDocumentElement();
			// 같은 이름의 태그를 묶어서 관리 
			NodeList list=beans.getElementsByTagName("context:component-scan");
			String pack="";
			for(int i=0;i<list.getLength();i++)
			{
				Element elem=(Element)list.item(i);
				pack=elem.getAttribute("basePackage");
			}
			System.out.println(pack);
			com.sist.ann.FileReader.componentScan(file.getPath(), pack);
			
		}catch(Exception ex) {}
	}
	/*
	 *   class B 
	 *   
	 *   A a=new A()
	 */
    // 사용자 요청시에 Model연결 => 결과값을 JSP 전송
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
