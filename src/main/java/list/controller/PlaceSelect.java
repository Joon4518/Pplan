package list.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import list.model.ListDAO;
import list.model.PlaceDTO;

/**
 * Servlet implementation class PlaceSelect
 */
@WebServlet("/PlaceSelect")
public class PlaceSelect extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
      request.setCharacterEncoding("UTF-8");

      ListDAO dao = new ListDAO();
      ArrayList<PlaceDTO> list = dao.placeGet();
      
    
      
      Gson gson = new Gson();
      String result = gson.toJson(list);
      
      response.setCharacterEncoding("UTF-8");
      response.getWriter().print(result);
      
      
   }

}