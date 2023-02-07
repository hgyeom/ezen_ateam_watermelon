create database watermelon;

create table userinfo
(
	uno int not null primary key auto_increment,
	name varchar(20),
	gender varchar(2),
	userid varchar(50),
	userpw varchar(100),
	bir date,
	cre_date datetime,
	e_id varchar(100)
);

create table musicinfo
(
	mno int not null primary key,
	album varchar(200),
	redate date,
	title varchar(50),
	singer varchar(50),
	genre varchar(20),
	bpm double,
	ptime varchar(20),
	ls_ptime int,
	img_url text,
	dir_url text
);

create table playlist
(
	pno int not null auto_increment primary key,
	uno int,
	p_name varchar(50) default '플레이리스트',
	p_date datetime default current_timestamp,
	foreign key(uno) references userinfo(uno)
);

create table podcast
(
	pod_no int not null auto_increment primary key,
	mno int,
	foreign key(mno) references musicinfo(mno)
);

create table usermusicinfo
(
	uno int,
	mno int,
	pno int,
	menu int,
	e_date datetime default current_timestamp,
	foreign key(uno) references userinfo(uno),
	foreign key(mno) references musicinfo(mno),
	foreign key(pno) references playlist(pno)
);

