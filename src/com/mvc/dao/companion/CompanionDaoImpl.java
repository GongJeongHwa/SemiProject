package com.mvc.dao.companion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.AskConnect;
import com.mvc.dto.MessageDto;

import common.JDBCTemplate;

public class CompanionDaoImpl extends JDBCTemplate implements CompanionDao {

	@Override
	public List<MessageDto> connectionList(String login_id) {
		//일단 구현은 해놨는데 속도 측면에서 너무 비효율적인 코드입니다. 기능 자체 모두 구현 후 다시 손봐야합니다.
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		//1번 연결된 회원 리스트 가져오기
		List<String> connectList = new ArrayList<>();
		try {
			pstm = con.prepareStatement(queryOne);
			pstm.setString(1, login_id);
			pstm.setString(2, login_id);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				connectList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
			closeStmt(pstm);
		}
		
		//2번 연결된 회원과의 최신 메시지 가져오기
		int count = 0;
		PreparedStatement pstmS = null;
		ResultSet rsS = null;
		List<MessageDto> list = new ArrayList<>();
		
		String query = " SELECT SEN_ID, REC_ID, MESSAGE, M_TIME FROM (SELECT * FROM M_MESSAGE WHERE SEN_ID IN(?, ?) "
				+ " AND REC_ID IN(?, ?) ORDER BY M_TIME DESC) WHERE ROWNUM = 1 ";
		while (count != connectList.size()) {
			try {
				pstmS = con.prepareStatement(query);
				pstmS.setString(1, login_id);
				pstmS.setString(2, connectList.get(count));
				pstmS.setString(3, connectList.get(count));
				pstmS.setString(4, login_id);
				
				rsS = pstmS.executeQuery();
				
				if (rsS.next()) {
					MessageDto dto = new MessageDto();
					dto.setSen_id(rsS.getString(1));
					dto.setRec_id(rsS.getString(2));
					dto.setMessage(rsS.getString(3));
					dto.setM_time(rsS.getDate(4));
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeRs(rsS);
				closeStmt(pstmS);
			}
		count++;	
		}
		closeConn(con);
		//최종적으로 반환하는건 유저별 최신 메시지
		return list;
	}

	@Override
	public List<MessageDto> getMessage(String login_id, String connect_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MessageDto dto = null;
		List<MessageDto> list = new ArrayList<>();
		
		try {
			pstm = con.prepareStatement(getMessage);
			pstm.setString(1, login_id);
			pstm.setString(2, connect_id);
			pstm.setString(3, connect_id);
			pstm.setString(4, login_id);
			
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				dto = new MessageDto();
				dto.setSen_id(rs.getString(1));
				dto.setMessage(rs.getString(2));
				dto.setM_time(rs.getDate(3));
				dto.setChat_serial(rs.getString(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(con, pstm, rs);
		}
		return list;
	}
	
	@Override
	public boolean sendRecMessage(String login_id, String con_id, String message, String chat_serial) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(sendMessage);
			pstm.setString(1, chat_serial);
			pstm.setString(2, con_id);
			pstm.setString(3, login_id);
			pstm.setString(4, message);
			
			res = pstm.executeUpdate();
			
			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
			closeConn(con);
		}
		return res > 0? true : false;
	}


	@Override
	public boolean disconnect(String user_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<AskConnect> getAskConnect(String login_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<AskConnect> list = new ArrayList<>();
		
		try {
			pstm = con.prepareStatement(askConnectList);
			pstm.setString(1, login_id);
			
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				AskConnect dto = new AskConnect(rs.getString(1), rs.getString(2), rs.getDate(3));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(con, pstm, rs);
		}
		return list;
	}

	

}
