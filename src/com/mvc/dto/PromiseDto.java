package com.mvc.dto;

public class PromiseDto {
	private int p_seq;
	private String user_id_f;
	private String user_id_s;
	private String p_loc;
	private String p_time;
	private String p_comment;

	public PromiseDto() {
		super();
	}

	public PromiseDto(int p_seq, String user_id_f, String user_id_s, String p_loc, String p_time, String p_comment) {
		super();
		this.p_seq = p_seq;
		this.user_id_f = user_id_f;
		this.user_id_s = user_id_s;
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

	public String getUser_id_f() {
		return user_id_f;
	}

	public void setUser_id_f(String user_id_f) {
		this.user_id_f = user_id_f;
	}

	public String getUser_id_s() {
		return user_id_s;
	}

	public void setUser_id_s(String user_id_s) {
		this.user_id_s = user_id_s;
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