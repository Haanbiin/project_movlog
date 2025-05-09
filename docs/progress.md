# Movlog 작업 일지
> __2025-05-09 금요일__

---

## # 오늘의 작업

### 1. 데이터베이스 초안 생성 :
#### 1-1. SQL
    1) 핵심 테이블 create
    2) 테스트용 더미 데이터 insert
#### 1-2. __TMDB(The Movie Database)__
    1) 회원가입 > API 발급 완료
    2) TMDB에서 제공하는 정보들
        - id : 고유 id, 숫자
        - title : 제목
        - original_title : 원제
        - overview : 줄거리 요약
        - release_date : 개봉일
        - poster_path : 포스터 링크
        - backdrop_path : 배경 이미지
        - vote_average : 평균 평점
        - vote_count : 평점 수
        - popularity : tmbd 내 인기도 점수
        - genres : 장르 id
        ---
        - runtime : 상영시간(분)
        - status : 상영상태
        - tagline : 영화의 짧은 문구
        - budget : 제작비
        - revenue : 총 수익
        - production_companies : 제작사 목록
        ---
        - append_to_response > 추가 정보 요청
        - credits : 감독, 배우 정보
        - videos : 예고편, 티저 등 영상
        - 
### 2. Git 세팅
    1) main, develop 등 브랜치까지 조금 만들었음

### 3. 레이아웃 작업 시작 with Figma
    1) 

---


## # Study & Practice
    1) git
        - git checkout -b 브랜치명 (루트브랜치명)  
          git push origin -u 브랜치명
            > -u : 초기 remote와 local 연결
        
        - git commit -m '한 줄 메시지'
          git commit 
            > VIM 
            > i > 긴 커밋 메시지 
            > ESC, :wq

        -

---
## # Next
    - MVC packaging
    - DB>table>movie> 원제(original_title) 추가




