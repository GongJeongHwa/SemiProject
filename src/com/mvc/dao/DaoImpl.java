package com.mvc.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mvc.dto.UserDto;

public class DaoImpl implements Dao{
	
	PreparedStatement pstmt;
	ResultSet rs;
	
	@Override
	public UserDto selectUser(Connection con) {
		
		
		
		return null;
	}
	@Override
	public boolean insertUser(Connection con, UserDto dto) {
		
		
		
		return false;
	}
	@Override
	public boolean updateUser(Connection con, UserDto dto) {
		
		
		
		return false;
	}
	@Override
	public boolean deleteUser(Connection con, int seq) {
		
		
		
		return false;
	}
	
}




























