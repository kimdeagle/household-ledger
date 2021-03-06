CREATE TABLE SY_USER(
	NO INT NOT NULL AUTO_INCREMENT,
    ID VARCHAR(15) NOT NULL UNIQUE,
    PW VARCHAR(15) NOT NULL,
    NAME VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(100),
    REGIST_DATE DATETIME NOT NULL DEFAULT NOW(),
    UPDATE_DATE DATETIME,
    PRIMARY KEY (NO)
);

INSERT INTO SY_USER
	(ID, PW, NAME, EMAIL)
VALUES
	('test', 'test', '테스터', 'test@test.com');

CREATE TABLE SY_LEDGER(
	NO INT NOT NULL AUTO_INCREMENT,
    USER_NO INT NOT NULL,
    ADD_DATE DATETIME NOT NULL,
    AMOUNT INT NOT NULL,
    CONTENT VARCHAR(60) NOT NULL,
    IN_OUT VARCHAR(10) NOT NULL,
    CATEGORY VARCHAR(15) NOT NULL,
    ASSET VARCHAR(10) NOT NULL,
    PRIMARY KEY (NO),
    FOREIGN KEY (USER_NO) REFERENCES SY_USER (NO)
);

INSERT INTO SY_LEDGER
	(USER_NO, ADD_DATE, AMOUNT, CONTENT, IN_OUT, CATEGORY, ASSET)
VALUES
	(1, '2021-07-12', 35000, '테스트 내용', 'in', '월급', '계좌');


CREATE TABLE SY_LOGIN_HISTORY(
	USER_NO INT NOT NULL,
    LOGIN_DATE DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (USER_NO) REFERENCES SY_USER (NO)
);