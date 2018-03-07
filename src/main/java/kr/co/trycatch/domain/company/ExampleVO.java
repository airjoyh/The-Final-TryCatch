package kr.co.trycatch.domain.company;

import java.util.Arrays;

public class ExampleVO {
	private int item_no;
	private String item;
	private int quiz_id;

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getQuiz_id() {
		return quiz_id;
	}

	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	@Override
	public String toString() {
		return "ExampleVO [item_no=" + item_no + ", item=" + item + ", quiz_id=" + quiz_id + "]";
	}

}
