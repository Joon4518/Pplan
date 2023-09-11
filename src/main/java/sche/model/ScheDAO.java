package sche.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ScheDAO {
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

   public ArrayList<ScheDTO> getsche(String id) {
      
      ArrayList<ScheDTO> list  = new ArrayList<>();
      
      getConnection();
      
      String sql = "select * from storage where storage_ID = ? ORDER BY SAVE_TIME DESC";
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);
         
         rs = psmt.executeQuery();
         
         while(rs.next()) {
            String storage_id = rs.getString(1);
            int schedule_id = rs.getInt(2);
            String sche = rs.getString(4);
            
            ScheDTO info = new ScheDTO(storage_id, schedule_id, sche);
            list.add(info);
            
         }
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
      
      
      return list;
      
   }
   
   public int likeUpdate(int scheId) {
      int like = 0;
      getConnection();
      String sql = "UPDATE RECOMMEND SET SCHE_LIKE=SCHE_LIKE+1 WHERE SCHE_ID=?";
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, scheId);
         psmt.executeUpdate();

         sql = "SELECT SCHE_LIKE FROM RECOMMEND WHERE SCHE_ID=?";
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, scheId);

         rs = psmt.executeQuery();

         if (rs.next()) {
               like = rs.getInt("SCHE_LIKE");
           }

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close();
      }
      return like;
   }
   
   
   
}