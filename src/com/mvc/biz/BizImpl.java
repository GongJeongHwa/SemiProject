package com.mvc.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.mvc.dao.DaoImpl;
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
	
	
	

}
