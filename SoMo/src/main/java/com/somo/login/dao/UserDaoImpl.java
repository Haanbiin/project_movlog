package com.somo.login.dao;

import java.sql.*;
import java.time.LocalDate;

import com.somo.login.dto.User;
import com.somo.util.DBUtil;

public class UserDaoImpl implements UserDao {

	
	 private static final String FIND_SQL =
        "SELECT 	id, name, email, phone, birthday"
			   + ", gender, password, tags, bio "
       + "FROM users WHERE email = ? OR phone = ?";
	
	 /**
	     * 이메일 또는 전화번호로 사용자 조회
	     * @param loginId 이메일 혹은 전화번호
	     * @return 조회된 User 객체, 없으면 null
	     * @throws SQLException DB 접근 오류
	     */
    @Override
    public User findByLoginId(String loginId) throws SQLException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_SQL)) {
            ps.setString(1, loginId);
            ps.setString(2, loginId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    Date bd = rs.getDate("birthday");
                    if (bd != null) {
                        user.setBirthday(bd.toLocalDate());
                    }
                    user.setGender(rs.getString("gender"));
                    user.setPassword(rs.getString("password"));
                    user.setTags(rs.getString("tags"));
                    user.setBio(rs.getString("bio"));
                    return user;
                }
                return null;
            }
        }
    }
    ///
    
    
    private static final String INSERT_SQL =
            "INSERT INTO users "
             +"(name, email, phone, birthday, gender, password, tags, bio) "
             +"VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
	    /**
	     * 신규 사용자 정보 DB에 저장
	     * @param user User DTO
	     * @throws SQLException DB 접근 오류
	     */
	    @Override
	    public void insert(User user) throws SQLException {
	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
	            ps.setString(1, user.getName());
	            ps.setString(2, user.getEmail());
	            ps.setString(3, user.getPhone());
	            LocalDate birthday = user.getBirthday();
	            ps.setDate(4, birthday != null ? Date.valueOf(birthday) : null);
	            ps.setString(5, user.getGender());
	            ps.setString(6, user.getPassword());
	            ps.setString(7, user.getTags());
	            ps.setString(8, user.getBio());

	            int affected = ps.executeUpdate();
	            if (affected == 0) {
	                throw new SQLException("사용자 등록 실패: 영향받은 행이 없습니다.");
	            }
	            try (ResultSet keys = ps.getGeneratedKeys()) {
	                if (keys.next()) {
	                    user.setId(keys.getInt(1));
	                }
	            }
	        }
	    }
	    ///


	    
	    
    private static final String UPDATE_EXTRA_INFO_SQL =
            "UPDATE users SET tags = ?, bio = ? WHERE id = ?";

      @Override
      public void updateTagsAndBio(int userId, String tags, String bio) throws SQLException {
          try (Connection conn = DBUtil.getConnection();
               PreparedStatement ps = conn.prepareStatement(UPDATE_EXTRA_INFO_SQL)) {
              ps.setString(1, tags);
              ps.setString(2, bio);
              ps.setInt   (3, userId);

              int affected = ps.executeUpdate();
              if (affected == 0) {
                  throw new SQLException("추가 정보 업데이트 실패: 해당 사용자가 없습니다. ID=" + userId);
              }
          }
      }	   
	    
	    
}
