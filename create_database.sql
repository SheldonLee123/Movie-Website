drop database movie; 
create database if not exists movie default charset utf8 collate utf8_general_ci;
use movie;  
create table user(
	id int primary key auto_increment,
    name varchar(100) not null unique,
    pwd varchar(100) not null,
    email varchar(100) unique,
    phone varchar(11) unique,
	info text,
    face varchar(255) unique,
    addtime datetime default current_timestamp,
    uuid varchar(255) unique
);

create table userlog(
	id int primary key auto_increment,
    user_id int,
    ip varchar(100),
    addtime timestamp default current_timestamp,
    foreign key(user_id) references user(id)
);

create table tag(
	id int primary key auto_increment,
    name varchar(100) unique,
    addtime datetime default current_timestamp
);

create table movie (
	id int primary key auto_increment,
    title varchar(255) unique,
    url varchar(255) unique,
    info text,
    logo varchar(255) unique,
    star smallint,
    playnum bigint,
    commentnum bigint,
    tag_id int,
    foreign key(tag_id) references tag(id),
    area varchar(255),
    release_time date,
    length varchar(100),
    addtime datetime default current_timestamp
);

create table preview(
	id int primary key auto_increment,
    title varchar(255) unique,
    logo varchar(255) unique,
    addtime datetime default current_timestamp
);

create table comment(
	id int primary key auto_increment,
    content text,
    movie_id int,
    foreign key(movie_id) references movie(id),
    user_id int,
    foreign key(user_id) references user(id),
    addtime datetime default current_timestamp
);

create table moviecol(
	id int primary key auto_increment,
    movie_id int,
    user_id int,
    foreign key(movie_id) references movie(id),
    foreign key(user_id) references user(id),
    addtime datetime default current_timestamp
);

create table auth(
	id int primary key auto_increment,
    name varchar(100) unique,
    url varchar(255) unique,
    addtime datetime default current_timestamp
);

create table role(
	id int primary key auto_increment,
    name varchar(100) unique,
	auths varchar(600),
    addtime datetime default current_timestamp
);

create table admin(
	id int primary key auto_increment,
    name varchar(100) unique,
    pwd varchar(100),
    is_Super smallint,
    role_id int,
    foreign key(role_id) references role(id),
    addtime datetime default current_timestamp
);

create table adminlog(
	id int primary key auto_increment,
    admin_id int,
    foreign key(admin_id) references admin(id),
    ip varchar(100),
    addtime datetime default current_timestamp
);

create table oplog(
	id int primary key auto_increment,
    admin_id int,
    foreign key(admin_id) references admin(id),
    ip varchar(100),
    reason varchar(600),
    addtime datetime default current_timestamp
);