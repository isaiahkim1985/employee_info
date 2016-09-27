
DB : Oracle 11g
=============================================================================================================================

create table personal(
  p_num NUMBER not null,
  p_name VARCHAR2(30) not null,
  p_number VARCHAR2(30) not null,
  p_sex VARCHAR2(20) not null,
  p_phone VARCHAR2(40),
  p_cell VARCHAR2(40),
  p_company VARCHAR2(50),
  p_join VARCHAR2(30),
  p_dept VARCHAR2(30),
  p_position VARCHAR2(30),
  p_marriage VARCHAR2(20),
  pm_complete VARCHAR2(20),
  pm_start VARCHAR2(30),
  pm_end VARCHAR2(30),
  pm_branch VARCHAR2(50),
  p_email VARCHAR2(60),
  p_addr VARCHAR2(100),
  CONSTRAINT personal_PK PRIMARY KEY(p_num)
);
create SEQUENCE personal_seq
start with 1
increment by 1
nocycle;

create TABLE edu_background(
  edu_num number,
  p_num NUMBER,
  edu_name VARCHAR2(30),
  edu_date VARCHAR2(30),
  edu_inout VARCHAR2(20),
  CONSTRAINT edu_background_PK PRIMARY KEY(edu_num),
  CONSTRAINT edu_background_FK FOREIGN KEY(p_num) REFERENCES personal(p_num) on delete CASCADE
);
create SEQUENCE edu_background_seq
start with 1
increment by 1
nocycle;

create TABLE license(
  l_num number,
  p_num NUMBER,
  l_name VARCHAR2(30),
  l_date VARCHAR2(40),
  CONSTRAINT license_PK PRIMARY KEY(l_num),
  CONSTRAINT license_FK FOREIGN KEY(p_num) REFERENCES personal(p_num) on delete CASCADE
);
create SEQUENCE license_seq
start with 1
increment by 1
nocycle;

create TABLE career(
  c_num number,
  p_num NUMBER,
  c_name VARCHAR2(30),
  c_start VARCHAR2(40),
  c_end VARCHAR2(40),
  c_position VARCHAR2(50),
  c_dept VARCHAR2(30),
  CONSTRAINT career_PK PRIMARY KEY(c_num),
  CONSTRAINT career_FK FOREIGN KEY(p_num) REFERENCES personal(p_num) on delete CASCADE
);
create SEQUENCE career_seq
start with 1
increment by 1
nocycle;

create TABLE training(
  t_num number,
  p_num NUMBER,
  t_name VARCHAR2(50),
  t_start VARCHAR2(40),
  t_end VARCHAR2(40),
  t_institution VARCHAR2(50),
  CONSTRAINT training_PK PRIMARY KEY(t_num),
  CONSTRAINT training_FK FOREIGN KEY(p_num) REFERENCES personal(p_num) on delete CASCADE
);
create SEQUENCE training_seq
start with 1
increment by 1
nocycle;

create TABLE skill(
  s_num number,
  p_num NUMBER,
  s_ability VARCHAR2(50),
  s_level VARCHAR2(20),
  CONSTRAINT skill_PK PRIMARY KEY(s_num),
  CONSTRAINT skill_FK FOREIGN KEY(p_num) REFERENCES personal(p_num) on delete CASCADE
);
create SEQUENCE skill_seq
start with 1
increment by 1
nocycle;

commit;

================================================================================================
