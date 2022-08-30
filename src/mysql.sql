-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- gj_tennis Table Create SQL
CREATE TABLE gj_tennis
(
    `courtno`     INT             NOT NULL    AUTO_INCREMENT COMMENT '테니스장 번호', 
    `courtname`   VARCHAR(45)     NOT NULL    COMMENT '테니스장 이름', 
    `courttel`    VARCHAR(20)     NOT NULL    COMMENT '연락처', 
    `cocurtaddr`  VARCHAR(100)    NOT NULL    COMMENT '주소', 
     PRIMARY KEY (courtno)
);

ALTER TABLE gj_tennis COMMENT '광주광역시내 테니스장';


-- member Table Create SQL
CREATE TABLE member
(
    `id`        VARCHAR(20)    NOT NULL    COMMENT '아이디', 
    `password`  VARCHAR(20)    NOT NULL    COMMENT '비밀번호', 
    `nick`      VARCHAR(20)    NOT NULL  UNIQUE  COMMENT '닉네임', 
    `tel`       VARCHAR(20)    NOT NULL    COMMENT '연락처', 
     PRIMARY KEY (id)
);

ALTER TABLE member COMMENT '회원';


-- coach Table Create SQL
CREATE TABLE coach
(
    `coachno`    INT            NOT NULL    AUTO_INCREMENT COMMENT '코치 번호', 
    `coachname`  VARCHAR(20)    NOT NULL    COMMENT '이름', 
    `coachtel`   VARCHAR(20)    NOT NULL    COMMENT '연락처', 
    `courtno`    INT            NOT NULL    COMMENT '소속 테니스장 번호', 
     PRIMARY KEY (coachno)
);

ALTER TABLE coach COMMENT '테니스 코치';

ALTER TABLE coach
    ADD CONSTRAINT FK_coach_courtno_gj_tennis_courtno FOREIGN KEY (courtno)
        REFERENCES gj_tennis (courtno) ON DELETE CASCADE ON UPDATE CASCADE;


-- tennis_court Table Create SQL
CREATE TABLE tennis_court
(
    `courtcode`  VARCHAR(20)    NOT NULL    COMMENT '코트 코드', 
    `courtno`    INT            NOT NULL    COMMENT '소속 테니스장 번호', 
     PRIMARY KEY (courtcode)
);

ALTER TABLE tennis_court COMMENT '테니스 코트';

ALTER TABLE tennis_court
    ADD CONSTRAINT FK_tennis_court_courtno_gj_tennis_courtno FOREIGN KEY (courtno)
        REFERENCES gj_tennis (courtno) ON DELETE CASCADE ON UPDATE CASCADE;


-- board Table Create SQL
CREATE TABLE board
(
    `boardno`    INT              NOT NULL    AUTO_INCREMENT COMMENT '게시판번호', 
    `id`         VARCHAR(20)      NOT NULL    COMMENT '아이디 : 게시자', 
    `title`      VARCHAR(20)      NOT NULL    COMMENT '제목', 
    `content`    VARCHAR(2000)    NOT NULL    COMMENT '내용', 
    `date`       DATE             NOT NULL    COMMENT '게시일', 
    `boardtype`  VARCHAR(20)      NOT NULL    COMMENT '타입', 
     PRIMARY KEY (boardno)
);

ALTER TABLE board COMMENT '게시판';

ALTER TABLE board
    ADD CONSTRAINT FK_board_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE ON UPDATE CASCADE;


-- reservation Table Create SQL
CREATE TABLE reservation
(
    `id`         VARCHAR(20)    NOT NULL    COMMENT '아이디 : 레슨 수강자', 
    `coachno`    INT            NULL        COMMENT '코치 번호', 
    `courtcode`  VARCHAR(20)    NOT NULL    COMMENT '코트 코드', 
    `revdate`    DATE           NOT NULL    COMMENT '사용 날짜', 
    `revtime`    VARCHAR(50)    NOT NULL    COMMENT '사용 시간', 
    `revtype`    VARCHAR(50)    NOT NULL    COMMENT '예약 타입'
);

ALTER TABLE reservation COMMENT '테니스 예약 정보';

ALTER TABLE reservation
    ADD CONSTRAINT FK_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE reservation
    ADD CONSTRAINT FK_reservation_courtcode_tennis_court_courtcode FOREIGN KEY (courtcode)
        REFERENCES tennis_court (courtcode) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE reservation
    ADD CONSTRAINT FK_reservation_coachno_coach_coachno FOREIGN KEY (coachno)
        REFERENCES coach (coachno) ON DELETE CASCADE ON UPDATE CASCADE;


