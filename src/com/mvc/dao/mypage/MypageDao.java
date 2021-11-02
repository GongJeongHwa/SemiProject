package com.mvc.dao.mypage;

import java.util.List;

import com.mvc.dto.HeartDto;
import com.mvc.dto.PromiseDto;
import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

public interface MypageDao {

	String selectTravelSql = " SELECT * FROM V_BLOG_LIST WHERE USER_ID=? "; // 예시) 내 여행 조회
	String updateTravelSql = " UPDATE * SET  "; // 예시) 내 여행 수정
	String deleteTravelSql = " DELETE FROM V_BLOG_LIST WHERE USER_ID=? AND BLOG_SEQ=? "; // 예시) 내 여행 삭제

	String selectWishedSql = " SELECT * FROM PLACE_HEART WHERE USER_ID=? ORDER BY NATION, CITY "; // 예시) 찜한 여행 조회
	String deleteWishedSql = " DELTE FROM PLACE_HEART WHERE USER_ID =? AND BLOG_ID=? "; // 예시) 찜한 여행 삭제

	String selectCompanionSql = " SELECT * FROM M_PROMISE WHERE SEN_ID=? OR REC_ID=?"; // 예시) 동행 조회
	String insertCompanionSql = "  "; // 예시) 동행 추가
	//동행은 수정이 안됨!
	String deleteCompanionSql = "  "; // 예시) 동행 삭제
	
	public List<blogDto> selectTravelSql(String user_id);
	public List<HeartDto> selectWishedSql(String user_id);
	public List<PromiseDto> selectCompanionSql(String user_id);
	
	public boolean insertWishedSql(UserDto dto);
	public boolean insertCompanionSql(UserDto dto);

	public boolean updateTravelSql(UserDto dto);

	
	public boolean deleteTravelSql(int seq);
	public boolean deleteWishedSql(int seq);
	public boolean deleteCompanionSql(int seq);
	
	
	
}
