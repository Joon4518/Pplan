package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StorageDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;


	// 데이터베이스 연결메소드
	public void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa4_Spring_hacksim_6";
			String db_pw = "aishcool6";
			
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("ojdbc6.jar 또는 경로를 체크하세요!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
		}
			
	}

	// 데이터베이스 종료메소드
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void saveStorage(StorageDTO storage) {
		//MemberDTO 객체를(sql문에 넣어줄 7가지 정보를 가지고 있는)매개변수로 넣어줌
		getConnection();
		
		try {
			String sql = "INSERT INTO STORAGE VALUES(?,sche_seq.nextval,SYSDATE,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, storage.getStorage_id());
			psmt.setString(2, storage.getSchedule_detail());
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
	}
	
	
}
