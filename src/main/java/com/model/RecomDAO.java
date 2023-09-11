package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecomDAO {
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

   // 추천 장소 좌표 가져오는 메소드
   public ArrayList<String> recommend() {
      getConnection();
      ArrayList<String>place = new ArrayList<>();

      
      try {
         String sql = "SELECT PLACE FROM RECOMMEND";
         psmt = conn.prepareStatement(sql);
         rs = psmt.executeQuery();
         while(rs.next()) {
            place.add(rs.getString("PLACE"));
         }
         

         
      
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
      
      
      
      return place;
   }
   
   
   public ArrayList<RecomDTO> reco_map(ArrayList<String> place_nm) {
         
      ArrayList<RecomDTO>map = new ArrayList<>();
      
      getConnection();
      String sql="SELECT PLACE_LATITUDE, PLACE_LONGITUDE FROM PLACE WHERE PLACE_NAME=?";
      try {
         psmt = conn.prepareStatement(sql);
         for(int a = 0; a<place_nm.size();a++) {
            psmt.setString(1,place_nm.get(a));
            rs = psmt.executeQuery();
            if(rs.next()) {
               RecomDTO dto = new RecomDTO(rs.getString("PLACE_LATITUDE"),rs.getString("PLACE_LONGITUDE"),place_nm.get(a));
               map.add(dto);
            }
            
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
      
   
      
      return map;
   }
   
   public ArrayList<RecomDTO> getRec() {
      
      ArrayList<RecomDTO> recInfo = new ArrayList<>();
      
      getConnection();
      String sql="SELECT * FROM RECOMMEND ORDER BY SCHE_LIKE DESC";
      
      
      try {
         psmt = conn.prepareStatement(sql);
         
            rs = psmt.executeQuery();
            
            while(rs.next()) {
               String mem_id = rs.getString("MEM_ID");
               int sche_id = rs.getInt("SCHE_ID");
               String place = rs.getString("PLACE");
               int sche_like = rs.getInt("SCHE_LIKE");
               
               RecomDTO dto = new RecomDTO(mem_id, sche_id, place, sche_like);
               recInfo.add(dto);
            }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
      
      return recInfo;
   }
   //한줄평 가져오는 메소드
   public String review(String scheId) {
      getConnection();
      String review = null;
      
      try {
         String sql="SELECT CONTENT FROM COMMENTS WHERE SCHEDULE_ID=?";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1,scheId);
         rs = psmt.executeQuery();
         if(rs.next()) {
            review = rs.getString("CONTENT");
         }
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
   
      
      return review;
      
   }

   
}