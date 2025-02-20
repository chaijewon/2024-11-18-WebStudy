package com.sist.model;

import java.io.File;

/*
 *   
 *   String page=request.getParameter("page")
 *   if(page==null)
 *     page="1";
 *   int curpage=Integer.parseInt(page);
 *   500
 */
public class MainClass {
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path="C:\\webDev\\webStudy\\JSPMVCLastProject\\src\\main\\java\\";
		String pack="com.sist.model";
		path=path+pack.replace(".", "\\");
		try
		{
			File dir=new File(path);
			File[] files=dir.listFiles();
			for(File file:files)
			{
				String name=file.getName();
				String ext=name.substring(name.lastIndexOf(".")+1);
				if(ext.equals("java"))
				{
				   String clsName=name.substring(0,name.lastIndexOf("."));
				   String packname=pack+"."+clsName;
				   System.out.println(packname);
				}
			}
		}catch(Exception ex) {}
		
	}

}
