package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class BoardDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  
  // 기능 처리 
  
}
