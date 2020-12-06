package com.examples.ezoo.servlets;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.examples.ezoo.dao.AnimalDAO;
import com.examples.ezoo.dao.DAOUtilities;
import com.examples.ezoo.model.Animal;


/**
 * Servlet implementation class AnimalCareServlet
 */
@WebServlet("/animalDetail")

public class ViewAnimalDetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("animalID");
		long animalID = Long.parseLong(id);
		// Grab a list of Animals from the Database
		AnimalDAO dao = DAOUtilities.getAnimalDao();
		Animal a = dao.getAnimalByID(animalID);

		// Populate the list into a variable that will be stored in the session

		request.getSession().setAttribute("animal", a);
		request.getRequestDispatcher("viewAnimalDetail.jsp").forward(request, response);
	}


}
