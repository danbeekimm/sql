--------------------------------------------------------
--  ������ ������ - �����-4��-14-2022   
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
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (12,'�Ѱ���','���콺','yello',19500,2,to_date('21/03/29','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (15,'������','���콺','white',23000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (13,'������','û����','bule',47000,1,to_date('22/03/20','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (14,'������','���̳�Ƽ','white',16000,3,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (9,'�̿���','���̳�Ƽ','white',16000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (8,'�̿���','���̳�Ƽ','white',16000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (6,'�̿���','���̳�Ƽ','white',16000,1,to_date('22/04/11','RR/MM/DD'));
Insert into BITCAMP.MYCART (NUM,NAME,SANGPUM,COLOR,PRICE,CNT,IPGODAY) values (11,'���缮','üũ����','red',17000,3,to_date('21/12/25','RR/MM/DD'));
