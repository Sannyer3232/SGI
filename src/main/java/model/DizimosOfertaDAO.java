
package model;
//Importações necessárias
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DizimosOfertaDAO {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/bdsgi?useTimezone=true&serverTimezone=UTC";
	private String user = "sannyerAdmin";
	private String password = "07114915Sa@";
	
	private Connection conectar() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			return conn;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// teste de conexão
	public void testeConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
			System.out.println(e);

		}
	}
	
	
	public void insereContribuicao(DizimosOferta dizimoOferta) {
		
		//Comando sql que chama a procedure no banco de dados
		String callSpNovaContribuicao = "call novo_dizomo_oferta(?,?,?,?)";
		try {
			//Abrindo a conexão com banco de dados
			Connection con = conectar();
			
			//Preparando o comando sql
			PreparedStatement pst = con.prepareStatement(callSpNovaContribuicao);
			
			//Inseriando os parametros no comando sql
			pst.setInt(1, dizimoOferta.getDzombrid());
			pst.setString(2, dizimoOferta.getDzotipo());
			pst.setFloat(3, dizimoOferta.getDzovalor());
			pst.setDate(4, new java.sql.Date(dizimoOferta.getDzodtcontribuicao().getTime()));
			
			pst.executeUpdate();
			
			con.close();
			
			
			
		} catch (Exception e) {
			System.out.println("Erro Dizimo: " + e);
		}
	}
	


}
