package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.StorageDAO;
import com.model.StorageDTO;

@WebServlet("/saveSchedule")
public class SaveSchedule extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("EUC-KR");
      HttpSession session = request.getSession();
      
      MemberDTO info = (MemberDTO)session.getAttribute("info");
      
      //System.out.println(info.getId());
      if(info != null) {
      
         String[] s = request.getParameterValues("place");
         String[] schedulePlace;
         StorageDAO dao = new StorageDAO();
         String schedule_details;
         String id = info.getId();
         for(String a : s) {
            schedulePlace = a.split("///");
            schedule_details = String.join("-",schedulePlace);
            dao.saveStorage(new StorageDTO(id,schedule_details));
         }
      
      }
      
      response.sendRedirect("home/menu_myPage.jsp#scheduleScreen");
      /*
       * request.setCharacterEncoding("UTF-8");
       * 
       * ListDAO dao = new ListDAO(); ArrayList<FoodDTO> list = dao.foodGet();
       * 
       * Gson gson = new Gson(); String result = gson.toJson(list);
       * 
       * 
       * 
       * response.setCharacterEncoding("UTF-8"); response.getWriter().print(result);
       */
   }

}