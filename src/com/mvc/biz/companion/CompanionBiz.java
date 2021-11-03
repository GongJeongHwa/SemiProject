package com.mvc.biz.companion;

import java.util.List;

import com.mvc.dto.MessageDto;
import com.mvc.dto.PromiseDto;

public interface CompanionBiz {
	public boolean sendRecMessage(String login_id, String con_id, String message, String chat_serial);
	
	public boolean askPermit(String login_id, String con_id, String message);
	public boolean askDenied(String login_id, String con_id);
	public boolean makePromise(String login_id, String con_id, String loc, String date, String message);
	public List<PromiseDto> getPromise(String login_id);
	public boolean promiseChoice(String login_id, String con_id, String loc, String permit, String comment, String chat_serial);
	
	public boolean reportUser(String login_id, String con_id);
	
	public List<MessageDto> getMessage(String login_id, String connect_id);
	public List<MessageDto> connectionList(String login_id);
	
	//블로그 디테일 동행신청
	public boolean blogAskCompanion(String login_id, String con_id, String comment);
	
	public int completeDelete(String login_id, String con_id);
	
}