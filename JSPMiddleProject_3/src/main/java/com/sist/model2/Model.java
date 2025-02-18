package com.sist.model2;

import jakarta.servlet.http.HttpServletRequest;
/*
 *    동물 (인터페이스)
 *     |
 *   개 소 돼지 말 ...
 */
public interface Model {
   public String execute(HttpServletRequest request);
}
