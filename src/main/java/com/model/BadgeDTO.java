package com.model;

public class BadgeDTO {
   
   private int badge_id;
   private String mem_badge_id;
   private String badge_name;
   private String badge_img;
   
   
   
   
   public BadgeDTO(int badge_id, String badge_name, String badge_img, String mem_badge_id) {
      this.badge_id = badge_id;
      this.badge_name = badge_name;
      this.badge_img = badge_img;
      this.mem_badge_id = mem_badge_id;
   }
   
   public int getBadge_id() {
      return badge_id;
   }
   public String getMem_badge_id() {
      return mem_badge_id;
   }
   public String getBadge_name() {
      return badge_name;
   }
   public String getBadge_img() {
      return badge_img;
   }
   

   
   @Override
   public String toString() {
      return "BadgeDTO [badge_id=" + badge_id + ", mem_badge_id=" + mem_badge_id + ", badge_name=" + badge_name
            + ", badge_img=" + badge_img + "]";
   }
   
   
   
   
   
}