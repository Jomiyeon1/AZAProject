package com.aza.web.user;

import java.util.Map;

import com.aza.service.domain.User;
import com.aza.web.common.Search;

public interface UserService {
	// 회원가입
	public void addUser(User user) throws Exception;
	
	// 내정보확인 / 로그인
	public User getUser(String userId) throws Exception;
	
	// 회원정보리스트 
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	// 회원정보수정
	public void updateUser(User user) throws Exception;
	
	// 회원 ID 중복 확인
	public boolean checkDuplication(String userId) throws Exception;
	
}
