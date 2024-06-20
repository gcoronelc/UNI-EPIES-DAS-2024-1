
package pe.edu.uni.sisteureka.prueba;

import pe.edu.uni.sisteureka.service.CuentaService;


public class Prueba02 {
	
	public static void main(String[] args) {
		
		try {
			// Datos
			String cuenta = "00100001";
			double importe = 2000;
			String empleado = "0003";
			// Proceso
			CuentaService service = new CuentaService();
			service.deposito(cuenta, importe, empleado);
			System.out.println("Proceso Ok.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
	}
	
	
	
}
