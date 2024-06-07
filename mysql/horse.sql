
CREATE TABLE `horses` (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  gender enum('牡','牝','セ') NOT NULL,
  age int unsigned NOT NULL,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
);

create table races (
    id bigint unsigned NOT NULL,
    name varchar(255) NOT NULL,
    race_course varchar(255) NOT NULL,
    date varchar(255) NOT NULL ,
    class varchar(255) NOT NULL ,
    type enum('芝','ダ') NOT NULL,
    distance int unsigned NOT NULL,
    turn enum('右','左','直'),
    track_condition enum('良','稍','重','不良') NOT NULL,
    weather enum('晴','曇','雨','小雨','雪','小雪') NOT NULL,
    created_at datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    PRIMARY KEY (id)
);


create table race_mappings (
    id int unsigned NOT NULL AUTO_INCREMENT,
    horse_id int unsigned NOT NULL,
    race_id bigint unsigned NOT NULL,
    created_at datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (horse_id) references horses (id),
    FOREIGN KEY (race_id) references races (id)
);

create table race_results (
    id int unsigned NOT NULL AUTO_INCREMENT,
    race_mapping_id int unsigned NOT NULL,
    jockey varchar(255) NOT NULL ,
    horse_number int unsigned NOT NULL,
    time varchar(255) NOT NULL,
    odds int unsigned NOT NULL,
    position varchar(255) NOT NULL,
    result  varchar(255) NOT NULL,
    horse_weight int unsigned NOT NULL,
    weight_gain int,
    gender enum('牡','牝','セ'),
    age int NOT NULL,
    weight float,
    three_furlong float,
    favorite int unsigned,
    race_course varchar(255) NOT NULL,
    created_at datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (race_mapping_id) references race_mappings (id)
);