
--join연습용 테이블생성
--부모테이블:음식목록


create table food (
idx number(5) CONSTRAINT food_pk_idx primary key, --이름_프라이머리키_idx
foodname varchar2(20) not null,
price number(7) not null);


--자식테이블 :on delete cascade:부모테이블의 데이타를지우면 자식테이블의 데이타가 자동으로 지워진다.
create table foodjumun (
  num number(5) CONSTRAINT foodjumun_pk_num PRIMARY key,
  name varchar2(20),
  idx number(5),
  foodtime date,
  CONSTRAINT foodjumun_fk_idx FOREIGN key(idx) REFERENCES food(idx) on delete cascade);
  --온딜리트 에스케이드 :음식지웟어 스파게티 열명주문시 주문자 자동으로지워짐 원글을지우면 댓글이다지워짐.
  


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

--확인
select * from food;

--음식주문테이블에 데이타넣기
insert into foodjumun values (seq_food.nextval,'유재석',20,'2022-04-15');
insert into foodjumun values (seq_food.nextval,'강호동',10,'2022-05-10');
insert into foodjumun values (seq_food.nextval,'이영자',50,sysdate);
insert into foodjumun values (seq_food.nextval,'유진',60,'2022-04-10');
insert into foodjumun values (seq_food.nextval,'한지혜',20,'2022-03-15');
commit;

--확인
select * from food;
select * from foodjumun;

--join
--방법1
select name 주문자, foodname 음식명, price 가격, to_char(foodtime,'yyyy-mm-dd') 예약일
from food,foodjumun
where food.idx=foodjumun.idx;

--방법2
select name 주문자, foodname 음식명, price 가격, to_char(foodtime,'yyyy-mm-dd') 예약일
from food inner join foodjumun
on food.idx=foodjumun.idx;  --결과는 둘다같음.

--outer join:foodjumun에 없는 food 데이터(null) 출력 아무도 주문하지않은 음식을 알고싶다.
select foodname 인기없는음식
from food,foodjumun
where food.idx=foodjumun.idx(+) and num is null;

--null이 나오는 데이타는 food에는 있는데 foodjumun 에는 없는 데이터
select *
from food,foodjumun
where food.idx=foodjumun.idx(+);

--food에서 idx가 20인 음식을 삭제시 foodjumun도 확인하기
delete from food where idx=20;