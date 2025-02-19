package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.net.*;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.*;
import org.w3c.dom.*; // DOM VS SAX 

import com.sist.model.Model;
// DOM => XML을 트리형태로 저장후 데이터 읽기 (CRUD)
// SAX => 태그를 한개씩 읽어서 데이터 추출 
// 문제점 
// => AWS에 호스팅 => 리눅스 (우분투) => 경로명의 문제  \\  /
// => 작성 => 리눅스에서 호환 
// Controller => Model찾기 , JSP찾기
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap=new HashMap();
    // XML읽어서 => 클래스확인 
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try
		{
			URL url=this.getClass().getClassLoader().getResource(".");
			File file=new File(url.toURI());
			System.out.println(file.getPath());
			// C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\JSPMVCProject_1\WEB-INF
			String path=file.getPath();
			path=path.replace("\\", File.separator);
			// => 윈도우 \\ , 리눅스 / => 자동 변환 
			path=path.substring(0,path.lastIndexOf(File.separator));
			System.out.println(path);
			path=path+File.separator+"application.xml";
			System.out.println(path);
			////// XML의 경로 => 모든 운영체제 => 모든 컴퓨터 호환
			///// XML => 파싱 (xml에 있는 데이터 추출) 
			///// DocumentBuilder (html => Jsoup) 
			///// JSON => Jackson 
			/// 1. XML 파서기 생성 WML HDML VML
			DocumentBuilderFactory dbf=
					DocumentBuilderFactory.newInstance();
			/// 2. 파서기
			DocumentBuilder db=dbf.newDocumentBuilder();
			/// 3. XML을 읽어서 트리형태로 메모리 저장 
			///    ------------------------ Document
			Document doc=db.parse(new File(path));
			/// 4. root태그 읽기 
			Element beans=doc.getDocumentElement();
			System.out.println(beans.getTagName());
			
			// 5. 같은 이름의 태그를 모아서 처리 
			NodeList list=beans.getElementsByTagName("bean");
			// 6. bean에 있는 id,class의 값을 추출 
			// => MVC구조에서는 Controller를 유지보수=> 공사중
			//System.out.println(list.toString());
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				System.out.println(id+":"+cls);
				
				Class clsName=Class.forName(cls);
				// 클래스 정보 읽기 => 메모리 할당 / 메소드 호출 / 멤버변수 주입..
				// 클래스 정보를 읽기 위해서는 반드시 패키지.클래스명
				// 스프링 고정 => 추가 / 수정 / 삭제 => 문서(XML)
				// 메모리 할당 
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// clsName.invoke()
				clsMap.put(id, obj);
				System.out.println(id+":"+obj);
			}
		}catch(Exception ex){}
	}
    // 사용자 요청을 받는다 : GET/POST => 동시에 처리 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1. 사용자 요청을 받는다 
		// => <a> <form> , location.href ...
		String uri=request.getRequestURI();
		// http://localhost/JSPMVCProject_1/*.do
		//                                  ----
		//                               list.do / insert.do
		// /JSPMVCProject_1/list.do => URI
		uri=uri.substring(uri.lastIndexOf("/")+1);
		
		System.out.println(uri);
		// /JSPMVCProject_1/board/list.do
		// 2. Model클래스를 찾는다 
		Model model=(Model)clsMap.get(uri);
		// 3. 처리된 결과를 어떤 JSP에 전송할지 확인 
		String jsp=model.handlerRequest(request);
		// 4. 이동 방식 
		// sendRedirect / forward 
		// request=> 초기화 request를 전송 
		// _ok
		if(jsp.startsWith("redirect:"))
		{
			// 이미 만들어진 JSP이동 => sendRedirect
			jsp=jsp.substring(jsp.indexOf(":")+1);
			// return "redirect:list.do"
			response.sendRedirect(jsp);
		}
		else
		{
			// request에 담긴값을 출력 => forward
			RequestDispatcher rd=
					request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
	}

}




