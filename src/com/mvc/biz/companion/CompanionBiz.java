package com.mvc.biz.companion;

public interface CompanionBiz {
	public boolean askPermit(String login_id, String con_id, String message);
	public boolean askDenied(String login_id, String con_id);
	
}