package com.mvc.dao;

import static common.JDBCTemplate.closeAll;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map.Entry;

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
	
	@Override
	public blogDto getblogOne(Connection con, String userid, int blogseq) {
		
		blogDto bdto = new blogDto();
		String query = "SELECT * FROM V_BLOG_ONE WHERE USER_ID = ? AND BLOG_SEQ = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, blogseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int tour_seq = rs.getInt(9);
				
				if(tour_seq == 1) {
					bdto.setUser_id(rs.getString(1));
					bdto.setUser_penalty(rs.getInt(2));
					bdto.setBlog_seq(rs.getInt(3));
					bdto.setBlog_create_date(rs.getDate(4));
					bdto.setTitle(rs.getString(5));
					bdto.setContent(rs.getString(6));
					bdto.setThumbnailPath(rs.getString(7));
					bdto.setAreaname(rs.getString(8));
					bdto.setHeart_count(rs.getInt(12));
					bdto.setComment(rs.getInt(13));
					bdto.setHits(rs.getInt(14));
				}
				
				bdto.getMap().put(rs.getDate(10), rs.getString(11));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, rs);
		}
		return bdto;
	}
	
	@Override
	public int bloghitsUp(Connection con, String userid, int blogseq) {
		
		String query = "BEGIN BLOG_HITSUP(?,?); END;";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, blogseq);
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int getBlogSeq(Connection con, String userid) {
		
		int seq = 0;
		String query = "SELECT MAX(BLOG_SEQ) FROM BLOG_DETAIL WHERE USER_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				seq = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, rs);
		}
		return seq;
	}
	
	@Override
	public int addSchedule(Connection con, int seq, blogDto dto) {
		boolean b = false;
		int[] res;
		String query = "INSERT INTO BLOG_DETAIL(USER_ID,BLOG_SEQ,BLOG_CREATE_DATE,TITLE,CONTENT,AREA_NAME,TOUR_SEQ,TOUR_DATE,PLACE,IMG_PATH)"+
					   "VALUES(?,?,SYSDATE,?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(query);
			
			Iterator<Entry<Date, String>> linkedIter = dto.getMap().entrySet().iterator();
			
			int count = 1;
			
			while(linkedIter.hasNext()) {
				
				Entry<Date, String> entry = linkedIter.next();
				Date date = entry.getKey();
				String place = entry.getValue();
				
				pstmt.setString(1, dto.getUser_id());
				pstmt.setInt(2, seq);
				pstmt.setString(3, dto.getTitle());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getAreaname());
				pstmt.setInt(6, count++);
				pstmt.setDate(7, new java.sql.Date(date.getTime()));
				pstmt.setString(8, place);
				pstmt.setString(9, dto.getThumbnailPath());
				
				pstmt.addBatch();
				pstmt.clearParameters();
			}
			res = pstmt.executeBatch();
			
			int sum = 0;
			for(int i : res) {
				sum += i;
			}
			if(Math.abs(sum) == dto.getMap().size()*2) {
				b = true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
		return b? seq : 0;
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
			closeAll(null, cstmt, rs);
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




























