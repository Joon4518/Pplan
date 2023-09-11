package list.model;

public class ReviewDTO {
	private int review_num;
	private String review_rating;
	private String review_info;
	private String review_name;
	public int getReview_num() {
		return review_num;
	}
	public String getReview_rating() {
		return review_rating;
	}
	public String getReview_info() {
		return review_info;
	}
	public String getReview_reg() {
		return review_name;
	}
	public ReviewDTO(int review_num, String review_rating, String review_info, String review_name) {
		super();
		this.review_num = review_num;
		this.review_rating = review_rating;
		this.review_info = review_info;
		this.review_name = review_name;
	}
	@Override
	public String toString() {
		return "ReviewDTO [review_num=" + review_num + ", review_rating=" + review_rating + ", review_info="
				+ review_info + ", review_reg=" + review_name + "]";
	}
	

	
	
}
