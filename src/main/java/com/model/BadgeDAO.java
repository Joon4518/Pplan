package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BadgeDAO {

   private Connection conn;
   private PreparedStatement psmt;
   private ResultSet rs;
   
   // 데이터베이스 연동 메서드
   public void getConnection() {
      
      // 드라이버 동적로딩
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");


      // DB 로그인 정보 받아오기
      String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
      String db_id = "Insa4_Spring_hacksim_6";
      String db_pw = "aishcool6";
         
      // 연결 권한 요청
      conn = DriverManager.getConnection(db_url, db_id, db_pw);
      
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
         System.err.println("ojdbc6.jar 또는 경로를 체크하세요!");
      } catch (SQLException e) {
         e.printStackTrace();
         System.err.println("DB 연결에 필요한 정보가 맞는지 체크하세요!");
      } 
   }
   
   
   // 데이터베이스 연결 종료 메서드
   public void close() {
      // 연결종료
      try {
         if(rs!=null) {
            rs.close();
         }
         if(psmt!=null){
            psmt.close();
         }
         if(conn!=null){
            conn.close();
         }
      }catch (SQLException e) {
         e.printStackTrace();
      }
   }
   
   
   
   // 뱃지 확인 메서드
   public ArrayList<BadgeDTO> badge(String id){
      ArrayList<BadgeDTO> list = new ArrayList<>();
      
      getConnection();
      
      try {
         String sql = "SELECT * FROM BADGE A, MEM_BADGE B WHERE A.BADGE_ID = B.BADGE_ID AND B.MEM_BADGE_ID = ?";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);
         rs = psmt.executeQuery();
         
         while(rs.next()){
            // 데이터 존재 시, 각 컬럼에 저장된 값 가져오기
            int badge_id = rs.getInt("badge_id");
            String badge_name = rs.getString("badge_name");
            String badge_img = rs.getString("badge_img");
            String mem_badge_id = rs.getString("mem_badge_id");
            
            
            // 가져온 값을 list에 담아주기 위해서 BadgeDTO로 묶어준다
            BadgeDTO dto = new BadgeDTO(badge_id, badge_name, badge_img, mem_badge_id);
            list.add(dto);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return list;
   }
}