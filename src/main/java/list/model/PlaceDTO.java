package list.model;

public class PlaceDTO {
	
	private String place_contentsid;
	private String place_name;
	private String place_latitude;
	private String place_longitude;
	private String place_addr;
	private String place_img;
	private String place_introduction;
	private String place_tag;
	private int place_num;
	public String getPlace_contentsid() {
		return place_contentsid;
	}
	public void setPlace_contentsid(String place_contentsid) {
		this.place_contentsid = place_contentsid;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_latitude() {
		return place_latitude;
	}
	public void setPlace_latitude(String place_latitude) {
		this.place_latitude = place_latitude;
	}
	public String getPlace_longitude() {
		return place_longitude;
	}
	public void setPlace_longitude(String place_longitude) {
		this.place_longitude = place_longitude;
	}
	public String getPlace_addr() {
		return place_addr;
	}
	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}
	public String getPlace_img() {
		return place_img;
	}
	public void setPlace_img(String place_img) {
		this.place_img = place_img;
	}
	public String getPlace_introduction() {
		return place_introduction;
	}
	public void setPlace_introduction(String place_introduction) {
		this.place_introduction = place_introduction;
	}
	public String getPlace_tag() {
		return place_tag;
	}
	public void setPlace_tag(String place_tag) {
		this.place_tag = place_tag;
	}
	public int getPlace_num() {
		return place_num;
	}
	public void setPlace_num(int place_num) {
		this.place_num = place_num;
	}
	public PlaceDTO(String place_contentsid, String place_name, String place_latitude, String place_longitude,
			String place_addr, String place_img, String place_introduction, String place_tag, int place_num) {
		super();
		this.place_contentsid = place_contentsid;
		this.place_name = place_name;
		this.place_latitude = place_latitude;
		this.place_longitude = place_longitude;
		this.place_addr = place_addr;
		this.place_img = place_img;
		this.place_introduction = place_introduction;
		this.place_tag = place_tag;
		this.place_num = place_num;
	}
	@Override
	public String toString() {
		return "PlaceDTO [place_contentsid=" + place_contentsid + ", place_name=" + place_name + ", place_latitude="
				+ place_latitude + ", place_longitude=" + place_longitude + ", place_addr=" + place_addr
				+ ", place_img=" + place_img + ", place_introduction=" + place_introduction + ", place_tag=" + place_tag
				+ ", place_num=" + place_num + "]";
	}
	
	
	
	
	
}
