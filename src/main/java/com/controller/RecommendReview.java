package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.RecomDAO;


@WebServlet("/recommend_review")
public class RecommendReview extends HttpServlet {
   private static final long serialVersionUID = 1L;

   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
       String scheId = request.getParameter("scheId");
       
       RecomDAO dao = new RecomDAO();
       
       dao.review(scheId);
       
       
      
       response.setCharacterEncoding("UTF-8");
       response.getWriter().write(dao.review(scheId));
       
       
      
      
      
   }

}