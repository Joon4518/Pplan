package list.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import list.model.CommentDAO;
import list.model.CommentDTO;


/**
 * Servlet implementation class writeComment
 */
@WebServlet("/writeComment")
public class WriteComment extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Override
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
    
      int scheId = Integer.parseInt(request.getParameter("mem_schedule"));
      String content = request.getParameter("content");
      
     // System.out.print(scheId+content);
      CommentDTO dto = new CommentDTO(scheId , content);

      CommentDAO dao = new CommentDAO();
      dao.insert(dto);
      dao.recInsert(dto);
      
      response.sendRedirect("home/menu_myPage.jsp#scheduleScreen");

   }

}