package kr.co.trycatch.domain.user;

import java.sql.Date;

public class NoteVO {

	private int note_id;
	private String note_contents;
	private Date note_senddate;
	private String note_sender;
	private String note_receiver;

	public int getNote_id() {
		return note_id;
	}

	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}

	public String getNote_contents() {
		return note_contents;
	}

	public void setNote_contents(String note_contents) {
		this.note_contents = note_contents;
	}

	public Date getNote_senddate() {
		return note_senddate;
	}

	public void setNote_senddate(Date note_senddate) {
		this.note_senddate = note_senddate;
	}

	public String getNote_sender() {
		return note_sender;
	}

	public void setNote_sender(String note_sender) {
		this.note_sender = note_sender;
	}

	public String getNote_receiver() {
		return note_receiver;
	}

	public void setNote_receiver(String note_receiver) {
		this.note_receiver = note_receiver;
	}

	@Override
	public String toString() {
		return "NoteVO [note_id=" + note_id + ", note_contents=" + note_contents + ", note_senddate=" + note_senddate
				+ ", note_sender=" + note_sender + ", note_receiver=" + note_receiver + "]";
	}

}
