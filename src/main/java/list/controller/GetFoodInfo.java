package list.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import list.model.FdReviewDTO;
import list.model.ReviewDAO;

/**
 * Servlet implementation class GetFoodInfo
 */
@WebServlet("/GetFoodInfo")
public class GetFoodInfo extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      int foodNum = Integer.parseInt(request.getParameter("foodNum"));
      
      ReviewDAO dao = new ReviewDAO();
      ArrayList<FdReviewDTO> list = dao.getFdReview(foodNum);
      
      for(FdReviewDTO dto : list) {
         System.out.println(dto.toString());
      }

      response.setCharacterEncoding("UTF-8");
      Gson gson = new Gson();
      String result = gson.toJson(list);
      System.out.println(result);
      response.getWriter().print(result);
   }

}