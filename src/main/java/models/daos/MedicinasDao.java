package models.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Driver;

import models.beans.Login;
import models.beans.Medicamento;
import models.beans.Registro;

public class MedicinasDao {

	public static final String USUARIO = "root";
	public static final String CLAVE = "1234";
	private Connection conexion;

	public Connection getConexion() {
		return conexion;
	}

	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}

	public void conectar() throws SQLException {
		DriverManager.registerDriver(new Driver());
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectos_medicinas", MedicinasDao.USUARIO,
				MedicinasDao.CLAVE);
		setConexion(conexion);
	}

	public Login verificaUsuario(String usuario, String clave) throws SQLException {

		Login resultado = new Login();
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"select u.usuario,r.rol, u.nombre, u.apellidos from tb_registro u, roles r  where u.usuario=? and u.clave=? and u.roles_id=r.id");
		pst.setString(1, usuario);
		pst.setString(2, clave);
		ResultSet rs = pst.executeQuery();
		if (!rs.next()) {
			resultado.setResultado(false);
		} else {
			resultado.setResultado(true);
			resultado.setUsuario(rs.getString(1));
			resultado.setRol(rs.getString(2));
			resultado.setNombrePaciente(rs.getString(3)+" "+rs.getString(4));
		}
		getConexion().close();

		return resultado;
	}

	public String getDatosDeUsuario(String usuario) throws SQLException {
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"select tb.datos, m.nombre_medicamento from tipos_medicinas m, tipos_medicinas_tb_registro tb, tb_registro r where "
						+ "tb.tb_registro_id=r.id and r.usuario=? and m.id=tb.tipos_medicinas_id");
		pst.setString(1, usuario);
		StringBuilder resultado = new StringBuilder();
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			resultado.append( rs.getString(1) + "\n");
		}
		return resultado.toString();
	}
	
	public String getDatosDeUsuario(int id ) throws SQLException {
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"select m.nombre_medicamento, tb.datos from tb_registro r,tipos_medicinas m,tipos_medicinas_tb_registro tb"
				+ " where tb.tipos_medicinas_id=m.id and tb.tb_registro_id=? and r.id=tb.tb_registro_id");
		pst.setInt(1, id);
		StringBuilder resultado = new StringBuilder();
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			resultado.append(rs.getString(2) + "\n");
		}
		return resultado.toString();
	}

	public void grabaUsuario(String usuario, String clave, String nombre, String apellidos, int tipo)
			throws SQLException {
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"insert into tb_registro (usuario,clave,nombre,apellidos,roles_id) values (?,?,?,?,?)");
		pst.setString(1, usuario);
		pst.setString(2, clave);
		pst.setString(3, nombre);
		pst.setString(4, apellidos);
		pst.setInt(5, tipo);
		pst.execute();
		getConexion().close();

	}

	public List<String> getMedicamentos() throws SQLException {
		conectar();
		PreparedStatement pst = getConexion()
				.prepareStatement("select nombre_medicamento from tipos_medicinas order by nombre_medicamento");
		List<String> medicinas = new ArrayList<>();
		ResultSet rs = pst.executeQuery();
		while (rs.next())
			medicinas.add(rs.getString(1));
		getConexion().close();
		return medicinas;
	}

	public Medicamento getMedicamentoByNombre(String nombre) throws SQLException {
		Medicamento medicamento = new Medicamento();
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"select id,tipo_medicamento,nombre_medicamento,generalidades,indicaciones,cuidados,ram,link_ficha_tecnica"
						+ " from tipos_medicinas where nombre_medicamento=?");
		pst.setString(1, nombre);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			medicamento.setId(rs.getInt(1));
			medicamento.setTipoMedicamento(rs.getString(2));
			medicamento.setNombreMedicamento(rs.getString(3));
			medicamento.setGeneralidades(rs.getString(4));
			medicamento.setIndicaciones(rs.getString(5));
			medicamento.setCuidados(rs.getString(6));
			medicamento.setRam(rs.getString(7));
			medicamento.setLinkFichaTecnica(rs.getString(8));
		}
		getConexion().close();
		return medicamento;
	}

	public List<Registro> getPacientes() throws SQLException {
		List<Registro> pacientes= new ArrayList<>();
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"select id,usuario,nombre,apellidos"
						+ " from tb_registro where  roles_id=3 order by apellidos,nombre");
		ResultSet rs= pst.executeQuery();
		while(rs.next()) {
			Registro registro= new Registro(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			pacientes.add(registro);
		}
		getConexion().close();
		return pacientes;
	}

	public void grabaRecetaDePaciente(int idPaciente, int idMedicamento, String receta) throws SQLException {
		List<String> pacientes= new ArrayList<>();
		conectar();
		PreparedStatement pst = getConexion().prepareStatement(
				"insert into tipos_medicinas_tb_registro (tipos_medicinas_id,tb_registro_id,datos) values (?,?,?)");
		pst.setInt(2, idPaciente);
		pst.setInt(1, idMedicamento);
		pst.setString(3, receta);
		 pst.execute();
		
		getConexion().close();
		
	}

	

}
