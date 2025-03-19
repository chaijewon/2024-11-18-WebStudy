package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class GoodsDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *     <select id="goodsListData" resultType="GoodsVO" parameterType="hashmap">
		   SELECT no,goods_name,goods_poster,goods_price,goods_delivery,hit,likecount,replycount,num
		   FROM (SELECT no,goods_name,goods_poster,goods_price,goods_delivery,hit,likecount,replycount,rownum as num 
		   FROM (SELECT no,goods_name,goods_poster,goods_price,goods_delivery,hit,likecount,replycount
		   FROM goods_all ORDER BY no ASC))
		   WHERE num BETWEEN #{start} AND #{end}
		  </select>
		  <select id="goodsTotalPage" resultType="int">
		   SELECT CEIL(COUNT(*)/12.0) FROM goods_all
		  </select>
    */
   public static List<GoodsVO> goodsListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<GoodsVO> list=session.selectList("goodsListData",map);
	   session.close();
	   return list;
   }
   public static int goodsTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("goodsTotalPage");
	   session.close();
	   return total;
   }
}
