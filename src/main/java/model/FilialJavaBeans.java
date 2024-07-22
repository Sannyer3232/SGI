package model;

public class FilialJavaBeans {
	

	private int idfilial;
	private int filsedeid;
	private String filnome;
	private String filtefone;
	private String filemail;
	
	public FilialJavaBeans(){}
	
	public FilialJavaBeans(int idfilial, int filsedeid, String filnome, String filtefone, String filemail) {
		super();
		this.idfilial = idfilial;
		this.filsedeid = filsedeid;
		this.filnome = filnome;
		this.filtefone = filtefone;
		this.filemail = filemail;
	}
	
	

	public FilialJavaBeans(String idfilial, String filnome) {
	
		this.idfilial = Integer.parseInt(filnome);
		this.filnome = filnome;
	}

	public int getIdfilial() {
		return idfilial;
	}
	public void setIdfilial(int idfilial) {
		this.idfilial = idfilial;
	}
	public int getFilsedeid() {
		return filsedeid;
	}
	public void setFilsedeid(int filsedeid) {
		this.filsedeid = filsedeid;
	}
	public String getFilnome() {
		return filnome;
	}
	public void setFilnome(String filnome) {
		this.filnome = filnome;
	}
	public String getFiltefone() {
		return filtefone;
	}
	public void setFiltefone(String filtefone) {
		this.filtefone = filtefone;
	}
	public String getFilemail() {
		return filemail;
	}
	public void setFilemail(String filemail) {
		this.filemail = filemail;
	}
	
	

}
