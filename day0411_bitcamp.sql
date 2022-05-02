--연습용 간단한 table생성
--레코드가 여러개 모인게 테이블.
--primary:기본키,notnull, unique 널값허용안함, 똑같은거 값 넣을수없음.
create table test (idx number(5)primary key,--(컬럼이름idx 숫자로하겠단얘기 
    name varchar2(20) not null,
    age number(3),
    email varchar(20) unique);
    
    --테이블 기본구조확인 desc하면 기본구조알수있음.
desc test; 

--데이터추가
insert into test (idx,name,age,email) values (1,'lee',12,'aaa@naver.com');
--전체컬럼데이타추가시 컬럼명 생략가능
insert into test values (2,'kim',23,'kim@nate.com');

--idx값을 안넣었을경우 오류 보기
insert into test (name,age) values ('park',30); -- cannot insert NULL into ("BITCAMP"."TEST"."IDX")

--idx에 이번에는 중복값을 넣었을경우 오류
insert into test (idx,name,age)values(2,'park',30);--unique constraint (BITCAMP.SYS_C006998) violated

--email에 유니크 위배시 오류확인
insert into test (idx,name,email) values (3,'shin','kim@nate.com');-- unique constraint (BITCAMP.SYS_C006999) violated


--데이터 확인
select * from test;

--test 테이블제거 (데이터도 지워짐) 
drop table test;

--위의 test테이블을 제약조건명을 주면서 다시 생성해보자
create table test (idx number(5) CONSTRAINT test_pk_idx primary key,--(컬럼이름idx 숫자로하겠단얘기 CONSTRAINT:이름지정
    name varchar2(20) CONSTRAINT test_nn_name not null,
    age number(3),
    email varchar(20) CONSTRAINT test_uq_email unique);
    
--데이타추가하며 오류 확인하기
insert into test values (1,'aaa',11,'aaa@naver.com');
insert into test (idx,name) values (1,'bbb');--unique constraint (BITCAMP.TEST_PK_IDX) violated
insert into test(idx,name,email) values (2,'bbb','aaa@naver.com');--nique constraint (BITCAMP.TEST_UQ_EMAIL) violated
insert into test (idx,age,email) values (2,12,'bbb@naver.com');--cannot insert NULL into ("BITCAMP"."TEST"."NAME")

--email의 test_uq_email 제약조건 제거
ALTER TABLE test DROP CONSTRAINT test_uq_email;--같은이메일넣으면 이제오류안남, 데이터는살아있고 제약조건만제거

--같은이메일넣어보기
insert into test(idx,name,email) values (2,'bbb','aaa@naver.com');--실행됨.

--새로운 컬럼추가하기
alter table test add blood varchar2(10); --값은 null임

--새로운 컬럼 추가시 초기값지정하기 - 서울역삼동
alter table test add addr varchar2(50) default '서울역삼동';

--컬럼타입수정
alter table test modify addr varchar2(100) ; --50에서 100개로변경

alter table test modify age varchar2(5);--"column to be modified must be empty to change datatype"
--타입이바뀌려면 데이터비어있ㅇ어야가능 

--컬럼제거 drop 다음 컬럼들어감 --데이터 같이지워짐
alter table test drop column blood;

--컬럼명변경 : addr>address
alter table test rename COLUMN addr to address;

--age를 nai로 컬럼변경
alter table test rename column age to nai;

--score 라는 컬럼 추가 타입은 number(5),초기값 50으로
alter table test add score number(5) DEFAULT 50;

--score 컬럼명 변경 jumsoo 로
alter table test rename column score to jumsoo;
--idx 컬럼길이를 5>10ㅇ로 변경
alter table test MODIFY idx number(10);

--전체데이타확인
select * from test;

--테이블구조확인
desc test;
-----------------------시퀀스연습------------------------------
create SEQUENCE seq1; --1부터 1씩증가되는 시퀀스생성
create SEQUENCE seq2 start with 1 INCREMENT by 1; --위와 같음 즉 굳이안써도됟ㅁ
create SEQUENCE seq3 start with 10 INCREMENT by 5; --10부터 시작 5씩증가
create SEQUENCE seq4 nocache;--cache싸이즈가 0
create SEQUENCE seq5 maxvalue 5 cycle nocache; --5까지 증가하면 다시 1로// 프라이머리엔못넣어

--시퀀스제거
drop SEQUENCE seq4;

--시퀀스값출력
select seq2.nextval from dual; --ctrl enter 누르면 1씩증가함
select seq3.nextval from dual; --5씩증가
select seq5.nextval from dual; --1~5 무한반복

--전체 시퀀스 확인
select * from seq;

--남은 시퀀스 모두제거
drop SEQUENCE seq5;

--테이블제거

drop table test;
--------------------------------------------------
create table sawon(
    num number (5) CONSTRAINT sawon_pk_num PRIMARY key,
    name varchar2(20),
    buseo varchar2(20) default '교육부',
    age number(5),
    pay number(10),
    ipsaday date);
    
create SEQUENCE seq_sawon nocache;
--데이타추가
insert into sawon values (seq_sawon.nextval, '강호동','홍보부',34,6700000,'2017-12-11');
insert into sawon (num,name,age,pay,ipsaday) values (seq_sawon.nextval,'이지영',28,3450000,sysdate);
insert into sawon values (seq_sawon.nextval, '유재석','인사부',45,5600000,'2018-03-19');
insert into sawon values (seq_sawon.nextval, '이지니','교육부',26,2800000,'2021-10-12');
insert into sawon values (seq_sawon.nextval, '박제니','홍보부',41,5500000,'2019-12-30');
insert into sawon values (seq_sawon.nextval, '강백호','인사부',38,4780000,'2020-05-06');

commit; --커밋완료라고뜸, 변경사항저장 (DML 명령어에 한해서 insert ,delete, update)

--수정
--강호동의 부서를 홍보>인사로 나이를 34>35로 수정
--update sawon set buseo='인사부',age=35; --이것만 쓰면 쭉다 인사부에 35임

update sawon set buseo='인사부',age=35 where name='강호동';

--박제니의 입사일을 수정하고싶을때
update sawon set ipsaday='2020-12-29' where name='박제니';

--삭제
--num이 3번이 유재석인 데이타 삭제
--delete from sawon --여기까지주면 지워짐다
delete from sawon where num=3;

rollback;--취소 커밋안하면 모든디엠엘명령어다취소됨, 주의// 이미 커멧한건 취소안돼


--확인
select * from sawon order by num;
--------------------------------------------------
--부서별 인원수와 평균 나이 평균연봉 구하기 (순서는 부서의 오름차순)
select buseo 부서명,count(buseo)인원수,floor(avg(age)) 평균나이,to_char(avg(pay), 'L9,999,999') 평균연봉 from sawon group by buseo
order by 부서명;
--floor:무조건내림 to_char(avg(pay), '9,999,999') : 반점찍어줌// L :원달러표시해줌

--서브쿼리연습
--최대 급여를 받는 사람의 이름과 나이와 부서를 출력하시오
select name,age,buseo,pay from sawon where pay=(select max(pay) from sawon);

--평균급여보다 많이 받는사람의 이름과 나이 부서를 출력하시오
select name,age,buseo,pay from sawon where pay>(select avg(pay) from sawon);

--조건을 나타내는함수
--부서가 홍보부면 '용산' , 교육부면 '강남', 인사부면'여의도'
select name 사원명, buseo 부서명, 
decode( buseo,'홍보부','용산','교육부','강남','인사부','여의도') 사무실위치
from sawon;

--case when
select name 사원명,buseo 부서, pay 월급여,
case when pay>=6000000 then '초고연봉'
     when pay>=5000000 then '고연봉'
     when pay>=4000000 then '평균연봉'
     else '최저시급'
end 분류
from sawon;

select name,
case when name in('강호동','유재석','박제니') then '그룹A'
     when name in('이지영','강백호') then '그룹B'
     else '그룹C'
end 그룹
from sawon;

--기존테이블을 복사해새로운테이블생성
create table sawon_a as select *from sawon where buseo='홍보부'; --홍보부에한해서만 델고온다

--확인
select *from sawon_a;

--나이가 35세 이상인인 사원을 sawon_b테이블로 생성
create table sawon_b as select * from sawon where age>=35;
select *from sawon_b;

--------------------------------------------------------
--join 연습
--shop 테이블생성




create table shop(
idx number(5) CONSTRAINT shop_pk_idx PRIMARY key,
sangpum varchar2(20),
color varchar2(20),
price number(10),
ipgoday date);
--jumun 테이블생성(shop 의idx를 외부키로사용)
create table jumun(
num number(5)CONSTRAINT jumun_pk_num primary key,
name varchar2(20),
idx number(5) CONSTRAINT jumun_fk_idx references shop(idx),
cnt number(5)); ---래퍼런스로 외부키사용나타내기



--상품용시퀀스 새로 생성
create SEQUENCE seq_shop nocache;

--shop에 상품등록


insert into shop values (seq_shop.nextval,'블라우스','white',23000,sysdate);
insert into shop values (seq_shop.nextval,'청바지','bule',47000,'2022-03-20');
insert into shop values (seq_shop.nextval,'브이넥티','white',16000,sysdate);
insert into shop values (seq_shop.nextval,'체크남장','red',17000,'2021-12-25');
insert into shop values (seq_shop.nextval,'블라우스','yello',19500,'2021-03-29');
commit;

--상품조회
select * from shop;



--jumun 테이블에 데이타 추가하기
--없는 shop 제품등록시 어떤오류가 나오는지확인
insert into jumun values (seq_shop.nextval,'이영자',4,1);
insert into jumun values (seq_shop.nextval,'유재석',6,2); --6번제품은없음 
--오류:integrity constraint (BITCAMP.JUMUN_FK_IDX) violated - parent key not found >없는걸썼다라는뜻
insert into jumun values (seq_shop.nextval,'유재석',5,3);
insert into jumun values (seq_shop.nextval,'한가인',1,2);
insert into jumun values (seq_shop.nextval,'김태희',3,1);
insert into jumun values (seq_shop.nextval,'김종국',4,3);
insert into jumun values (seq_shop.nextval,'이제니',2,1);
commit;
--주문확인
select * from jumun;

--join 해서 출력 (일치하는 행 출력)
select
j.num,j.name,s.sangpum,s.color,s.price,j.cnt,s.ipgoday
from shop s,jumun j
where s.idx=j.idx;



--컬럼명앞에 테이블명은 어느한쪽만 존재하는 경우 생략이가능바로위에 j.num은 ㅓj만가지고잇어서 num이라해도돼

--상품을 주문한사람이있는 상태에서 상품을 삭제해보자
delete from shop where idx=1; --오류:integrity constraint (BITCAMP.JUMUN_FK_IDX) violated - child record found>>주문한사람이있다는말

--복잡한 쿼리문에서 view만들어놓고 조회가필요할때사용한다

--create 만쓴경우:새로생성만가능 같은이름있으면 오류발생
--create replace : 새로생성하는데 같은 이름있으면 덮어쓴다 
create or replace view mycart
as
select
j.num,j.name,s.sangpum,s.color,s.price,j.cnt,s.ipgoday
from shop s,jumun j
where s.idx=j.idx; --오류발생 (권한이 없어서,,,system에가서 bitcamp에 create view 에 관한 권한 추가한다)

--view 조회
select *from mycart;


