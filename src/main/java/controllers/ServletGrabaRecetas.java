package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.beans.Medicamento;
import models.beans.Registro;
import models.daos.MedicinasDao;

public class ServletGrabaRecetas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletGrabaRecetas() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MedicinasDao medicinasDao = new MedicinasDao();
		try {
			
			if (request.getParameter("nombreMedicamento") != null) {
				Medicamento medicamento = medicinasDao.getMedicamentoByNombre(request.getParameter("nombreMedicamento"));
				request.setAttribute("medicamento", medicamento);
			}
			if(request.getParameter("nombrePaciente")!=null && request.getParameter("receta")!=null) {
				String nombrePaciente=request.getParameter("nombrePaciente");
				int id=Integer.parseInt(nombrePaciente.substring(nombrePaciente.indexOf("(")+1,nombrePaciente.indexOf(")")));
				
				medicinasDao.grabaRecetaDePaciente(id,Integer.parseInt(request.getParameter("idMedicamento")),request.getParameter("nombreMedicamento")+": "+request.getParameter("receta"));
				String datos=medicinasDao.getDatosDeUsuario(request.getParameter("nombrePaciente"));
				request.setAttribute("datos", datos);
			}
			List<Registro> pacientes=medicinasDao.getPacientes();
			List<String> medicinas= medicinasDao.getMedicamentos();
			request.setAttribute("medicinas", medicinas);
			request.setAttribute("pacientes", pacientes);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/ServletMedico").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
