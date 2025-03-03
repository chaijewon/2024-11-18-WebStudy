package com.sist.main;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SeoulMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        SeoulMain sm=new SeoulMain();
        //sm.seoulAttractions();
        //sm.seoulNature();
        sm.seoulHotel();
	}
	
	public void seoulAttractions()
	{
		
		try
		{
			int k=1;
			for(int i=1;i<=35;i++)
			{
			   Document doc=Jsoup.connect("https://korean.visitseoul.net/attractions?curPage="+i).get();
			   Elements poster=doc.select("ul.article-list li.item div.thumb");
			   Elements comment=doc.select("ul.article-list li.item div.infor-element span.text-dot-d");
			   Elements link=doc.select("ul.article-list li.item a");
			   Elements title=doc.select("ul.article-list li.item div.infor-element span.title");
			   for(int j=0;j<poster.size();j++)
			   {
				   try{
					   System.out.println("번호:"+k);
					   System.out.println(title.get(j).text());
					   System.out.println(poster.get(j).attr("style"));
					   System.out.println(comment.get(j).text());
					   System.out.println(link.get(j).attr("href"));
					   Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
					   Element address=doc2.select("div.detail-map-infor:eq(1) dl dd").get(0);
					   System.out.println("주소:"+address.text());
					   System.out.println("=========================================================");
				       
					   SeoulLocationVO vo=new SeoulLocationVO();
					   vo.setNo(k);
					   vo.setTitle(title.get(j).text());
					   vo.setMsg(comment.get(j).text());
					   String image=poster.get(j).attr("style");
					   image=image.substring(image.indexOf("(")+1,image.lastIndexOf(")"));
					   // style="background-image:url(/comm/getImage?srvcId=POST&amp;parentSn=5548&amp;fileTy=POSTTHUMB&amp;fileNo=1&amp;thumbTy=M)"
					   image="https://korean.visitseoul.net"+image;
					   vo.setPoster(image);
					   vo.setAddress(address.text());
					   
					   k++;
				   }catch(Exception ex) {}
			   }
			}
		}catch(Exception ex){}
	}
	
	public void seoulHotel()
	{
		
		try
		{
			int k=1;
			for(int i=1;i<=33;i++)
			{
			   Document doc=Jsoup.connect("https://korean.visitseoul.net/hotels?curPage="+i).get();
			   Elements poster=doc.select("ul.article-list li.item div.thumb img");
			   Elements link=doc.select("ul.article-list li.item a");
			   Elements title=doc.select("ul.article-list li.item div.infor-element span.title");
			   Elements score=doc.select("div.infor-element-inner span.trip-ico img");//
			   
			   for(int j=0;j<poster.size();j++)
			   {
				   try {
						   System.out.println("번호:"+k);
						   System.out.println(title.get(j).text());
						   System.out.println(poster.get(j).attr("src"));
						   System.out.println(link.get(j).attr("href"));
						   System.out.println(score.get(j).attr("alt"));
						   Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
						   Element address=doc2.select("div.detail-map-infor dl dd").get(0);
						   Elements images=doc2.select("div.wide-slide div.item");
						   String simg="";
						   for(int m=0;m<images.size();m++)
						   {
							   System.out.println(images.get(m).attr("style"));
							   String temp=images.get(m).attr("style");
							   // background-image:url(http://media-cdn.tripadvisor.com/media/photo-s/10/f5/38/a8/twin-rom--v17512289.jpg)"
							   // http://media-cdn.tripadvisor.com/media/photo-s/10/f5/38/a8/twin-rom--v17512289.jpg
							   temp=temp.substring(temp.indexOf("(")+1,temp.lastIndexOf(")"));
							   simg+=temp+"^";
						   }
						   simg=simg.substring(0,simg.lastIndexOf("^"));
						   System.out.println("주소:"+address.text());
						   
						   System.out.println("=========================================================");
					       SeoulHotelVO vo=new SeoulHotelVO();
					       vo.setNo(k);
					       vo.setName(title.get(j).text());
					       vo.setAddress(address.text());
					       vo.setPoster(poster.get(j).attr("src"));
					       String s=score.get(j).attr("alt");
					       // alt=""  평점:4.5
					       s=s.substring(s.indexOf(":")+1);
					       vo.setScore(Double.parseDouble(s.trim()));
					       vo.setImages(simg);
					      
						   k++;
				   }catch(Exception ex) {}
			   }
			}
		}catch(Exception ex){}
	}
	/*
	 *  NO      NOT NULL NUMBER         
		TITLE   NOT NULL VARCHAR2(200)  
		POSTER  NOT NULL VARCHAR2(300)  
		MSG     NOT NULL VARCHAR2(4000) 
		ADDRESS NOT NULL VARCHAR2(300)
	 */
	public void seoulNature()
	{
		
		try
		{
			int k=1;
			for(int i=1;i<=14;i++)
			{
			   Document doc=Jsoup.connect("https://korean.visitseoul.net/nature?curPage="+i).get();
			   
			   Elements poster=doc.select("ul.article-list li.item div.thumb");
			   Elements comment=doc.select("ul.article-list li.item div.infor-element span.text-dot-d");
			   Elements link=doc.select("ul.article-list li.item a");
			   Elements title=doc.select("ul.article-list li.item div.infor-element span.title");
			   for(int j=0;j<poster.size();j++)
			   {
				  try
				  {
				   System.out.println("번호:"+k);
				   System.out.println(title.get(j).text());
				   System.out.println(poster.get(j).attr("style"));
				   System.out.println(comment.get(j).text());
				   System.out.println(link.get(j).attr("href"));
				   Document doc2=Jsoup.connect("https://korean.visitseoul.net"+link.get(j).attr("href")).get();
				   /*
				    *   <div class="detail-map-infor"> :eq(0)
				    *     <dl>
				    *     </dl>
				    *   </div>
				    *   <div class="detail-map-infor"> :eq(1)
				    *     <dl>
				    *     </dl>
				    *   </div>
				    *   <div class="detail-map-infor"> :eq(2)
				    *     <dl>
				    *     </dl>
				    *   </div>
				    */
				   Element address=doc2.select("div.detail-map-infor:eq(1) dl dd").get(0);
				   System.out.println("주소:"+address.text());
				   System.out.println("=========================================================");
			       SeoulNatureVO vo=new SeoulNatureVO();
			       vo.setNo(k);
			       vo.setTitle(title.get(j).text());
			       vo.setAddress(address.text());
			       vo.setMsg(comment.get(j).text());
			       String s=poster.get(j).attr("style");
			       s=s.substring(s.indexOf("(")+1,s.lastIndexOf(")"));
			       s="https://korean.visitseoul.net"+s;
			       vo.setPoster(s);
			       
				   k++;
				  }catch(Exception ex) {}
			   }
			}
		}catch(Exception ex){}
	}

}
