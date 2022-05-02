--------------------------------------------------------
--  파일이 생성됨 - 목요일-4월-14-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View MYCART
--------------------------------------------------------


CREATE OR REPLACE FORCE VIEW "BITCAMP"."MYCART" ("NUM", "NAME", "SANGPUM", "COLOR", "PRICE", "CNT", "IPGODAY") AS 
select
j.num,j.name,s.sangpum,s.color,s.price,j.cnt,s.ipgoday
from shop s,jumun j
where s.idx=j.idx
;
REM INSERTING into BITCAMP.MYCART
SET DEFINE OFF;
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (12,'한가인','블라우스','yello',19500,2,to_date('21/03/29','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (15,'이제니','블라우스','white',23000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (13,'김태희','청바지','bule',47000,1,to_date('22/03/20','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (14,'김종국','브이넥티','white',16000,3,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (9,'이영자','브이넥티','white',16000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (8,'이영자','브이넥티','white',16000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (6,'이영자','브이넥티','white',16000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (11,'유재석','체크남장','red',17000,3,to_date('21/12/25','RR/MM/DD'));
