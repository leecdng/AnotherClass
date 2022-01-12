package com.anotherclass.bitcamp.vo.user;

public class CommunityVO {
   private int community_no;
   private String member_id;
   private String img1;
   private String img_con1;
   private String img2;
   private String img_con2;
   private String img3;
   private String img_con3;
   private String img4;
   private String img_con4;
   private int hit;
   private String writedate;
   private String community_tag;
   private String category_name;
   private int class_no;
   private String member_img;
   
   
   

   public String getMember_img() {
      return member_img;
   }
   public void setMember_img(String member_img) {
      this.member_img = member_img;
   }
   /*클래스문의댓글테이블*/
   private  int community_com_no;
                           //클래스문의번호
   private String community_com_member_id;
   private int community_com_no1;
   private int community_com_no2;
   private String community_com_reply;
   private String community_com_writedate;
   private int community_com_sec;
   private int community_com_delete_sort;
   
   /*문의글에대해 댓글이 달렸는지 알려줌 0:댓글없은 1:댓글있음*/
   private int replycheck;
   
   /*list size*/
   public int listSize;
   
   
   public int getCommunity_com_no() {
      return community_com_no;
   }
   public void setCommunity_com_no(int community_com_no) {
      this.community_com_no = community_com_no;
   }
   public String getCommunity_com_member_id() {
      return community_com_member_id;
   }
   public void setCommunity_com_member_id(String community_com_member_id) {
      this.community_com_member_id = community_com_member_id;
   }
   public int getCommunity_com_no1() {
      return community_com_no1;
   }
   public void setCommunity_com_no1(int community_com_no1) {
      this.community_com_no1 = community_com_no1;
   }
   public int getCommunity_com_no2() {
      return community_com_no2;
   }
   public void setCommunity_com_no2(int community_com_no2) {
      this.community_com_no2 = community_com_no2;
   }
   public String getCommunity_com_reply() {
      return community_com_reply;
   }
   public void setCommunity_com_reply(String community_com_reply) {
      this.community_com_reply = community_com_reply;
   }
   public String getCommunity_com_writedate() {
      return community_com_writedate;
   }
   public void setCommunity_com_writedate(String community_com_writedate) {
      this.community_com_writedate = community_com_writedate;
   }
   public int getCommunity_com_sec() {
      return community_com_sec;
   }
   public void setCommunity_com_sec(int community_com_sec) {
      this.community_com_sec = community_com_sec;
   }
   public int getCommunity_com_delete_sort() {
      return community_com_delete_sort;
   }
   public void setCommunity_com_delete_sort(int community_com_delete_sort) {
      this.community_com_delete_sort = community_com_delete_sort;
   }
   public int getReplycheck() {
      return replycheck;
   }
   public void setReplycheck(int replycheck) {
      this.replycheck = replycheck;
   }
   public int getListSize() {
      return listSize;
   }
   public void setListSize(int listSize) {
      this.listSize = listSize;
   }
   public int getClass_no() {
      return class_no;
   }
   public void setClass_no(int class_no) {
      this.class_no = class_no;
   }
   public String getCategory_name() {
      return category_name;
   }
   public void setCategory_name(String category_name) {
      this.category_name = category_name;
   }
   public int getCommunity_no() {
      return community_no;
   }
   public void setCommunity_no(int community_no) {
      this.community_no = community_no;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getImg1() {
      return img1;
   }
   public void setImg1(String img1) {
      this.img1 = img1;
   }
   public String getImg_con1() {
      return img_con1;
   }
   public void setImg_con1(String img_con1) {
      this.img_con1 = img_con1;
   }
   public String getImg2() {
      return img2;
   }
   public void setImg2(String img2) {
      this.img2 = img2;
   }
   public String getImg_con2() {
      return img_con2;
   }
   public void setImg_con2(String img_con2) {
      this.img_con2 = img_con2;
   }
   public String getImg3() {
      return img3;
   }
   public void setImg3(String img3) {
      this.img3 = img3;
   }
   public String getImg_con3() {
      return img_con3;
   }
   public void setImg_con3(String img_con3) {
      this.img_con3 = img_con3;
   }
   public String getImg4() {
      return img4;
   }
   public void setImg4(String img4) {
      this.img4 = img4;
   }
   public String getImg_con4() {
      return img_con4;
   }
   public void setImg_con4(String img_con4) {
      this.img_con4 = img_con4;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public String getWritedate() {
      return writedate;
   }
   public void setWritedate(String writedate) {
      this.writedate = writedate;
   }
   public String getCommunity_tag() {
      return community_tag;
   }
   public void setCommunity_tag(String community_tag) {
      this.community_tag = community_tag;
   }
   
   
}
