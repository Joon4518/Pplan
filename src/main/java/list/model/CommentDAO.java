package list.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.text.Document;

public class CommentDAO {
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
   
   
   public void insert(CommentDTO dto) {
      getConnection();
      String sql="INSERT INTO COMMENTS VALUES(com_seq.nextval,?,?)";
      try {
         psmt=conn.prepareStatement(sql);
         psmt.setInt(1, dto.getSchedule_id());
         psmt.setString(2, dto.getContent());
         psmt.executeUpdate();
      
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }
   }
   public void recInsert(CommentDTO dto) {
       getConnection();
       String sql="insert into recommend (mem_id, sche_id, place, sche_like) select storage_id, schedule_id, sche, 0 from storage where schedule_id=?";
       try {
          psmt=conn.prepareStatement(sql);
          psmt.setInt(1, dto.getSchedule_id());
          psmt.executeUpdate();
       
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }finally {
          close();
       }
    }

   

}