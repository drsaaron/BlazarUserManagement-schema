create table blazarusermanagement.USER_INFO
(
	USER_NUM bigint unsigned NOT NULL AUTO_INCREMENT,
	USER_ID varchar(25) not null,
	DISPLAY_NAME varchar(255) not null,
	USER_PWD varchar(255) not null,

	ROW_CREATE_DTM timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    	LAST_MODIFIED_DTM        TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	primary key(USER_NUM),
	unique key(USER_ID)
)