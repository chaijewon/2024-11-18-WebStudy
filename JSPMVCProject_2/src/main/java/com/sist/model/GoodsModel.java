package com.sist.model;
import com.sist.ann.*;
public class GoodsModel {
  @RequestMapping("goods/list.do")
  public void goodsListData()
  {
	  System.out.println("상품 목록 출력");
  }
  @RequestMapping("goods/detail.do")
  public void goodsDetailData()
  {
	  System.out.println("상품 상세 보기 출력");
  }
}
