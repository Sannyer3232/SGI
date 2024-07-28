package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

public class MembroDAO {

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
			Connection conn = conectar();
			System.out.println(conn);
			conn.close();
		} catch (Exception e) {
			System.out.println(e);

		}
	}

	/** CRUD CREAT **/

	@SuppressWarnings("null")
	public void inserirMembro(MembroJavaBeans membro) {
		String callSpInserir = "call sp_membro_endereco(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		try {
			// Abrindo Conexão
			Connection conn = conectar();

			// Preparando call de procedure
			PreparedStatement pst = conn.prepareStatement(callSpInserir);

			// Substituindo os parametros na Call pelos dados do Javabeans
			pst.setInt(1, membro.getMbrsedeid());
			pst.setString(2, membro.getMbrmemnome());
			pst.setString(3, membro.getMbrcpf());
			pst.setInt(4, membro.getMbrmsuperior());
			pst.setInt(4, membro.getMbrmsuperior());
			pst.setString(5, membro.getMbrnumero_identidade());
			pst.setString(6, membro.getMbremail());
			pst.setString(7, membro.getMbrsenha());
			pst.setString(8, membro.getMbrtelefone());
			pst.setDate(9, new java.sql.Date(membro.getMbrata_nascimento().getTime()));
			pst.setInt(10, membro.getMbrcivilId());
			pst.setString(11, membro.getMbrfotoCaminho());
			pst.setBoolean(12, membro.isMbrativo());
			pst.setString(13, membro.getMbracesso());
			pst.setString(14, membro.getMbrendereco().getEndrua());
			pst.setString(15, membro.getMbrendereco().getEndnumero());
			pst.setString(16, membro.getMbrendereco().getEndbairro());
			pst.setString(17, membro.getMbrendereco().getEndcep());
			pst.setString(18, membro.getMbrendereco().getEndcidade());
			pst.setString(19, membro.getMbrendereco().getEndestado());
			pst.setInt(20, membro.getCargo());
			pst.setInt(21, membro.getMbrfilial());

			// Executar call
			pst.executeUpdate();
			// Encerrar Conexão
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<MembroJavaBeans> listarAniveriantes() {
		ArrayList<MembroJavaBeans> aniversariantes = new ArrayList<>();
		String callsp_aniversariantes = "CALL sp_aniversariantes(?);";
		LocalDate dataAtual = LocalDate.now();

		// Obtém o mês corrente como um objeto Month

		// Obtém o valor numérico do mês (1 a 12)
		int mes = dataAtual.getMonthValue();

		try {
			Connection conn = conectar();
			PreparedStatement pst = conn.prepareStatement(callsp_aniversariantes);
			pst.setInt(1, mes);
			ResultSet rs = pst.executeQuery();
			// Laço executado enquanto houver resgistros

			while (rs.next()) {
				// Variaveis auxiliarias
				String id = rs.getString(1);
				String nome = rs.getString(2);
				String foto = rs.getString(3);
				String ativo = rs.getString(4);
				Date data = rs.getDate(5);
				// Armazenado na Array
				aniversariantes.add(new MembroJavaBeans(id, nome, foto, ativo, data));

			}
			conn.close();
			return aniversariantes;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	public ArrayList<FilialJavaBeans> listarFiliais() {
		ArrayList<FilialJavaBeans> filiais = new ArrayList<>();
		String callsp_filiais = "CALL sp_filial();";

		try {
			Connection conn = conectar();
			PreparedStatement pst = conn.prepareStatement(callsp_filiais);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				String id = rs.getString(1);
				String nome = rs.getString(2);
				filiais.add(new FilialJavaBeans(id, nome));
			}
			conn.close();
			return filiais;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	public ArrayList<MembroJavaBeans> pesquisarMembro(String nome, String status) {
	    ArrayList<MembroJavaBeans> membros = new ArrayList<>();
	    String call_spmembros = "Call sp_membro_dados_nome(?, ?)";

	    try {
	        Connection conn = conectar();
	        PreparedStatement pst = conn.prepareStatement(call_spmembros);
	        
	        // Defina os parâmetros da procedure
	        pst.setString(1, nome);
	        pst.setInt(2, Integer.parseInt(status)); // Converta status para Int
	        
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt(1);
	            String mbrnome = rs.getString(2);
	            String cpf = rs.getString(3);
	            String email = rs.getString(4);
	            String sede = rs.getString(5);
	            String superior = rs.getString(6);
	            String cargo = rs.getString(7);
	            String filial = rs.getString(8);
	            
	            
	            // Verifique se o campo superior é nulo antes de atribuir
	            if (superior == null) {
	                membros.add(new MembroJavaBeans(id,mbrnome, cpf, email,sede, "Sem superior", cargo, filial));
	            } else {
	                membros.add(new MembroJavaBeans(id,mbrnome, cpf, email,sede, superior, cargo, filial));
	            }
	        }
	        
	        conn.close();
	        return membros;
	        
	    } catch (Exception e) {
	        System.out.println(e);
	        return null;
	    }
	}
	
	//CRUD UPADATE
	//Selecionar o membro
	
	public MembroJavaBeans selecaoMembro(int idmembro) {
	    String callspselcionarMembro = "CALL sp_membro_por_id(?);";
	    EnderecoJavaBeans endereco = new EnderecoJavaBeans();
	    
	    try {
	        Connection conn = conectar();
	        PreparedStatement pst = conn.prepareStatement(callspselcionarMembro);
	        pst.setInt(1, idmembro); // Passando o ID do membro para a query
	        ResultSet rs = pst.executeQuery();
	        
	        MembroJavaBeans membro = null; // Inicializando como null para verificar se um membro foi encontrado
	        
	        while (rs.next()) {
	            // Criar um novo objeto MembroJavaBeans com os dados do ResultSet
	            membro = new MembroJavaBeans();
	            membro.setId_Membro(rs.getInt(1));
	            membro.setSedenome(rs.getString(2));
	            membro.setMbrmemnome(rs.getString(3));
	            membro.setMbrcpf(rs.getString(4));
	            membro.setSupnome(rs.getString(5));
	            membro.setMbrnumero_identidade(rs.getString(6));
	            membro.setMbremail(rs.getString(7));
	            membro.setMbrtelefone(rs.getString(9));
	            membro.setMbrata_nascimento(rs.getDate(10));
	            membro.setEstdescricao(rs.getString(11));
	            membro.setMbrfotoCaminho(rs.getString(12));
	            membro.setMbrativo(rs.getBoolean(13));
	            membro.setMbracesso(rs.getString(14));
	            membro.setMbrfilial(rs.getInt(21));
	            
	            endereco.setEndrua(rs.getString(15));
	            endereco.setEndnumero(rs.getString(16));
	            endereco.setEndbairro(rs.getString(17));
	            endereco.setEndcep(rs.getString(18));
	            endereco.setEndcidade(rs.getString(19));
	            endereco.setEndestado(rs.getString(20));
	            
	            membro.setMbrendereco(endereco);
	            
	            // Verificando se o cargo é nulo no banco
	            String cargo = rs.getString(21);
	            if (cargo != null) {
	                membro.setCargoNome(cargo);
	            } else {
	                membro.setCargoNome("Membro Comum");
	            }
	        }
	        
	        conn.close();
	        return membro; // Retorna o membro encontrado (ou null se não encontrado)
	        
	    } catch (Exception e) {
	        System.out.println(e);
	        return null;
	    }
	}

	
	public void updateMembro(MembroJavaBeans membro) {
		String callSpAtulizar = "call sp_atualizar_membro(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		try {
			// Abrindo Conexão
			Connection conn = conectar();

			// Preparando call de procedure
			PreparedStatement pst = conn.prepareStatement(callSpAtulizar);

			// Substituindo os parametros na Call pelos dados do Javabeans
			pst.setInt(1, membro.getId_Membro());
			pst.setInt(2, membro.getMbrsedeid());
			pst.setString(3, membro.getMbrmemnome());
			pst.setString(4, membro.getMbrcpf());
			pst.setInt(5, membro.getMbrmsuperior());
			pst.setString(6, membro.getMbrnumero_identidade());
			pst.setString(7, membro.getMbremail());
			pst.setString(8, membro.getMbrtelefone());
			pst.setDate(9, new java.sql.Date(membro.getMbrata_nascimento().getTime()));
			pst.setInt(10, membro.getMbrcivilId());
			pst.setBoolean(11, membro.isMbrativo());
			pst.setString(12, membro.getMbracesso());
			pst.setString(13, membro.getMbrendereco().getEndrua());
			pst.setString(14, membro.getMbrendereco().getEndnumero());
			pst.setString(15, membro.getMbrendereco().getEndbairro());
			pst.setString(16, membro.getMbrendereco().getEndcep());
			pst.setString(17, membro.getMbrendereco().getEndcidade());
			pst.setString(18, membro.getMbrendereco().getEndestado());
			pst.setInt(19, membro.getCargo());

			// Executar call
			pst.executeUpdate();
			// Encerrar Conexão
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void desativaMembro(MembroJavaBeans membro) {
		String callSpDesativa = "Call sp_desativar_membro(?);";
		
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(callSpDesativa);
			pst.setInt(1, membro.getId_Membro());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	public boolean achaMembro(int membroId) {
		String function = "SELECT f_achou_membro(?);";
		System.out.println(membroId);
		
		boolean achouMembro = false;
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(function);
			pst.setInt(1, membroId);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				achouMembro = rs.getBoolean(1);
				
			}
			return achouMembro;
		
		} catch (Exception e) {
			System.out.println("Erro ao achar o Membro: "  + e);
			return false;
		}
		
	}

	

}
