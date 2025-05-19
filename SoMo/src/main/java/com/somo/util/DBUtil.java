package com.somo.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * DB 연결 관리: Driver 로딩 및 Connection 획득
 */
public class DBUtil {
    // 클래스패스 최상단의 db.properties 파일을 로드
    private static final String PROPS_FILE = "/db.properties";
    private static final Properties props = new Properties();

    static {
        try (InputStream in = DBUtil.class.getResourceAsStream(PROPS_FILE)) {
            if (in == null) {
                throw new RuntimeException("Properties 파일을 찾을 수 없습니다: " + PROPS_FILE);
            }
            props.load(in);
            Class.forName(props.getProperty("db.driverClassName"));
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException("DBUtil 초기화 오류", e);
        }
    }

    /**
     * 데이터베이스 Connection을 반환합니다.
     * @return Connection 객체
     * @throws SQLException 연결 오류 시 예외 발생
     */
    public static Connection getConnection() throws SQLException {
        String url  = props.getProperty("db.url");
        String user = props.getProperty("db.username");
        String pass = props.getProperty("db.password");
        return DriverManager.getConnection(url, user, pass);
    }
}