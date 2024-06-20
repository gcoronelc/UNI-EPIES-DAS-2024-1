
package pe.edu.uni.sisteureka.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.uni.sisteureka.db.AccesoDB;

public class CuentaService {

public void deposito(String cuenta, double importe, String empleado) {
		// Variables
		Connection cn = null;
		String sql;
		PreparedStatement pstm;
		ResultSet rs;
		int cont, contMov, filas;
		double saldo;
		// Proceso
		try {
			// Inicio de Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Verificar importe
			if(importe<=0){
				throw new SQLException("El importe debe ser positivo.");
			}
			// Verificar cuenta
			sql = "select count(1) cont from Cuenta where chr_cuencodigo=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, cuenta);
			rs = pstm.executeQuery();
			rs.next();
			cont = rs.getInt("cont");
			rs.close();
			pstm.close();
			if (cont != 1) {
				throw new SQLException("Cuenta no existe.");
			}
			// Datos de la cuenta
			sql = "select dec_cuensaldo, int_cuencontmov ";
			sql += "from Cuenta where chr_cuencodigo=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, cuenta);
			rs = pstm.executeQuery();
			rs.next();
			saldo = rs.getDouble("dec_cuensaldo");
			contMov = rs.getInt("int_cuencontmov");
			rs.close();
			pstm.close();
			// Actualizar la cuenta
			saldo += importe;
			contMov++;
			sql = "update cuenta set dec_cuensaldo = ? ,";
			sql += "int_cuencontmov = ? where chr_cuencodigo = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setDouble(1, saldo);
			pstm.setInt(2, contMov);
			pstm.setString(3, cuenta);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas != 1) {
				throw new SQLException("Error en el proceso..");
			}
			// Registrar movimiento
			sql = "insert into Movimiento(chr_cuencodigo,";
			sql += "int_movinumero,dtt_movifecha,chr_emplcodigo,";
			sql += "chr_tipocodigo,dec_moviimporte) ";
			sql += "values(?,?,getdate(),?,'003',?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, cuenta);
			pstm.setInt(2, contMov);
			pstm.setString(3, empleado);
			pstm.setDouble(4, importe);
			pstm.executeUpdate();
			pstm.close();
			// Confirmar Tx
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback(); // Cancela la Tx
			} catch (Exception e1) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback(); // Cancela la Tx
			} catch (Exception e1) {
			}			
			throw new RuntimeException("Error en el proceso, intentelo mas tarde.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}	
}
