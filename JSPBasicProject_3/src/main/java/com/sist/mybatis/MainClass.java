package com.sist.mybatis;
import java.util.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        List<EmpVO> list=
        		EmpDAO.empListData();
        for(EmpVO vo:list)
        {
        	System.out.println(vo.getEmpno()+" "
        			+vo.getEname()+" "
        			+vo.getJob()+" "
        			+vo.getHiredate().toString()+" "
        			+vo.getSal());
        }
	}

}
