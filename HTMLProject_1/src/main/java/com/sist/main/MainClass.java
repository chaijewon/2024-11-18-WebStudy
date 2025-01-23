package com.sist.main;
import java.util.*;
public class MainClass {
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner scan=new Scanner(System.in);
        while(true)
        {
        	System.out.println("===== Menu =====");
        	System.out.println("1.목록");
        	System.out.println("2.상세");
        	System.out.println("3.등록");
        	System.out.println("4.수정");
        	System.out.println("5.삭제");
        	System.out.println("6.종료");
        	System.out.println("================");
        	System.out.print("메뉴 선택:");
        	int menu=scan.nextInt();
        	if(menu==6)
        	{
        		System.out.println("프로그램 종료");
        		break;
        	}
        	else if(menu==1)
        	{
        		StudentDAO dao=
        			StudentDAO.newInstance();
        		List<StudentVO> list=dao.studentAllData();
        		for(StudentVO vo:list)
        		{
        			System.out.println(vo.getHakbun()+" "
        				+vo.getName()+" "
        				+vo.getKor()+" "
        				+vo.getEng()+" "
        				+vo.getMath());
        		}
        				
        	}
        	else if(menu==2)
        	{
        		System.out.print("학번 입력:");
        		int hak=scan.nextInt();
        		StudentDAO dao=
        				StudentDAO.newInstance();
        		StudentVO vo=dao.studentDetailData(hak);
        		System.out.println(vo.getHakbun()+" "
        				+vo.getName()+" "
        				+vo.getKor()+" "
        				+vo.getEng()+" "
        				+vo.getMath());
        		
        	}
        }
	}

}
