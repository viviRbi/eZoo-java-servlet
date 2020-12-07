package com.examples.ezoo.servlets;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.examples.ezoo.dao.FeedingScheduleDAO;
import com.examples.ezoo.dao.DAOUtilities;
import com.examples.ezoo.model.FeedingSchedule;

@WebServlet("/editFeedingSchedule")
public class EditFeedingScheduleServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isSuccess= false;
	
		if(isSuccess){
	        request.getSession().setAttribute("message", "A new schedule had been successfully published");
	        request.getSession().setAttribute("messageClass", "alert-success");
	        response.sendRedirect(request.getHeader("Referer"));
	    } else {
	        request.getSession().setAttribute("message", "There was a problem publishing the schedule");
	        request.getSession().setAttribute("messageClass", "alert-warning");
	        request.getRequestDispatcher("AnimalCareHome.jsp").forward(request, response);
	    }
	}
}
