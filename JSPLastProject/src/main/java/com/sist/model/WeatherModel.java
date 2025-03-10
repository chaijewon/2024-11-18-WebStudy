package com.sist.model;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class WeatherModel {
	 @RequestMapping("seoul/weather.do")
	  public String today_weather(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  try
		  {
			  Document doc=Jsoup.connect("https://korean.visitseoul.net/weather").get();
			  Element section=doc.selectFirst("section#content");
			  String html="<section id=\"content\">";
			  html+=section.html();
			  html+="</section>";
			  // <img src="https://korean.visitseoul.net/resources/theme/images/weather/img-weather10.png" alt="흐리고 비">
			  html=html.replace("src=\"","src=\"https://korean.visitseoul.net" );
			  html=html.replace("제공 : 케이웨더(Kweather)","" );
			  System.out.println(html);
			  request.setAttribute("html", html);
		  }catch(Exception ex){}
		  request.setAttribute("main_jsp", "../seoul/weather.jsp");
		  return "../main/main.jsp";
	  }
}
