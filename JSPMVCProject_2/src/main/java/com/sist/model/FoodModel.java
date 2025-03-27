package com.sist.model;
import com.sist.ann.*;
public class FoodModel {
   @RequestMapping("food/list.do")
   public void foodListData()
   {
	   System.out.println("맛집 목록 출력");
   }
   @RequestMapping("food/detail.do")
   public void foodDetailData()
   {
	   System.out.println("맛집 상세 보기 출력");
   }
}
