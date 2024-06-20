package pe.edu.uni.sisteureka.controller;

import pe.edu.uni.sisteureka.service.LogonService;

public class LogonController {
	
	private LogonService logonService;

	public LogonController() {
		logonService = new LogonService();
	}
	
	
	public void validar(String usuario, String clave){
		logonService.validar(usuario, clave);
	}
	
}
