<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<%
	//사용자가 데이터전송 request.getParameter("name")
	// 사용자가 파일 전송 request.getPart("upload");
	Part filePart=request.getPart("upload");
	String fileName=filePart.getSubmittedFileName();
	String uploadDir=application.getRealPath("/image");
	File file=new File(uploadDir,fileName);
		 // 오라클 => 파일업로드 
		 // try ~ resource => 자동으로 input/output 닫긴다
	try(InputStream input=filePart.getInputStream();
		FileOutputStream output=new FileOutputStream(file)
	   )
    {
			    byte[] buffer=new byte[1024];
			    int i=0;
			    while((i=input.read(buffer,0,1024))!=-1)
			    {
			    	output.write(buffer, 0, i);
			    }
	}

    response.sendRedirect("output.jsp?img="+fileName);
%>