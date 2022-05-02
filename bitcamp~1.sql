
--join연습용 테이블생성
--부모테이블:음식목록


create table food (
idx number(5) CONSTRAINT food_pk_idx primary key, --이름_프라이머리키_idx
foodname varchar2(20) not null,
price number(7) not null);


--자식테이블 :on delete cascade:부모테이블의 데이타를지우면 자식테이블의 데이타가 자동으로 지워진다.
create table foodjumun (
num number(5) CONSTRAINT foodjumun_fk_idx primary key,
name varchar2(20),
idx number(5),
foodtime date,
CONSTRAINT foodjumun_fk_idx FOREIGN key(idx) REFERENCES food(idx) on delete cascade);

--사용할 시퀀스생성
create sequence seq_food start with 1 increment by 1 nocache;

--food의 foodname을 넉넉히 50 바이트로 변경
alter table food modify foodname varchar2(50);

--food 테이블에 데이타 넣기
insert into food values (10,'봉골레스파게티',17000);
insert into food values (20,'새우볶음밥',11000);
insert into food values (30,'된장찌개',8000);
insert into food values (40,'크림스파게티',12000);
insert into food values (50,'짜장면',8000);
insert into food values (60,'순두부찌개',9000);




