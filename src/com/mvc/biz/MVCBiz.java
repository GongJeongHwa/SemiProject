package com.mvc.biz;

import java.util.ArrayList;

import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

public interface MVCBiz {
	
	public UserDto selectUser();
	public boolean insertUser();
	public boolean deleteUser();
	public boolean updateUser();
	
	//블로그관련
	public ArrayList<blogDto> getBlogList();

}
