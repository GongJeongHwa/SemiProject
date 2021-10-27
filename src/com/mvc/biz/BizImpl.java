package com.mvc.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.mvc.dao.DaoImpl;
import com.mvc.dto.HeartDto;
import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

public class BizImpl implements MVCBiz{
	
	Connection con;
	DaoImpl dao = new DaoImpl();

	//유저관련
	@Override
	public UserDto selectUser() {
		
		
		return null;
	}

	@Override
	public boolean insertUser() {
		
		
		return false;
	}

	@Override
	public boolean deleteUser() {
		
		
		return false;
	}

	@Override
	public boolean updateUser() {
		
		
		return false;
	}

	
	//블로그관련
	@Override
	public ArrayList<blogDto> getBlogList() {
		
		con = getConnection();
		ArrayList<blogDto> list = dao.getBlogList(con);
		closeConn(con);
		
		return list;
	}

	
	
	
	
	
	
	
	//특정 유저가 찜했는지 여부
	@Override
	public boolean confirmheart(String userid, String placeid) {
		
		con = getConnection();
		boolean res = dao.confirmheart(con, userid, placeid);
		closeConn(con);
		
		return res;
	}
	
	//add heart(장소 찜)
	@Override
	public int addheart(HeartDto dto) {
		
		con = getConnection();
		int res = dao.addheart(con, dto);
		if(res != -1) {
			commit(con);
		}else {
			rollback(con);
		}
		closeConn(con);
		
		return res;
	}
	
	//rm heart (찜 삭제)
	@Override
	public int rmheart(String userid, String placeid) {
		
		con = getConnection();
		int res = dao.rmheart(con, userid, placeid);
		if(res != -1) {
			commit(con);
		}else {
			rollback(con);
		}
		closeConn(con);
		
		return res;
	}
	
	
	
	//찜 목록 가져오기 (heart dto 리스트) 매개변수 : userid
	@Override
	public ArrayList<HeartDto> getHeart(String userid) {
		
		con = getConnection();
		ArrayList<HeartDto> heartlist = dao.getheart(con, userid);
		closeConn(con);
		
		return heartlist;
	}

	//특정 장소를 찜한 사람 수 반환 (매개변수 : placeid)
	@Override
	public int getheartCount(String placeid) {
		
		con = getConnection();
		int res = dao.getheartCount(con, placeid);
		closeConn(con);
		
		return res;
	}



	
	
	

}


















