package com.mvc.dao;

import static common.JDBCTemplate.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.dto.HeartDto;
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
	
	
	
	
	
	
	
	
	//특정유저 하트여부 확인(프로시저)
	@Override
	public boolean confirmheart(Connection con, String userid, String placeid) {
		
		boolean res = false;
		String query = "BEGIN CONFIRM_HEART(?,?,?); END;";
		
		try {
			cstmt = con.prepareCall(query);
			cstmt.setString(1, userid);
			cstmt.setString(2, placeid);
			cstmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet)cstmt.getObject(3);
			
			if(rs.next()) {
				res = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, cstmt, rs);
		}
		return res;
	}
	
	//하트찜하기(프로시저)
	@Override
	public int addheart(Connection con, HeartDto dto) {
		
		int res = -1;
		String query = "BEGIN ADDHEART(?,?,?,?,?,?,?,?,?,?); END;";
		
		try {
			cstmt = con.prepareCall(query);
			cstmt.setString(1, dto.getUserid());
			cstmt.setString(2, dto.getPlace_id());
			cstmt.setString(3, dto.getThumbnail());
			cstmt.setString(4, dto.getPlace_name());
			cstmt.setString(5, dto.getLatitude());
			cstmt.setString(6, dto.getLongtitude());
			cstmt.setString(7, dto.getPlace_address());
			cstmt.setString(8, dto.getNation());
			cstmt.setString(9, dto.getCity());
			cstmt.registerOutParameter(10, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet)cstmt.getObject(10);
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			System.out.println("찜 결과 : " + res);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, cstmt, null);
		}
		return res;
	}
	

	//하트찜제거(프로시저)
	@Override
	public int rmheart(Connection con, String userid, String placeid) {
		
		int res = -1;
		String query = "BEGIN RMHEART(?,?,?); END;";
		
		try {
			cstmt = con.prepareCall(query);
			cstmt.setString(1, userid);
			cstmt.setString(2, placeid);
			cstmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet)cstmt.getObject(3);
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, cstmt, rs);
		}
		return res;
	}
	
	
	//특정 유저가 찜한 장소정보 가져오기(국가, 시티순 정렬)
	@Override
	public ArrayList<HeartDto> getheart(Connection con, String userid) {
		
		ArrayList<HeartDto> heartlist = new ArrayList<HeartDto>();
		String query = "SELECT * FROM PLACE_HEART WHERE USER_ID = ? ORDER BY NATION, CITY";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HeartDto dto = new HeartDto();
				dto.setUserid(rs.getString(1));
				dto.setPlace_id(rs.getString(2));
				dto.setThumbnail(rs.getString(3));
				dto.setPlace_name(rs.getString(4));
				dto.setLatitude(rs.getString(5));
				dto.setLongtitude(rs.getString(6));
				dto.setPlace_address(rs.getString(7));
				dto.setNation(rs.getString(8));
				dto.setCity(rs.getString(9));
				
				heartlist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, rs);
		}
		return heartlist;
	}
	
	//특정 장소를 찜한 사람 수(프로시저)
	@Override
	public int getheartCount(Connection con, String placeid) {
		
		int res = -1;
		String query = "BEGIN GETHEARTCOUNT(?,?); END;";
		
		try {
			cstmt = con.prepareCall(query);
			cstmt.setString(1, placeid);
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet)cstmt.getObject(2);
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, cstmt, rs);
		}
		return res;
	}


	
	
	
	
	
	
	
	
	
	
}




























