
package pe.edu.uni.sisteureka.prueba;

import java.sql.Connection;
import pe.edu.uni.sisteureka.db.AccesoDB;


public class Prueba01 {
	
	public static void main(String[] args) {
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Acceso Ok.");
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
