package com.mvc.dto;

public class PromiseDto {
	private int p_seq;
	private String sen_id;
	private String rec_id;
	private String p_loc;
	private String p_time;
	private String p_comment;

	public PromiseDto() {
		super();
	}

	public PromiseDto(int p_seq, String sen_id, String rec_id, String p_loc, String p_time, String p_comment) {
		super();
		this.p_seq = p_seq;
		this.sen_id = sen_id;
		this.rec_id = rec_id;
		this.p_loc = p_loc;
		this.p_time = p_time;
		this.p_comment = p_comment;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getSen_id() {
		return sen_id;
	}

	public void setSen_id(String sen_id) {
		this.sen_id = sen_id;
	}

	public String getRec_id() {
		return rec_id;
	}

	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}

	public String getP_loc() {
		return p_loc;
	}

	public void setP_loc(String p_loc) {
		this.p_loc = p_loc;
	}

	public String getP_time() {
		return p_time;
	}

	public void setP_time(String p_time) {
		this.p_time = p_time;
	}

	public String getP_comment() {
		return p_comment;
	}

	public void setP_comment(String p_comment) {
		this.p_comment = p_comment;
	}
}