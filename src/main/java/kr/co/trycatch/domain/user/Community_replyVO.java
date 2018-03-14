package kr.co.trycatch.domain.user;

import java.util.Date;

public class Community_replyVO {
   private int reply_no;
   private String reply_contents;
   private String reply_writer;
   private Date reply_wdate;
   private int community_no;
   
   public Community_replyVO() {

   }//»ı¼ºÀÚ

 
   public Community_replyVO(int reply_no, String reply_contents, String reply_writer, Date reply_wdate, int community_no) {
	super();
	this.reply_no = reply_no;
	this.reply_contents = reply_contents;
	this.reply_writer = reply_writer;
	this.reply_wdate = reply_wdate;
	this.community_no = community_no;
   }


   public int getReply_no() {
	   return reply_no;
   }

   
   public void setReply_no(int reply_no) {
	   this.reply_no = reply_no;
   }


   public String getReply_contents() {
	   return reply_contents;
   }


   public void setReply_contents(String reply_contents) {
	   this.reply_contents = reply_contents;
   }


   public String getReply_writer() {
      return reply_writer;
   }


   public void setReply_writer(String reply_writer) {
	   this.reply_writer = reply_writer;
   }


   public Date getReply_wdate() {
	   return reply_wdate;
   }


   public void setReply_wdate(Date reply_wdate) {
	   this.reply_wdate = reply_wdate;
   }


   public int getCommunity_no() {
	   return community_no;
   }


   public void setCommunity_no(int community_no) {
	     this.community_no = community_no;
   }


@Override
   public String toString() {
	   return "CommunityReplyVO [reply_no=" + reply_no + ", reply_contents=" + reply_contents + ", reply_writer="
			   + reply_writer + ", reply_wdate=" + reply_wdate + ", community_no=" + community_no + "]";
   }
   
    
}
