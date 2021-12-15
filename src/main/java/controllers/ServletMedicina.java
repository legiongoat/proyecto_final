package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.beans.Medicamento;
import models.daos.MedicinasDao;

/**
 * Servlet implementation class ServletMedicina
 */
@WebServlet("/ServletMedicina")
public class ServletMedicina extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletMedicina() {
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
			List<String> medicinas = medicinasDao.getMedicamentos();
			request.setAttribute("medicinas", medicinas);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				List<String> medicinas = medicinasDao.getMedicamentos();
				request.setAttribute("medicinas", medicinas);
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		} finally {
			if (request.getSession(true).getAttribute("rol").equals("sanitario"))
				getServletContext().getRequestDispatcher("/ServletSanitario").forward(request, response);
			else
				getServletContext().getRequestDispatcher("/ServletMedico").forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
