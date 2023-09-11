package list.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import list.model.ReviewDAO;
import list.model.ReviewDTO;

/**
 * Servlet implementation class GetPlaceInfo
 */
@WebServlet("/GetPlaceInfo")
public class GetPlaceInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	
		int placeNum = Integer.parseInt(request.getParameter("placeNum"));
		
		// System.out.println(placeNum);
		
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.getReview(placeNum);
//		System.out.println(list.size());
//		for(ReviewDTO dto : list) {
//			System.out.println(dto.toString());
//		}
	
		response.setCharacterEncoding("UTF-8");
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		//System.out.println(result);
		response.getWriter().print(result);
	
	
	}

}
