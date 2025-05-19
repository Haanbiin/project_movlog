package com.somo.login.dao;

import java.sql.SQLException;

import com.somo.login.dto.User;

public interface UserDao {
	
	
	 /**
     * 이메일 또는 전화번호로 사용자 조회
     */
    User findByLoginId(String loginId) throws SQLException;

    
    
    /**
     * 신규 사용자 삽입
     */
    void insert(User user) throws SQLException;
	
    
    
    /**
     * 선호 태그(tags)와 자기소개(bio)를 업데이트합니다.
     * @param userId 업데이트할 사용자 ID
     * @param tags   콤마(,)로 구분된 선호 태그 문자열
     * @param bio    자기소개 텍스트
     * @throws SQLException DB 접근 오류
     */
    void updateTagsAndBio(int userId, String tags, String bio) throws SQLException;
}
