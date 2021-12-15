package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.beans.Login;
import models.daos.MedicinasDao;

/**
 * Servlet implementation class ServletController
 */
public class ServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MedicinasDao medicinasDao= new MedicinasDao();
		try {
			Login login=medicinasDao.verificaUsuario(request.getParameter("usuario"),request.getParameter("clave"));

			if(!login.isResultado())
			{
				request.setAttribute("error", "usuario o clave invalidos");
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
			else
			{
				request.getSession(true).setAttribute("rol", login.getRol());
				request.getSession(true).setAttribute("usuario", login.getUsuario());
				request.setAttribute("nombrePaciente", login.getNombrePaciente());
				switch(login.getRol()) {
				case "medico":
					getServletContext().getRequestDispatcher("/ServletMedico").forward(request, response);
					break;
				case "sanitario":
					getServletContext().getRequestDispatcher("/ServletSanitario").forward(request, response);
					break;
				case "paciente":
					getServletContext().getRequestDispatcher("/ServletPaciente").forward(request, response);
					break;
					
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorLogin", "error de sistema");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
