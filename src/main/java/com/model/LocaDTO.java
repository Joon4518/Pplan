package com.model;

public class LocaDTO {
	   private String latitude; 
	   private String longitude;
	   
	   public LocaDTO(String latitude, String longitude) {
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