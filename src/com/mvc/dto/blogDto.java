package com.mvc.dto;

import java.util.Date;
import java.util.HashMap;

public class blogDto {
	private String user_id;
	private int blog_seq;
	private String title;
	private String content;
	private String thumbnailPath; //썸네일
	private HashMap<Date, StringBuilder> map;
	private int heart_count; //찜수
	private int comment; //댓글수
	private int user_penalty; //user_penaly;
	private int hits;	//글 조회수
	
	public blogDto() {}

	public blogDto(String user_id, int blog_seq, String title, String content, String thumbnailPath, int heart_count,
			int comment, int user_penalty,  int hits) {
		super();
		this.user_id = user_id;
		this.blog_seq = blog_seq;
		this.title = title;
		this.content = content;
		this.thumbnailPath = thumbnailPath;
		this.setHeart_count(heart_count);
		this.comment = comment;
		this.user_penalty = user_penalty;
		this.hits = hits;
	}

	public blogDto(String user_id, int blog_seq, String title, String content, String thumbnailPath,
			HashMap<Date, StringBuilder> map, int heart_count, int comment, int user_penalty, int hits) {
		super();
		this.user_id = user_id;
		this.blog_seq = blog_seq;
		this.title = title;
		this.content = content;
		this.thumbnailPath = thumbnailPath;
		this.map = map;
		this.setHeart_count(heart_count);
		this.comment = comment;
		this.user_penalty = user_penalty;
		this.hits = hits;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBlog_seq() {
		return blog_seq;
	}

	public void setBlog_seq(int blog_seq) {
		this.blog_seq = blog_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThumbnailPath() {
		return thumbnailPath;
	}

	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}

	public HashMap<Date, StringBuilder> getMap() {
		return map;
	}

	public void setMap(HashMap<Date, StringBuilder> map) {
		this.map = map;
	}


	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public int getUser_penalty() {
		return user_penalty;
	}

	public void setUser_penalty(int user_penalty) {
		this.user_penalty = user_penalty;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getHeart_count() {
		return heart_count;
	}

	public void setHeart_count(int heart_count) {
		this.heart_count = heart_count;
	}
	
	
	
}
