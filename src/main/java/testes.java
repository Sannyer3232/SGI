import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


import model.MembroDAO;
import model.MembroJavaBeans;

public class testes {

	public static void main(String[] args) {
		MembroDAO dao = new MembroDAO();
		String email = "sannyer@gmail.com";
		String senha = "07114915";
		
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(senha.getBytes());
			byte[] digest = md.digest();

			
			StringBuilder sb = new StringBuilder();
			for (byte b : digest) {
				sb.append(String.format("%02x", b & 0xff));
			}
				senha = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		MembroJavaBeans membro = dao.login(email, senha);
		System.out.println("Nome: " + membro.getMbrnome());
	
	}
}
