drop table if exists fs_user;
drop table if exists fs_flight_plan;

create table fs_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default 0,
	primary key (id)
) engine=InnoDB;

CREATE TABLE fs_flight_plan (
	id BIGINT(20) NOT NULL AUTO_INCREMENT,
	addressee VARCHAR(500) NULL DEFAULT NULL,
	filing_time CHAR(6) NULL DEFAULT NULL,
	originator VARCHAR(8) NULL DEFAULT NULL,
	aircraft_identification VARCHAR(7) NULL DEFAULT NULL,
	flight_rules CHAR(1) NULL DEFAULT NULL,
	type_of_flight CHAR(1) NULL DEFAULT NULL,
	flight_number SMALLINT NULL DEFAULT NULL,
	type_of_aircraft VARCHAR(4) NULL DEFAULT NULL,
	wake_turbulence_cat CHAR(1) NULL DEFAULT NULL,
	equipment VARCHAR(20) NULL DEFAULT NULL,
	departure_aerodrome VARCHAR(4) NULL DEFAULT NULL,
	departure_time CHAR(4) NULL DEFAULT NULL,
	cruising_speed VARCHAR(5) NULL DEFAULT NULL,
	flight_level VARCHAR(5) NULL DEFAULT NULL,
	route VARCHAR(1000) NULL DEFAULT NULL,
	destination_aerodrome VARCHAR(4) NULL DEFAULT NULL,
	total_eet CHAR(50) NULL DEFAULT NULL,
	altn_aerodrome VARCHAR(4) NULL DEFAULT NULL,
	altn2rd_aerodrome VARCHAR(4) NULL DEFAULT NULL,
	other_information VARCHAR(1000) NULL DEFAULT NULL,
	endurance CHAR(4) NULL DEFAULT NULL,
	persons_on_board SMALLINT NULL DEFAULT NULL,
	emergency_radio VARCHAR(5) NULL DEFAULT NULL,
	survival_equipment VARCHAR(4) NULL DEFAULT NULL,
	survival_jackets VARCHAR(4) NULL DEFAULT NULL,
	dingies_number TINYINT NULL DEFAULT NULL,
	dingies_capacity SMALLINT NULL DEFAULT NULL,
	dingies_cover CHAR(1) NULL DEFAULT NULL,
	dingies_colour VARCHAR(20) NULL DEFAULT NULL,
	aircraft_colour_and_markings VARCHAR(50) NULL DEFAULT NULL,
	remarks VARCHAR(500) NULL DEFAULT NULL,
	pilot_in_command VARCHAR(100) NULL DEFAULT NULL,
	filed_by VARCHAR(100) NULL DEFAULT NULL,
	telephone VARCHAR(100) NULL DEFAULT NULL,
	sys_fill_user_id INT NULL DEFAULT NULL,
	sys_fill_time TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (id)
)
COMMENT='Flight Plan Form'
ENGINE=InnoDB;