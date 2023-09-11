package sche.model;

public class ScheDTO {
   private String storage_id;
   private int schedule_id;
   private String sche;
   
   public String getStorage_id() {
      return storage_id;
   }
   public int getSchedule_id() {
      return schedule_id;
   }
   public String getSche() {
      return sche;
   }
   
   public ScheDTO(String storage_id, int schedule_id, String sche) {
      this.storage_id = storage_id;
      this.schedule_id = schedule_id;
      this.sche = sche;
   }
   
   

   
   
   
   
}