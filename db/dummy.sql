
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



