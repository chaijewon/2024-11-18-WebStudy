package com.sist.vo;
/*
 *   NO   NOT NULL NUMBER
 GOODS_NAME NOT NULL VARCHAR2(1000)
 GOODS_SUB  VARCHAR2(1000)
 GOODS_PRICE   NOT NULL VARCHAR2(50)
 GOODS_DISCOUNT   NUMBER
 GOODS_FIRST_PRICE   VARCHAR2(20)
 GOODS_DELIVERY  NOT NULL VARCHAR2(20)
 GOODS_POSTER   VARCHAR2(260)
 HIT  NUMBER
 */
// 1. Mybatis => 컬럼명이 동일하지 않는 경우에는 반드시 별칭
// 2. 컬럼명이 일치하니 않는 경우에는 반드시 설정 
/*
 *    private int no,gd,hit;
 *    SELECT goods_discount as gd
 *    
 *    <result property="gd" column="goods_discount">
 *     => JOIN / SUBQUERY
 *    => 함수이용하면 반드시 별칭 
 *       TO_CHAR() as dbday
 *    => 자동으로 값을 채워준다 
 *    
 *    SELECT a as d,b,c FROM ...
 *    setD() setB() setC()
 */
public class GoodsVO {
    private int no,goods_discount,hit;
    private String goods_name,goods_sub,goods_price,
           goods_first_price,goods_delivert,goods_poster;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGoods_discount() {
		return goods_discount;
	}
	public void setGoods_discount(int goods_discount) {
		this.goods_discount = goods_discount;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_sub() {
		return goods_sub;
	}
	public void setGoods_sub(String goods_sub) {
		this.goods_sub = goods_sub;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_first_price() {
		return goods_first_price;
	}
	public void setGoods_first_price(String goods_first_price) {
		this.goods_first_price = goods_first_price;
	}
	public String getGoods_delivert() {
		return goods_delivert;
	}
	public void setGoods_delivert(String goods_delivert) {
		this.goods_delivert = goods_delivert;
	}
	public String getGoods_poster() {
		return goods_poster;
	}
	public void setGoods_poster(String goods_poster) {
		this.goods_poster = goods_poster;
	}
}
