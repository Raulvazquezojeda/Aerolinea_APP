package objetoscrm;

import java.io.IOException;
import java.sql.SQLException;

import mipk.beanDB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class vertablagrupos
 */
public class vertablagrupos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vertablagrupos() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		beanDB db = new beanDB();
		boolean okdb = false;
		String resultado = "";
		String etapa = request.getParameter("etapa");
		if (etapa==null) etapa="";
		
		
		try {
			db.conectarBD();
			okdb = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (okdb) {
			String query="select idGrupo, Profesores_idProfesor, etapas_idEtapa from grupos where etapas_idEtapa like '" + etapa + "%'";
			String [][] tablares = null;
			try {
				tablares = db.resConsultaSelectA3(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (tablares != null) {
				
				resultado = "<table style=''>";
				for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
					resultado += "<tr>";
					resultado += "<td>" + tablares[i][0] + "</td>";
					resultado += "<td>" + tablares[i][1] + "</td>";
					resultado += "<td>" + tablares[i][2] + "</td>";
					resultado += "</tr>";
				}
				resultado += "</table>";
				
			}
			db.desconectarBD();
		}
		else resultado = "No se pudo conectar con la BBDD.";
		
		response.getOutputStream().print(resultado);
		response.getOutputStream().flush();
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
