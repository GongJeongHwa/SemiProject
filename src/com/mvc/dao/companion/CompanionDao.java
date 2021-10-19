package com.mvc.dao.companion;

import java.util.List;

import com.mvc.dto.AskConnect;
import com.mvc.dto.MessageDto;

public interface CompanionDao {

	
	//connectionList()메서드 SQL문
	//1. 연결된 회원 리스트 가져오기
	String queryOne = " SELECT DISTINCT REC_ID FROM M_MESSAGE WHERE SEN_ID = ? UNION "
			+ " SELECT DISTINCT SEN_ID FROM M_MESSAGE WHERE REC_ID = ? ";
	//2. 연결된 회원과의 최신 메시지 가져오기
	String queryTwo = " SELECT SEN_ID, REC_ID, MESSAGE, M_TIME FROM (SELECT * FROM M_MESSAGE WHERE SEN_ID IN(?, ?) "
			+ " AND REC_ID IN(?, ?) ORDER BY M_TIME DESC) WHERE ROWNUM = 1 ";
	
	//getMessage()메서드 SQL문
	String getMessage = " SELECT SEN_ID, MESSAGE, M_TIME, CHAT_SERIAL FROM M_MESSAGE WHERE REC_ID = ? AND SEN_ID = ? "
			+ "UNION ALL "
			+ "SELECT SEN_ID, MESSAGE, M_TIME, CHAT_SERIAL FROM M_MESSAGE WHERE REC_ID = ? AND SEN_ID = ? "
			+ "ORDER BY M_TIME ";
	
	//sendMessage()메서드 SQL문
	String sendMessage = " INSERT INTO M_MESSAGE VALUES("
			+ "MESSAGE_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE"
			+ ")" ;
	
	//리스트에서 회원 삭제 메서드
	//쓰래기통 아이콘 클릭 시 알림창이 뜨고 삭제한다 하면은 해당 리스트는 삭제된 메세지 탭에서 보여야함
	String disconnect = "";
	
	
	//연결 신청 리스트
	//ajax 통신, select 해와야한다.
	//블로그 디테일 페이지에서 동행신청을 하면 -> db에 저장되고 -> 해당 리스트를 가져와서 뿌려줘야함
	String askConnectList = " SELECT SEN_ID, COMMENT_ASK, ASK_DATE FROM ASK_CONNECT WHERE PERMIT = 'D' AND REC_ID = ? ORDER BY ASK_DATE DESC ";
	
	public List<MessageDto> connectionList(String login_id);
	public List<MessageDto> getMessage(String login_id, String connect_id);
	public boolean sendRecMessage(String login_id, String con_id, String message, String chat_serial);
	public boolean disconnect(String user_id);
	public List<AskConnect> getAskConnect(String login_id);

}


