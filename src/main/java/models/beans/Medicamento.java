package models.beans;

public class Medicamento {

	private int id;
	private String tipoMedicamento, nombreMedicamento, generalidades, indicaciones, cuidados, ram, linkFichaTecnica;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipoMedicamento() {
		return tipoMedicamento;
	}
	public void setTipoMedicamento(String tipoMedicamento) {
		this.tipoMedicamento = tipoMedicamento;
	}
	public String getNombreMedicamento() {
		return nombreMedicamento;
	}
	public void setNombreMedicamento(String nombreMedicamento) {
		this.nombreMedicamento = nombreMedicamento;
	}
	public String getGeneralidades() {
		return generalidades;
	}
	public void setGeneralidades(String generalidades) {
		this.generalidades = generalidades;
	}
	public String getIndicaciones() {
		return indicaciones;
	}
	public void setIndicaciones(String indicaciones) {
		this.indicaciones = indicaciones;
	}
	public String getCuidados() {
		return cuidados;
	}
	public void setCuidados(String cuidados) {
		this.cuidados = cuidados;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getLinkFichaTecnica() {
		return linkFichaTecnica;
	}
	public void setLinkFichaTecnica(String linkFichaTecnica) {
		this.linkFichaTecnica = linkFichaTecnica;
	}
}
