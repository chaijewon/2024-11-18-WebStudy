package com.sist.manager;

import java.io.File;
import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailManager {
   public static void main(String[] args) {
	   MailManager m=new MailManager();
	   m.mailSender("Hello");
   }
   private String style="<style>" + 
   		"body {" + 
   		"	  padding:1.5em;" + 
   		"	  background: #f5f5f5" + 
   		"	}" + 
   		"	table {" + 
   		"	  border: 1px #a39485 solid;" + 
   		"	  font-size: .9em;" + 
   		"	  box-shadow: 0 2px 5px rgba(0,0,0,.25);" + 
   		"	  width: 100%;" + 
   		"	  border-collapse: collapse;" + 
   		"	  border-radius: 5px;" + 
   		"	  overflow: hidden;" + 
   		"	}" + 
   		"	th {" + 
   		"	  text-align: left;" + 
   		"	}" + 
   		"	thead {" + 
   		"	  font-weight: bold;" + 
   		"	  color: #fff;" + 
   		"	  background: #73685d;" + 
   		"	}" + 
   		"	 td, th {" + 
   		"	  padding: 1em .5em;" + 
   		"	  vertical-align: middle;" + 
   		"	}" + 
   		"	 td {" + 
   		"	  border-bottom: 1px solid rgba(0,0,0,.1);" + 
   		"	  background: #fff;" + 
   		"	}" + 
   		"	a {" + 
   		"	  color: #73685d;" + 
   		"	}" + 
   		"	 @media all and (max-width: 768px) {" + 
   		"	  table, thead, tbody, th, td, tr {" + 
   		"	    display: block;" + 
   		"	  }" + 
   		"	  th {" + 
   		"	    text-align: right;" + 
   		"	  }" + 
   		"	  table {" + 
   		"	    position: relative; " + 
   		"	    padding-bottom: 0;" + 
   		"	    border: none;" + 
   		"	    box-shadow: 0 0 10px rgba(0,0,0,.2);" + 
   		"	  }" + 
   		"	  thead {" + 
   		"	    float: left;" + 
   		"	    white-space: nowrap;" + 
   		"	  }" + 
   		"	  tbody {" + 
   		"	    overflow-x: auto;" + 
   		"	    overflow-y: hidden;" + 
   		"	    position: relative;" + 
   		"	    white-space: nowrap;" + 
   		"	  }" + 
   		"	  tr {" + 
   		"	    display: inline-block;" + 
   		"	    vertical-align: top;" + 
   		"	  }" + 
   		"	  th {" + 
   		"	    border-bottom: 1px solid #a39485;" + 
   		"	  }" + 
   		"	  td {" + 
   		"	    border-bottom: 1px solid #e5e5e5;" + 
   		"	  }" + 
   		"	  }" + 
   		"</style>";
	public void mailSender(String result)
	{
		String data="";
		try
		{
			FileReader fr=new FileReader("c:\\webDev\\pwd.txt");
			int i=0;
			while((i=fr.read())!=-1)
			{
				data+=String.valueOf((char)i);
			}
		}catch(Exception ex) {}
		
		String host="smtp.naver.com"; 
		String user="vcandjava@naver.com";
		String password=data;
		
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		// naver 인증
		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(user, password);
			}
			
		});
		try
		{
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(user));
			message.setSubject("비밀번호입니다");
			String html="<html>"
       		     +"<head>"
       		     +style
       		     +"</head>"
       		     +"<table>"
       		     +"<tbody>"
       		     +"<tr>"
       		     +"<th width=15%>비밀번호</th>"
       		     +"<td width=85%>"+result+"</td>"
       		     +"</tr>"
       		     +"</tbody>"
       		     +"<body>"
       		     +"</body>"
       		     +"</html>";
			message.setContent(html,"text/html;charset=UTF-8");
			//message.setContent(html,"text/html;charset=UTF-8");
			Transport.send(message);
			System.out.println("정상수행");
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("비정상수행");
		}
		
	}
}
