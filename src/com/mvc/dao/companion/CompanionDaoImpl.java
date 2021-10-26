package com.mvc.dao.companion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.AskConnect;
import com.mvc.dto.MessageDto;
import com.mvc.dto.PromiseDto;

import common.JDBCTemplate;

public class CompanionDaoImpl extends JDBCTemplate implements CompanionDao {

	@Override
	public List<MessageDto> connectionList(Connection con, String login_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		// 1번 연결된 회원 리스트 가져오기
		List<String> connectList = new ArrayList<>();
		try {
			pstm = con.prepareStatement(queryOne);
			pstm.setString(1, login_id);
			pstm.setString(2, "Y");
			rs = pstm.executeQuery();

			while (rs.next()) {
				connectList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
			closeStmt(pstm);
		}

		// 2번 연결된 회원과의 최신 메시지 가져오기
		int count = 0;
		PreparedStatement pstmS = null;
		ResultSet rsS = null;
		List<MessageDto> list = new ArrayList<>();

		while (count != connectList.size()) {
			try {
				pstmS = con.prepareStatement(queryTwo);
				pstmS.setString(1, login_id);
				pstmS.setString(2, connectList.get(count));
				pstmS.setString(3, connectList.get(count));
				pstmS.setString(4, login_id);
				pstmS.setString(5, connectList.get(count));
				rsS = pstmS.executeQuery();

				if (rsS.next()) {
					MessageDto dto = new MessageDto();
					dto.setSen_id(rsS.getString(1));
					dto.setRec_id(rsS.getString(2));
					dto.setMessage(rsS.getString(3));
					dto.setSender_img(rsS.getString(4));
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
		return list;
	}

	@Override
	public List<MessageDto> getMessage(Connection con, String login_id, String connect_id) {
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
				dto.setSender_img(rs.getString(5));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstm, rs);
		}
		return list;
	}

	@Override
	public int sendRecMessage(Connection con, String login_id, String con_id, String message, String chat_serial) {
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
		}
		return res;
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
				AskConnect dto = new AskConnect(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4));
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
	public boolean reportUser(Connection con, String login_id, String con_id) {
		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(reportUser);

			pstm.setString(1, con_id);
			pstm.setString(2, login_id);

			res = pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res > 0 ? true : false;
	}

	@Override
	public List<MessageDto> getDeleteList(String login_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		// 1번 연결된 회원 리스트 가져오기
		List<String> connectList = new ArrayList<>();
		try {
			pstm = con.prepareStatement(queryOne);
			pstm.setString(1, login_id);
			pstm.setString(2, "N");
			rs = pstm.executeQuery();

			while (rs.next()) {
				connectList.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
			closeStmt(pstm);
		}	
		System.out.println("1번 오류없음");
		// 2번 연결된 회원과의 최신 메시지 가져오기
		int count = 0;
		PreparedStatement pstmS = null;
		ResultSet rsS = null;
		List<MessageDto> list = new ArrayList<>();

		while (count != connectList.size()) {
			try {
				pstmS = con.prepareStatement(queryTwo);
				pstmS.setString(1, login_id);
				pstmS.setString(2, connectList.get(count));
				pstmS.setString(3, connectList.get(count));
				pstmS.setString(4, login_id);
				pstmS.setString(5, connectList.get(count));
				rsS = pstmS.executeQuery();

				if (rsS.next()) {
					MessageDto dto = new MessageDto();
					dto.setSen_id(rsS.getString(1));
					dto.setRec_id(rsS.getString(2));
					dto.setMessage(rsS.getString(3));
					dto.setSender_img(rsS.getString(4));
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
		System.out.println("1번 오류없음");
		return list;
	}

	//여기서부터 askPermit
	@Override
	public boolean askFirst(Connection con, String login_id, String con_id) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(first);
			pstm.setString(1, con_id);
			pstm.setString(2, login_id);
			res = pstm.executeUpdate();
			
 		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res>0?true:false;
	}

	@Override
	public boolean askSecond(Connection con) {
		PreparedStatement pstm = null;
		int res = 0;

		try {
			pstm = con.prepareStatement(second);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res>0?true:false;
	}

	@Override
	public int askThird(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int chat_serial = 0;
		
		try {
			pstm = con.prepareStatement(third);
			rs = pstm.executeQuery();
			if (rs.next()) {
				chat_serial = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
			closeStmt(pstm);
		}
		return chat_serial;
	}

	@Override
	public boolean askFourth(Connection con, String login_id, String con_id, String message, int chat_serial) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(fourth);
			pstm.setInt(1, chat_serial);
			pstm.setString(2, login_id);
			pstm.setString(3, con_id);
			pstm.setString(4, message);
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res>0?true:false;
	}
	//여기까지 askPermit

	@Override
	public boolean askDenied(Connection con, String login_id, String con_id) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(askDenied);
			pstm.setString(1, login_id);
			pstm.setString(2, con_id);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res>0?true:false;
	}

	@Override
	public boolean makePromise(Connection con, String login_id, String con_id, String loc, String date, String comment) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(makePromise);
			pstm.setString(1, login_id);
			pstm.setString(2, con_id);
			pstm.setString(3, loc);
			pstm.setString(4, date);
			pstm.setString(5, comment);
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res>0?true:false;
	}

	@Override
	public List<PromiseDto> getPromise(Connection con, String login_id) {
		PreparedStatement pstm = null;
		List<PromiseDto> list = new ArrayList<>();
		ResultSet rs = null;
		
		try {
			pstm = con.prepareStatement(getPromise);
			pstm.setString(1, login_id);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				PromiseDto dto = new PromiseDto();
				dto.setSen_id(rs.getString(1));
				dto.setP_loc(rs.getString(2));
				dto.setP_time(rs.getString(3));
				dto.setP_comment(rs.getString(4));
				dto.setUser_img(rs.getString(5));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
			closeStmt(pstm);
		}
		return list;
	}

	@Override
	public int promiseChoice(Connection con, String login_id, String con_id, String loc, String permit) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(promiseChoice);
			pstm.setString(1, permit);
			pstm.setString(2, login_id);
			pstm.setString(3, con_id);
			pstm.setString(4, loc);
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeStmt(pstm);
		}
		return res;
	}

}
