package com.mvc.biz;

import com.mvc.dto.UserDto;

public interface MVCBiz {
	
	public UserDto selectUser();
	public boolean insertUser();
	public boolean deleteUser();
	public boolean updateUser();

}
