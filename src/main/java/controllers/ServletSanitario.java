package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.daos.MedicinasDao;

public class ServletSanitario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletSanitario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MedicinasDao medicinasDao= new MedicinasDao();
		try {
			List<String> medicinas=medicinasDao.getMedicamentos();
			request.setAttribute("medicinas", medicinas);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/sanitario.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
