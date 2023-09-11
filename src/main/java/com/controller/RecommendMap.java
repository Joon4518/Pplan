package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.RecomDAO;
import com.model.RecomDTO;

@WebServlet("/recommend_map")
public class RecommendMap extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
       String clickedValue = request.getParameter("clickedValue");
       String scheId = request.getParameter("scheId");
      
       
       ArrayList<String>place_nm = new ArrayList<>();
      
      String[] placeParts = clickedValue.split("-");
      
      for(int b =0; b<placeParts.length;b++) {
         String tmp = placeParts[b];
         place_nm.add(tmp);
      }
   
       RecomDAO dao = new RecomDAO();
       
      
       dao.reco_map(place_nm);
       
       
       
       
       
       response.setContentType("application/json");
       response.setCharacterEncoding("UTF-8");
       response.getWriter().write(new Gson().toJson(dao.reco_map(place_nm)));
       
       
       
      
      
   }

}