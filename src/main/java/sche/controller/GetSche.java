package sche.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sche.model.ScheDAO;
import sche.model.ScheDTO;

/**
 * Servlet implementation class GetSche
 */
@WebServlet("/GetSche")
public class GetSche extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("EUC-KR");
      String id = request.getParameter("id");
      
      System.out.println(id);
      ScheDAO dao = new ScheDAO();
      ArrayList<ScheDTO> scheInfo = dao.getsche(id);

      response.setCharacterEncoding("UTF-8");
      Gson gson = new Gson();
      String result = gson.toJson(scheInfo);

      System.out.println(result);
      response.getWriter().print(result);

   }
}