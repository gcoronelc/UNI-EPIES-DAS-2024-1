package pe.edu.uni.sisteureka.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.uni.sisteureka.db.AccesoDB;
import pe.edu.uni.sisteureka.dto.EmpleadoDto;

public class LogonService {
	
	public EmpleadoDto validar(String usuario, String clave){
		Connection cn = null;
		String sql;
		PreparedStatement pstm;
		ResultSet rs;
		EmpleadoDto bean = null;
		try {
			cn = AccesoDB.getConnection();
			sql = "select chr_emplcodigo, vch_emplpaterno, vch_emplmaterno, ";
			sql += "vch_emplnombre, vch_emplciudad, vch_empldireccion, ";
			sql += "vch_emplusuario, '******' vch_emplclave ";
			sql += "from Empleado where vch_emplusuario=? and vch_emplclave=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, usuario);
			pstm.setString(2, clave);
			rs = pstm.executeQuery();
			if(!rs.next()){
				throw new SQLException("Datos incorrectos");
			}
			bean = new EmpleadoDto();
			bean.setCodigo(rs.getString("chr_emplcodigo"));
			bean.setNombre(rs.getString("vch_emplnombre"));
			
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso, intentelo despues.");
		} finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return bean;
	}
	
}
