import java.text.SimpleDateFormat;
import java.util.ArrayList;

import controller.DizimoOfertaController;
import model.DizimosOferta;
import model.DizimosOfertaDAO;

public class testes {

	public static void main(String[] args) {
		
		DizimosOfertaDAO dao = new DizimosOfertaDAO();
		DizimoOfertaController controller = new DizimoOfertaController();
		
		ArrayList<DizimosOferta>  lista = dao.consultaDizimoOferta(7, 2024, "Dizimo");
		
		for(DizimosOferta dizimo : lista) {
			System.out.println(dizimo.getDzovalor());
		}
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		

	}
	
	

}
