package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.MemberDAO;
import com.model.MemberDTO;


@WebServlet("/game")
public class Game extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
         
      String[] answerResults = request.getParameterValues("answerResult");
        if (answerResults != null) {
            for (String answerResult : answerResults) {
                
            }
        }
        
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = new MemberDTO(answerResults[0], answerResults[1], answerResults[2], answerResults[3], answerResults[4]);
        ArrayList<MemberDTO> list = dao.game(dto);
        
        Random rd = new Random();
        int index = rd.nextInt(list.size());
        String name = list.get(index).getPlace_name();
        
        String img = list.get(index).getPlace_img();
        String content = list.get(index).getPlace_content();
       MemberDTO result = new MemberDTO(name, img, content);
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        
        Gson gson = new Gson();
        String resInfo = gson.toJson(result);

       
        response.getWriter().print(resInfo);
       
   }

}