package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.PlaceDAO;

import list.model.PlaceDTO;


@WebServlet("/placeToLatLng")
public class PlaceToLatLng extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      String markerPlace = request.getParameter("markerPlace");
      //System.out.println(markerPlace);
      
       
      PlaceDAO placedao = new PlaceDAO();
      PlaceDTO placedto;
      ArrayList<PlaceDTO> list = new ArrayList<>();
      String[] mp = markerPlace.split("///");
      
      for(int i =0;i<mp.length;i++) {
         placedto = placedao.placeSelect(mp[i]);
         
         //System.out.println(placedto);
         list.add(placedto);
      }         
         Gson gson = new Gson();
         String result = gson.toJson(list);
         
         
         
         response.setCharacterEncoding("UTF-8");
         response.getWriter().print(result);
               
      
      
//      schedule_details = String.join("-",schedulePlace);
   }

}