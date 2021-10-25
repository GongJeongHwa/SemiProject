package com.mvc.dao;

import java.sql.Connection;
import java.util.ArrayList;

import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

public interface Dao {
	
	//우저 관련 sql
	String selectUserSql = ""; // 예시) 유저 선택
	String insertUserSql = ""; // 예시) 유저 회원가입
	String deleteUserSql = ""; // 예시) 유저 삭제
	String updateUserSql = ""; // 예시) 유저 수정
	
	public UserDto selectUser(Connection con);
	public boolean insertUser(Connection con, UserDto dto);
	public boolean updateUser(Connection con, UserDto dto);
	public boolean deleteUser(Connection con, int seq);
	
	//다른 sql문 구분
	

	//Blog
	public ArrayList<blogDto> getBlogList(Connection con);
}
