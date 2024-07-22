package model;

import java.util.Date;

public class DizimosOferta {
	
	private int iddizimooferta;
	private int dzombrid;
	private String dzotipo;
	private float dzovalor;
	private Date dzodtcontribuicao;
	
	
	
	
	
	
	
	
	public DizimosOferta(int dzombrid, String dzotipo, float dzovalor, Date dzodtcontribuicao) {
		this.dzombrid = dzombrid;
		this.dzotipo = dzotipo;
		this.dzovalor = dzovalor;
		this.dzodtcontribuicao = dzodtcontribuicao;
	}
	public DizimosOferta(int iddizimooferta, int dzombrid, String dzotipo, float dzovalor, Date dzodtcontribuicao) {
		this.iddizimooferta = iddizimooferta;
		this.dzombrid = dzombrid;
		this.dzotipo = dzotipo;
		this.dzovalor = dzovalor;
		this.dzodtcontribuicao = dzodtcontribuicao;
	}
	public DizimosOferta() {
		
	}
	public int getIddizimooferta() {
		return iddizimooferta;
	}
	public void setIddizimooferta(int iddizimooferta) {
		this.iddizimooferta = iddizimooferta;
	}
	public int getDzombrid() {
		return dzombrid;
	}
	public void setDzombrid(int dzombrid) {
		this.dzombrid = dzombrid;
	}
	public String getDzotipo() {
		return dzotipo;
	}
	public void setDzotipo(String dzotipo) {
		this.dzotipo = dzotipo;
	}
	public float getDzovalor() {
		return dzovalor;
	}
	public void setDzovalor(float dzovalor) {
		this.dzovalor = dzovalor;
	}
	public Date getDzodtcontribuicao() {
		return dzodtcontribuicao;
	}
	public void setDzodtcontribuicao(Date dzodtcontribuicao) {
		this.dzodtcontribuicao = dzodtcontribuicao;
	}
	
	
	
	
	

}
