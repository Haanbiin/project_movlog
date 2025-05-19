package com.somo.login.sevice;

import java.sql.SQLException;

import com.somo.login.dto.User;

public interface LoginService {
	 /**
     * 로그인 검증
     * @return 성공 시 true
     */
    boolean login(String loginId, String password);

    
    
    /**
     * 회원가입 처리
     */
    void register(User user);

    
    
    /**
     * 선호 태그와 자기소개 추가 정보를 users 테이블에 저장합니다.
     * @param userId 업데이트할 사용자 ID
     * @param tags   콤마(,)로 구분된 선호 태그 문자열
     * @param bio    자기소개 텍스트
     * @throws SQLException DB 접근 오류
     */
    void addExtraInfo(int userId, String tags, String bio) throws SQLException;

	
}
