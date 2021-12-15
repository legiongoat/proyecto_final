package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.daos.MedicinasDao;

public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletRegistro() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario=request.getParameter("usuario");
		String clave=request.getParameter("clave");
		String nombre=request.getParameter("nombre");
		String apellidos=request.getParameter("apellidos");
		String tipo=request.getParameter("tipo");
		MedicinasDao medicinasDao= new MedicinasDao();
		try {
			medicinasDao.grabaUsuario(usuario,clave,nombre,apellidos,Integer.parseInt(tipo));
			response.sendRedirect("registro.jsp?resultado=usuario grabado correctamente");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("registro.jsp?error=Error de sistema");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
