package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

/**
 * Servlet implementation class LoginService
 */
@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      
      response.setCharacterEncoding("EUC-KR");
      response.setContentType("text/html; charset=euc-kr");
      
      MemberDAO dao = new MemberDAO();
      
      MemberDTO dto = new MemberDTO(id, pw);
      MemberDTO info = dao.login(dto);
      
      HttpSession session = request.getSession();
      
      session.setAttribute("info", info);
      
      if(info != null) {
         response.sendRedirect("home/main.jsp");
         
      }else {
          PrintWriter out = response.getWriter();
               out.println("<script>");
               out.println("alert('로그인에 실패했습니다. 다시 시도해주세요.');");
               out.println("window.location.href = document.referrer;"); // 'login.jsp'를 실제 로그인 페이지 URL로 대체하세요
               out.println("</script>");
      }
      
   }

}