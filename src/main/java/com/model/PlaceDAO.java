package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import list.model.PlaceDTO;

public class PlaceDAO {
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

	// 장소 데이터 넣는 메소드
	public void placeInsert(PlaceDTO place) {
		// 데이터베이스 연결메소드
		getConnection();
		
		try {
			String sql = "INSERT INTO PLACE VALUES(?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
//			psmt.setString(1, place.getContentscd());
//			psmt.setString(2, place.getName());
//			psmt.setString(3, place.getLatitude());
//			psmt.setString(4, place.getLongitude());
//			psmt.setString(5, place.getAddress());
//			psmt.setString(6, place.getImagepath());
//			psmt.setString(7, place.getIntroduction());
//			psmt.setString(8, place.getTag());
//			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

	}
	// 장소의 모든정보 가져옴
	public ArrayList<PlaceDTO> placeAll(){
		ArrayList<PlaceDTO> placeAll = new ArrayList<>();
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM PLACE";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

//			while(rs.next()) {
//				placeAll.add(new PlaceDTO(rs.getString(1),rs.getString(2),
//						rs.getString(3),rs.getString(4),rs.getString(5),
//						rs.getString(6),rs.getString(7),rs.getString(8)));
//			}
			return placeAll;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return placeAll;
	}
	
	
	// 장소 선택 메소드 테스트 중
	public PlaceDTO placeSelect(String place_name){
		PlaceDTO placeData = null;
		
		getConnection();
		
		try {
			String sql = "SELECT * FROM PLACE WHERE PLACE_NAME = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, place_name);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				placeData =  new PlaceDTO(rs.getString(1),rs.getString(2),
						rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9));
			}
			return placeData;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return placeData;
	}

	
}
