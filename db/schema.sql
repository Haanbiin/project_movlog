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

ALTER TABLE movie
	ADD COLUMN original_title VARCHAR(255),
	ADD COLUMN runtime INT,
	ADD COLUMN vote_average DECIMAL(3,1),
	ADD COLUMN vote_count INT,
	ADD COLUMN tagline VARCHAR(255);
    
--  ## 예고편, 티저 등의 영상 정보 테이블
CREATE TABLE movie_video (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    name VARCHAR(255),             -- 영상 이름 (예: Official Trailer #1)
    site VARCHAR(63),              -- 플랫폼 (예: YouTube)
    type VARCHAR(63),              -- 예고편 유형 (예: Trailer, Teaser)
    key_code VARCHAR(63),          -- site에서 사용하는 video key (예: 유튜브 영상 ID)
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

-- ## 인물 정보 테이블: 배우, 감독 등
CREATE TABLE person (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(63) NOT NULL,         -- 인물 이름
    role ENUM('cast', 'crew') NOT NULL, -- cast(출연), crew(제작진)
    job VARCHAR(63)                     -- 역할 (예: Actor, Director, Writer 등)
);

-- ## 영화-인물 연결 테이블 (다대다 관계)
CREATE TABLE movie_person (
    movie_id INT,
    person_id INT,
    character_name VARCHAR(63),     -- 출연자의 배역명 (crew는 NULL 가능)
    PRIMARY KEY (movie_id, person_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES person(person_id) ON DELETE CASCADE
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



show tables;
select * from movie;
select * from user;
select * from review













