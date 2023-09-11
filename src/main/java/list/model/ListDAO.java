package list.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.MemberDTO;

public class ListDAO {
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

	// 관광지 목록 불러오기
	public ArrayList<PlaceDTO> placeGet() {
		ArrayList<PlaceDTO> pg = new ArrayList<>();
		getConnection();

		try {
			String sql = "SELECT * FROM PLACE";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String place_contentsid = rs.getString(1);
				String place_name = rs.getString(2);
				String place_latitude = rs.getString(3);
				String place_longitude = rs.getString(4);
				String place_addr = rs.getString(5);
				String place_img = rs.getString(6);
				String place_introduction = rs.getString(7);
				String place_tag = rs.getString(8);
				int place_num = rs.getInt(9);
				
				PlaceDTO info = new PlaceDTO(place_contentsid, place_name, place_latitude, place_longitude, place_addr, place_img, place_introduction, place_tag, place_num);
				pg.add(info);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return pg;
	}

	public ArrayList<String> placeNameGet() {
		ArrayList<String> pgname = new ArrayList<>();
		getConnection();

		try {
			String sql = "SELECT * FROM PLACE";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				pgname.add(rs.getString("PLACE_NAME"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return pgname;
	}

    public ArrayList<FoodDTO> foodGet() {
        
        getConnection();
        ArrayList<FoodDTO> fg = new ArrayList<>() ;
        
        try {
           String sql = "SELECT * FROM FOOD";
           psmt = conn.prepareStatement(sql);

           rs = psmt.executeQuery();
           
           while(rs.next()){
                 String food_contentsid = rs.getString(1);
                 String food_name = rs.getString(2);
                 String food_latitude = rs.getString(3);
                 String food_longitude = rs.getString(4);
                 String food_addr = rs.getString(5);
                 String food_img = rs.getString(6);
                 String food_introduction = rs.getString(7);
                 int food_num = rs.getInt(8);
                 
                 FoodDTO info = new FoodDTO(food_contentsid, food_name, food_latitude, food_longitude, food_addr, food_img, food_introduction, food_num);
              fg.add(info);
           }
           
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        } finally {
           close();
        }
        return fg;
     }
   
    public PlaceDTO selectedPlaceGet(int placeNum){
    	PlaceDTO selectedDTO = null;
		getConnection();

		try {
			String sql = "SELECT * FROM PLACE WHERE PLACE_NUM = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, placeNum);
			rs = psmt.executeQuery();

			if(rs.next()) {
				selectedDTO = new PlaceDTO(rs.getString(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
						rs.getString(8),rs.getInt(9));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return selectedDTO;
    	
    	
    }   
 

}