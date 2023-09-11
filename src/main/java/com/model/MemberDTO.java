package com.model;

public class MemberDTO {
   private String id;
   private String pw;
   private String nick;
   private String email;
   
   private String place1;
   private String place2;
   private String place3;
   private String place4;
   private String place5;
   
   private String place_name;
   private String place_img;
   private String place_content;
      
   
   public MemberDTO(String id, String pw, String nick, String email) {
      this.id = id;
      this.pw = pw;
      this.nick = nick;
      this.email = email;
   }


   public MemberDTO(String id, String pw) {
      this.id = id;
      this.pw = pw;
   }


   public String getId() {
      return id;
   }


   public String getPw() {
      return pw;
   }


   public String getNick() {
      return nick;
   }


   public String getEmail() {
      return email;
   }

   

      public MemberDTO(String place1, String place2, String place3, String place4, String place5) {
      this.place1 = place1;
      this.place2 = place2;
      this.place3 = place3;
      this.place4 = place4;
      this.place5 = place5;
   }


   public String getPlace1() {
         return place1;
      }


      public String getPlace2() {
         return place2;
      }


      public String getPlace3() {
         return place3;
      }
      
      
      
   public String getPlace4() {
      return place4;
   }


   public String getPlace5() {
      return place5;
   }



   
   
   public MemberDTO(String place_name, String place_img, String place_content) {
      this.place_name = place_name;
      this.place_img = place_img;
      this.place_content = place_content;
   }


   public String getPlace_name() {
      return place_name;
   }


   public String getPlace_img() {
      return place_img;
   }


   public String getPlace_content() {
      return place_content;
   }


   @Override
   public String toString() {
      return "MemberDTO [id=" + id + ", pw=" + pw + ", nick=" + nick + ", email=" + email + "]";
   }
   
   
   
}