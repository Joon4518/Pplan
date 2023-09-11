package list.model;

public class CommentDTO {
   private int comments_id;
   private int schedule_id;
   private String content;
   
   
   public int getComments_id() {
      return comments_id;
   }
   public void setComments_id(int comments_id) {
      this.comments_id = comments_id;
   }
   public int getSchedule_id() {
      return schedule_id;
   }
   public void setSchedule_id(int schedule_id) {
      this.schedule_id = schedule_id;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   
   public CommentDTO(int comments_id, int schedule_id, String content) {
      this.comments_id = comments_id;
      this.schedule_id = schedule_id;
      this.content = content;
   }
   
   public CommentDTO(int schedule_id, String content) {
      // TODO Auto-generated constructor stub
      this.schedule_id = schedule_id;
      this.content = content;
   }
   public CommentDTO(String content) {
      // TODO Auto-generated constructor stub
      this.content = content;
   }
   
   
}