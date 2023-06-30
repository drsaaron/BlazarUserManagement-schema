create table blazarusermanagement.USER_ROLE_TYPE_VAL
(
	USER_ROLE_TYPE_CDE smallint unsigned not null,
	USER_ROLE_TYPE_TXT varchar(25) not null,

	primary key (USER_ROLE_TYPE_CDE)
);

create table blazarusermanagement.USER_ROLE
(
	USER_ROLE_NUM bigint unsigned NOT NULL AUTO_INCREMENT,
	USER_NUM bigint unsigned NOT NULL,
	USER_ROLE_TYPE_CDE smallint unsigned not null,

	primary key (USER_ROLE_NUM),
	key(USER_NUM),
	key(USER_ROLE_TYPE_CDE),

	foreign key (USER_NUM) references USER_INFO (USER_NUM),
	foreign key (USER_ROLE_TYPE_CDE) references USER_ROLE_TYPE_VAL (USER_ROLE_TYPE_CDE)
)
