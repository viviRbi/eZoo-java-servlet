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

@WebServlet("/addFeedingSchedule")

public class AddFeedingScheduleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("AnimalCareHome.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isSuccess= false;
		FeedingSchedule s = new FeedingSchedule();
		
		long schedule_id = Long.parseLong(request.getParameter("schedule_id"));
		s.setSchedule_ID(schedule_id);
		s.setFeeding_time(request.getParameter("feeding_time"));
		s.setRecurrence(request.getParameter("recurrence"));
		s.setFood(request.getParameter("food"));
		s.setNotes(request.getParameter("notes"));
		
		FeedingScheduleDAO sdao = DAOUtilities.getFeedingScheduleDao();
	
		try {
			isSuccess = sdao.saveAddedFeedingSchedule(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
