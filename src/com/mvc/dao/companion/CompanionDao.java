package com.mvc.dao.companion;

import java.sql.Connection;
import java.util.List;

import com.mvc.dto.AskConnect;
import com.mvc.dto.MessageDto;

public interface CompanionDao {
	//connectionList()메서드 SQL문 ACTIVE = Y
	//getDeleteList()메서드 SQL문 ACTIVE = N
	//1. 연결된 회원 리스트 가져오기
	String queryOne = " SELECT DISTINCT SEN_ID FROM M_MESSAGE JOIN CHAT_LIST USING(CHAT_SERIAL) WHERE REC_ID = ? AND ACTIVE = ? ";
	//2. 연결된 회원과의 최신 메시지 가져오기
	String queryTwo = " SELECT SEN_ID, REC_ID, MESSAGE FROM (SELECT * FROM M_MESSAGE WHERE SEN_ID IN(?, ?) "
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
	
	
	//연결 신청 리스트
	//블로그 디테일 페이지에서 동행신청을 하면 -> db에 저장되고 -> 해당 리스트를 가져와서 뿌려줘야함
	String askConnectList = " SELECT SEN_ID, COMMENT_ASK, ASK_DATE FROM ASK_CONNECT WHERE PERMIT = 'D' AND REC_ID = ? ORDER BY ASK_DATE DESC ";
	
	//불량회원 신고 시 채팅방 삭제된 메세지로 이동하는 쿼리문
	//REC_ID 로그인 되어있는 아이디, SEN_ID 신고당하는 아이디
	String reportUser = "UPDATE CHAT_LIST SET ACTIVE = 'N', DISABLED_DATE = SYSDATE WHERE CHAT_SERIAL = (SELECT DISTINCT CHAT_SERIAL FROM M_MESSAGE JOIN CHAT_LIST USING(CHAT_SERIAL) WHERE SEN_ID = ? AND REC_ID = ? AND ACTIVE='Y')";
	
	public List<MessageDto> connectionList(String login_id);
	public List<MessageDto> getMessage(String login_id, String connect_id);
	public boolean sendRecMessage(String login_id, String con_id, String message, String chat_serial);
	public List<AskConnect> getAskConnect(String login_id);
	public boolean reportUser(String login_id, String con_id);
	public List<MessageDto> getDeleteList(String login_id);
	
	/*
	 -- 1. ASK_CONNECT의 PERMIT 바꿔주고, CHAT_LIST 새로 생성, 채팅방 번호 부여
	 -- 2. MESSAGE에 INSERT 해주면 된다.
	 -- 3. 작업이 끝나면 화면단에 뿌려줘야함. 새로 추가해주자
	 --최신 시리얼번호 SELECT해오고 변수에 저장하고 그걸로 사용하자
	 */
	String first = " UPDATE ASK_CONNECT SET PERMIT = 'Y' WHERE SEN_ID = ? AND REC_ID = ? ";
	String second = " INSERT INTO CHAT_LIST VALUES(CHAT_SEQ.NEXTVAL,'Y',SYSDATE) ";
	String third = " SELECT ROWNUM, CHAT_SERIAL FROM (SELECT CHAT_SERIAL FROM CHAT_LIST ORDER BY CHAT_SERIAL DESC) WHERE ROWNUM = 1 ";
	String fourth = " INSERT INTO M_MESSAGE VALUES(MESSAGE_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE) ";
	
	public boolean askFirst(Connection con, String login_id, String con_id);
	public boolean askSecond(Connection con);
	public int askThird(Connection con);
	public boolean askFourth(Connection con, String login_id, String con_id, String message, int chat_serial);
	
	//연결신청 거부
	String askDenied = "UPDATE ASK_CONNECT SET PERMIT = 'N' WHERE REC_ID = ? AND SEN_ID = ?";
	public boolean askDenied(Connection con, String login_id, String con_id);
}