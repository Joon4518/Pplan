package list.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO {
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

   public ArrayList<ReviewDTO> getReview(int placeNum) {
      // TODO Auto-generated method stub
      
      ArrayList<ReviewDTO> list  = new ArrayList<>();
      
      getConnection();
      
      String sql = "select * from review where review_num = ?";
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, placeNum);
         
         rs = psmt.executeQuery();
         
         while(rs.next()) {
            int review_num = rs.getInt(1);
            String review_rating = rs.getString(2);
            String review_info = rs.getString(3);
            String review_name = rs.getString(4);
            
            ReviewDTO info = new ReviewDTO(review_num, review_rating, review_info, review_name);
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
   public ArrayList<FdReviewDTO> getFdReview(int foodNum) {
         // TODO Auto-generated method stub
         
         ArrayList<FdReviewDTO> list  = new ArrayList<>();
         
         getConnection();
         
         String sql = "SELECT * FROM FOOD_REVIEW WHERE FD_REVIEW_NUM = ?";
         
         try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, foodNum);
            
            rs = psmt.executeQuery();
            
            while(rs.next()) {
               int fd_review_num = rs.getInt("FD_REVIEW_NUM");
               String fd_review_name = rs.getString("FD_REVIEW_NAME");
               String fd_review_rating = rs.getString("FD_REVIEW_RATING");
               String fd_review_info = rs.getString("FD_REVIEW_INFO");
               
               FdReviewDTO info = new FdReviewDTO(fd_review_num, fd_review_name, fd_review_rating, fd_review_info);
               
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

}





















