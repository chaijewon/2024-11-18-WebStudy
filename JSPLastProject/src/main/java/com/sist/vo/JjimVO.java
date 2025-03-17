package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
public class JjimVO {
   private int jno,rno,type;
   private String id,dbday;
   private Date regdate;
   private FoodVO fvo=new FoodVO();
   private RecipeVO recipeVO = new RecipeVO();
}
