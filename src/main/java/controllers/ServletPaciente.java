package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.beans.Medicamento;
import models.daos.MedicinasDao;

public class ServletPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletPaciente() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MedicinasDao medicinasDao = new MedicinasDao();
		try {
			if (request.getParameter("nombre") != null) {
				Medicamento medicamento = medicinasDao.getMedicamentoByNombre(request.getParameter("nombre"));
				request.setAttribute("medicamento", medicamento);
			}
			
			if (request.getParameter("nombrePaciente") != null && request.getParameter("nombrePaciente") != "") {
				String nombrePaciente = request.getParameter("nombrePaciente");
				int id = Integer.parseInt(
						nombrePaciente.substring(nombrePaciente.indexOf("(") + 1, nombrePaciente.indexOf(")")));
				String datos = medicinasDao.getDatosDeUsuario(id);
				request.setAttribute("datos", datos);
			}
			if (request.getAttribute("nombrePaciente") != null) {
				
				String datos = medicinasDao.getDatosDeUsuario((String) request.getSession(true).getAttribute("usuario"));
				request.setAttribute("datos", datos);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/paciente.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
