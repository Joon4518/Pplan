package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

/**
 * Servlet implementation class UpdateService
 */
@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		
		HttpSession session = request.getSession();
		
		MemberDAO dao =new MemberDAO();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		MemberDTO changeInfo = new MemberDTO(info.getId(), info.getPw(), nick, email);
		int cnt = dao.update(changeInfo);
		
		response.sendRedirect("home/main.jsp");
	}

}
