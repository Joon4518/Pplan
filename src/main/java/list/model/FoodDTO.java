package list.model;

public class FoodDTO {
	private String food_contentsid;
	   private String food_name;
	   private String food_latitude;
	   private String food_longitude;
	   private String food_addr;
	   private String food_img;
	   private String food_introduction;
	   private int food_num;
	   
	   
	   public FoodDTO(String food_contentsid, String food_name, String food_latitude, String food_longitude,
	         String food_addr, String food_img, String food_introduction, int food_num) {
	      this.food_contentsid = food_contentsid;
	      this.food_name = food_name;
	      this.food_latitude = food_latitude;
	      this.food_longitude = food_longitude;
	      this.food_addr = food_addr;
	      this.food_img = food_img;
	      this.food_introduction = food_introduction;
	      this.food_num = food_num;
	   }


	   public String getFood_contentsid() {
	      return food_contentsid;
	   }


	   public String getFood_name() {
	      return food_name;
	   }


	   public String getFood_latitude() {
	      return food_latitude;
	   }


	   public String getFood_longitude() {
	      return food_longitude;
	   }


	   public String getFood_addr() {
	      return food_addr;
	   }


	   public String getFood_img() {
	      return food_img;
	   }


	   public String getFood_introduction() {
	      return food_introduction;
	   }

	   public int getFood_num() {
	      return food_num;
	   }
	   
	   

}
