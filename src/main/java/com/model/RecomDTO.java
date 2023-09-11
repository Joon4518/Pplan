package com.model;

public class RecomDTO {
   private String mem_id;
   private int sche_id;
   private String place;
   
   private int sche_like;
   private String name;

   private String latitude;
   private String longitude;

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }

   public int getSche_id() {
      return sche_id;
   }

   public void setSche_id(int sche_id) {
      this.sche_id = sche_id;
   }

   public String getPlace() {
      return place;
   }

   public void setPlace(String place) {
      this.place = place;
   }

   public int getSche_like() {
      return sche_like;
   }

   public void setSche_like(int sche_like) {
      this.sche_like = sche_like;
   }
   public String getName() {
	      return name;
	   }   

   public RecomDTO(String mem_id, int sche_id, String place, int sche_like) {
      super();
      this.mem_id = mem_id;
      this.sche_id = sche_id;
      this.place = place;
      this.sche_like = sche_like;
   }
   public RecomDTO(String latitude, String longitude, String name) {
	      this.latitude = latitude;
	      this.longitude = longitude;
	      this.name = name;
	   }

   public RecomDTO(String latitude, String longitude) {
      this.latitude = latitude;
      this.longitude = longitude;
   }

   public String getLatitude() {
      return latitude;
   }

   public String getLongitude() {
      return longitude;
   }
}