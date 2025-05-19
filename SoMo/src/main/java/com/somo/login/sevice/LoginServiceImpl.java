package com.somo.login.sevice;

import java.sql.SQLException;

import com.somo.login.dao.UserDao;
import com.somo.login.dao.UserDaoImpl;
import com.somo.login.dto.User;

public class LoginServiceImpl implements LoginService {

	private final UserDao userDao = new UserDaoImpl();

    /**
     * 로그인 검증
     * @param loginId 이메일 또는 전화번호
     * @param password 입력한 비밀번호
     * @return 로그인 성공 시 true, 실패 시 false
     */
    @Override
    public boolean login(String loginId, String password) {
        try {
            User user = userDao.findByLoginId(loginId);
            if (user == null) {
                return false;
            }
            // 평문 비밀번호 비교
            return user.getPassword().equals(password);
        } catch (SQLException e) {
            e.printStackTrace(); // 실제 프로젝트에서는 로깅 프레임워크 사용 권장
            return false;
        }
    }
 

    
    /**
     * 회원가입 처리
     * @param user 사용자 정보가 담긴 User DTO
     */
    @Override
    public void register(User user) {
        try {
            userDao.insert(user);
        } catch (SQLException e) {
            throw new RuntimeException("회원가입 중 오류 발생", e);
        }
    }
    
    
    
    @Override
    public void addExtraInfo(int userId, String tags, String bio) throws SQLException {
        userDao.updateTagsAndBio(userId, tags, bio);
    }
    
    
    
    
}
