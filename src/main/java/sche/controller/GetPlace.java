package sche.controller;

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

@WebServlet("/GetPlace")
public class GetPlace extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String schedule = request.getParameter("schedule");
		System.out.println(schedule);
		PlaceDAO placedao = new PlaceDAO();
		String[] scheduleArr = schedule.split("-");
		PlaceDTO placedto;
		ArrayList<PlaceDTO> list = new ArrayList<>();
		for(int i = 0;i<scheduleArr.length;i++) {
			placedto = placedao.placeSelect(scheduleArr[i]);
			
			list.add(placedto);
		}
		
		  
	      Gson gson = new Gson();
	      String result = gson.toJson(list);
	      
	      
	      
	      response.setCharacterEncoding("UTF-8");
	      response.getWriter().print(result);
	}

}
