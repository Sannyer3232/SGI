package controller;

import java.io.FileWriter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.DizimosOferta;
import model.DizimosOfertaDAO;

public class JSONGenerators {
	
	public JSONGenerators () {}
	
	public void JSONDizimos(String tipo) {
		
		DizimosOfertaDAO dao = new DizimosOfertaDAO();
		
		ArrayList<DizimosOferta> contribuicoes = dao.listarDizimos(tipo);
		
		FileWriter writefile = null;
		JSONArray dizimosOfertas = new JSONArray();
		
		for(DizimosOferta dizimoOferta : contribuicoes) {
			JSONObject objeto = new JSONObject();
			objeto.put("valor", dizimoOferta.getDzovalor());
			objeto.put("data", dizimoOferta.getDzodtcontribuicao().toString());
			objeto.put("filial", dizimoOferta.getDzoFilialNome());
			
			dizimosOfertas.add(objeto);
		}
		
		try {
			
			writefile = new FileWriter("C:/Users/user/eclipse-workspace/SGI/src/main/webapp/JSON/"+tipo+".json");
			writefile.write(dizimosOfertas.toJSONString());
			writefile.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

	}

}
