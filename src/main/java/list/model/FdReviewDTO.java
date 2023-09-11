package list.model;

public class FdReviewDTO {
   private int fd_review_num;
   private String fd_review_name;
   private String fd_review_rating;
   private String fd_review_info;
   
   
   
   public FdReviewDTO(int fd_review_num, String fd_review_name, String fd_review_rating, String fd_review_info) {
      this.fd_review_num = fd_review_num;
      this.fd_review_name = fd_review_name;
      this.fd_review_rating = fd_review_rating;
      this.fd_review_info = fd_review_info;
   }



   public int getFd_review_num() {
      return fd_review_num;
   }



   public String getFd_review_name() {
      return fd_review_name;
   }



   public String getFd_review_rating() {
      return fd_review_rating;
   }



   public String getFd_review_info() {
      return fd_review_info;
   }
   
   
   
}