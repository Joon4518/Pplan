package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class MemberDAO {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
		}

		
	}
	
	// 데이터베이스 종료메소드
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	// ID 중복 검사
	public boolean idCheck(String input) {
		getConnection();
		try {
			String sql = "SELECT * FROM MEMBER WHERE ID =?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, input);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return false;
	}
	
	// 닉네임 중복 검사
	public boolean nickCheck(String input) {
		getConnection();
		try {
			String sql = "SELECT * FROM MEMBER WHERE NICK =?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, input);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return false;
	}
	
	
	// 회원가입 메소드
		public void join(MemberDTO member) {
			//MemberDTO 객체를(sql문에 넣어줄 7가지 정보를 가지고 있는)매개변수로 넣어줌
			getConnection();
			
			try {
				String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,SYSDATE)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, member.getId());
				psmt.setString(2, member.getPw());
				psmt.setString(3, member.getNick());
				psmt.setString(4, member.getEmail());
				
				psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		 public ArrayList<LocaDTO> loca() {
		      
		      
		      
		      getConnection();
		      ArrayList<LocaDTO>list1 = new ArrayList<>();
		      
		      String sql ="SELECT PLACE_LATITUDE, PLACE_LONGITUDE FROM PLACE WHERE PLACE_NUM = (SELECT MARKER_PLACE_ID FROM SCHE_DETAIL WHERE SCHEDULE_ID='pyeon' and detail_id=1 AND MARKER_NUM =?)";
		      
		      try {
		         
		         psmt = conn.prepareStatement(sql);
		         for(int a = 1; a<=4; a++) {
		            psmt.setInt(1,a);
		            rs = psmt.executeQuery();
		            while(rs.next()) {
		               LocaDTO dto = new LocaDTO(rs.getString("PLACE_LATITUDE"),rs.getString("PLACE_LONGITUDE"));
		               list1.add(dto);
		               
		            }
		            
		         }
		         
		         
		         
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      
		      return list1;
		   
		   }
		
		// 로그인 메소드
		public MemberDTO login(MemberDTO dto) {
			MemberDTO info = null;
			getConnection();

			try {
				String sql = "SELECT * FROM MEMBER WHERE ID =? AND PW = ?";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getPw());
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					info = new MemberDTO(rs.getString("id"), rs.getString("pw"), rs.getString("nick"), rs.getString("email"));
				}
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return info;
		}
		
		// 회원정보 수정
		public int update(MemberDTO changeInfo) {
			getConnection();
			int cnt = 0;
			
			try {
				String sql = "UPDATE MEMBER SET  NICK=?, EMAIL=? WHERE ID=? AND PW=?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, changeInfo.getNick());
				psmt.setString(2, changeInfo.getEmail());
				psmt.setString(3, changeInfo.getId());
				psmt.setString(4, changeInfo.getPw());
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;
		}
	      // 게임
	      public ArrayList<MemberDTO> game(MemberDTO dto) {
	            getConnection();
	            
	            ArrayList<String>list = new ArrayList<>();
	            ArrayList<MemberDTO> list2 = new ArrayList<>();
	            
	            try {
	               String sql = "SELECT PLACE_NAME, PLACE_IMG, PLACE_INTRODUCTION FROM PLACE WHERE ((PLACE_TAG LIKE ?) OR (PLACE_TAG LIKE '사계절')) OR (PLACE_TAG LIKE ?)";
	               
	               if (dto.getPlace2().equals("NOT 포토")) {
	                     sql += " AND (PLACE_TAG NOT LIKE '%포토%')";
	                 }
	              if (dto.getPlace3().equals("NOT 혼자")) {
	                     sql += " AND (PLACE_TAG NOT LIKE '%혼자%')";
	                 }
	              if (dto.getPlace2().equals("NOT 실내")) {
	                     sql += " AND (PLACE_TAG NOT LIKE '%실내%')";
	                 }
	               
	               psmt = conn.prepareStatement(sql);
	               psmt.setString(1, "%" + dto.getPlace1() + "%");
	               psmt.setString(2, "%" + dto.getPlace5() + "%");
	               
	               rs = psmt.executeQuery();
	               
	               while(rs.next()) {
	                  String place_name = rs.getString("PLACE_NAME");
	                  String place_img = rs.getString("PLACE_IMG");
	                  String place_content = rs.getString("PLACE_INTRODUCTION");
	                  
	                  
	                 MemberDTO dto2 = new MemberDTO(place_name, place_img, place_content);
	                  // list.add(rs.getString("PLACE_NAME"));
	                 list2.add(dto2);
	               }
	               
	               
	               
	            } catch (SQLException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }finally {
	               close();
	            }
	            
	            return list2;
	            
	         }

	
}
