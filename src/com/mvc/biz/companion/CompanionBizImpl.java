package com.mvc.biz.companion;

import java.sql.Connection;

import com.mvc.dao.companion.CompanionDaoImpl;

import common.JDBCTemplate;

public class CompanionBizImpl extends JDBCTemplate implements CompanionBiz{
	Connection con = getConnection();
	CompanionDaoImpl dao = new CompanionDaoImpl();
	
	@Override
	public boolean askPermit(String login_id, String con_id, String message) {
		boolean flag = false;
		
		flag = dao.askFirst(con, login_id, con_id);
		if (flag == false) {
			System.out.println("1단계 실패");
			rollback(con);
			return flag;
		}
		flag = dao.askSecond(con);
		if (flag == false) {
			System.out.println("2단계 실패");
			rollback(con);
			return flag;
		}
		int chat_serial = dao.askThird(con);
		flag = dao.askFourth(con, login_id, con_id, message, chat_serial);
		
		if (flag) {
			commit(con);
		} else {
			System.out.println("4단계 실패");
			rollback(con);
			return flag;
		}
		closeConn(con);
		
		return flag;
	}

	@Override
	public boolean askDenied(String login_id, String con_id) {
		boolean flag = dao.askDenied(con, login_id, con_id);
		
		if (flag) {
			commit(con);
		} else {
			rollback(con);
		}
		closeConn(con);
		
		return flag;
	}
}
