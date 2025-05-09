create database movlog;
use movlog;



-- 1차 핵심 테이블 선언
-- ## 영화 테이블
CREATE TABLE movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    tmdb_id INT UNIQUE,
    title VARCHAR(255) NOT NULL,
    overview TEXT,
    release_date DATE,
    poster_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ## 장르 테이블
CREATE TABLE genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(63) NOT NULL UNIQUE
);

-- ### 영화-장르 연결(중간) 테이블 (identifying relationship)
CREATE TABLE movie_genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

-- ## 태그 테이블 (사용자 지정 태그 등 확장 가능)
CREATE TABLE tag (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(63) UNIQUE
);

-- ### 영화-태그 연결(중간) 테이블 (identifying relationship)
CREATE TABLE movie_tag (
    movie_id INT,
    tag_id INT,
    PRIMARY KEY (movie_id, tag_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tag(tag_id) ON DELETE CASCADE
);

-- ## 사용자 테이블
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT, 
    username VARCHAR(63) NOT NULL UNIQUE,		-- 닉네임 역할
    password VARCHAR(255) NOT NULL, 			-- 자바에서 해시 처리 필요
    email VARCHAR(255) UNIQUE,					-- 로그인 아이디 역할
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ## 리뷰 테이블 (movie, user와 non-identifying 관계)
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating DECIMAL(3,1) CHECK (rating BETWEEN 0.0 AND 10.0),
    comment TEXT,
    visibility ENUM('private', 'friends', 'public') DEFAULT 'public',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);





-- 1차 테스트용 더미 데이터
-- # user
INSERT INTO user (username, password, email)
VALUES
('hanbin', '1234', 'hanbin@naver.com'),
('kosta', '1234', 'kosta@naver.com');

-- # movie
INSERT INTO movie (tmdb_id, title, overview, release_date, poster_path)
VALUES
(496243, '기생충', '가난한 가족이 부잣집과 얽히며 벌어지는 이야기', '2019-05-30', '/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg'),
(27205, '인셉션', '꿈속의 꿈속의 꿈을 통해 정보를 훔치는 이야기', '2010-07-16', '/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg');

-- # genre
INSERT INTO genre (name)
VALUES
('드라마'),
('스릴러'),
('SF');

-- 기생충 = 드라마, 스릴러
INSERT INTO movie_genre (movie_id, genre_id)
VALUES
(1, 1),  -- 기생충-드라마
(1, 2),  -- 기생충-스릴러

-- 인셉션 = SF, 스릴러
(2, 3),  -- 인셉션-SF
(2, 2);  -- 인셉션-스릴러

INSERT INTO tag (name)
VALUES
('명작'), ('심오함'), ('몰입도최고');

-- 인셉션에 '심오함', '몰입도최고' 태그
INSERT INTO movie_tag (movie_id, tag_id)
VALUES
(2, 2),
(2, 3);

-- 기생충에 '명작'
INSERT INTO movie_tag (movie_id, tag_id)
VALUES
(1, 1);

INSERT INTO review (user_id, movie_id, rating, comment, visibility)
VALUES
(1, 1, 9.5, '와 진짜 충격적인 전개...', 'public'),
(2, 2, 8.8, '인셉션 봐도 봐도 어렵다 ㅋㅋ', 'public'),
(1, 2, 9.0, '중간까지 긴장감 장난 아님', 'friends');














