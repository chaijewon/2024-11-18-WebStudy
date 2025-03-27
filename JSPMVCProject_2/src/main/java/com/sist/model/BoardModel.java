package com.sist.model;
import com.sist.ann.*;
public class BoardModel {
	
  @RequestMapping("board/list.do") // if(url.equals("list.do"))
  public void boardListData()
  {
	  System.out.println("게시판 목록 출력");
  }
  
  @RequestMapping("board/detail.do")
  public void boardDetailData() {
	  System.out.println("게시판 상세보기 출력");
  }
  
  @RequestMapping("board/insert.do")
  public void boardInsert()
  {
	  System.out.println("게시판 데이터 추가");
  }
  
  @RequestMapping("board/delete.do")
  public void boardDelete()
  {
	  System.out.println("게시판 데이터 삭제");
  }
  
  @RequestMapping("board/update.do")
  public void boardUpdate()
  {
	  System.out.println("게시판 데이터 수정");
  }
}
