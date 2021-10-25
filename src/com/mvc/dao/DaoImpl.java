package com.mvc.dao;

import static common.JDBCTemplate.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

public class DaoImpl implements Dao{
	
	PreparedStatement pstmt;
	CallableStatement cstmt;
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
	
	
	
	
	
	
	
	
	
	//Blog
	
	//전체 블로그 리스트
	@Override
	public ArrayList<blogDto> getBlogList(Connection con) {
		
		ArrayList<blogDto> bloglist = new ArrayList<blogDto>();
		String query = "SELECT * FROM V_BLOG_LIST";
		
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				blogDto dto = new blogDto();
				dto.setUser_id(rs.getString(1));
				dto.setUser_penalty(rs.getInt(2));
				dto.setBlog_seq(rs.getInt(3));
				dto.setBlog_create_date(rs.getDate(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setAreaname(rs.getString(7));
				dto.setMindate(rs.getDate(8));
				dto.setMaxdate(rs.getDate(9));
				dto.setThumbnailPath(rs.getString(10));
				dto.setHeart_count(rs.getInt(11));
				dto.setComment(rs.getInt(12));
				dto.setHits(rs.getInt(13));
				bloglist.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, rs);
		}
		return bloglist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}




























