package com.sist.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    response.setContentType("text/html;charset=UTF-8");
		    System.out.println("연결...");
		    // request.getParameter()를 이용해 가져왔다. 하지만 파일은 다르다. 
		    // 파일은 part로 받아와야한다.
		    Part filePart = request.getPart("file");
	        String fileName = filePart.getSubmittedFileName();
            System.out.println("fileName="+fileName);
            
            if(fileName==null || fileName.equals(""))
            {
            	//System.out.println("파일 없음");
            	response.getWriter().println("<h1 style=\"color:red\">파일없이 성공적으로 저장되었습니다!</h1>");
            }
            else 
            {
		        // 업로드된 파일을 저장할 디렉토리를 정의합니다.
		        String uploadDir = "c:\\upload";
		        File file = new File(uploadDir, fileName);
	            // try ~ resource => 자동으로 닫긴다
		        try (InputStream input = filePart.getInputStream(); 
		        		FileOutputStream output = new FileOutputStream(file)) {
		            byte[] buffer = new byte[1024];
		            int length;
		            while ((length = input.read(buffer)) > 0) {
		                output.write(buffer, 0, length);
		            }
		        }
	            
		        response.getWriter().println("<h1 style=\"color:blue\">파일이 성공적으로 업로드되었습니다!</h1>");
            }
	}

}
