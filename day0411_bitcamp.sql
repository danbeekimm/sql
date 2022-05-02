--������ ������ table����
--���ڵ尡 ������ ���ΰ� ���̺�.
--primary:�⺻Ű,notnull, unique �ΰ�������, �Ȱ����� �� ����������.
create table test (idx number(5)primary key,--(�÷��̸�idx ���ڷ��ϰڴܾ�� 
    name varchar2(20) not null,
    age number(3),
    email varchar(20) unique);
    
    --���̺� �⺻����Ȯ�� desc�ϸ� �⺻�����˼�����.
desc test; 

--�������߰�
insert into test (idx,name,age,email) values (1,'lee',12,'aaa@naver.com');
--��ü�÷�����Ÿ�߰��� �÷��� ��������
insert into test values (2,'kim',23,'kim@nate.com');

--idx���� �ȳ־������ ���� ����
insert into test (name,age) values ('park',30); -- cannot insert NULL into ("BITCAMP"."TEST"."IDX")

--idx�� �̹����� �ߺ����� �־������ ����
insert into test (idx,name,age)values(2,'park',30);--unique constraint (BITCAMP.SYS_C006998) violated

--email�� ����ũ ����� ����Ȯ��
insert into test (idx,name,email) values (3,'shin','kim@nate.com');-- unique constraint (BITCAMP.SYS_C006999) violated


--������ Ȯ��
select * from test;

--test ���̺����� (�����͵� ������) 
drop table test;

--���� test���̺��� �������Ǹ��� �ָ鼭 �ٽ� �����غ���
create table test (idx number(5) CONSTRAINT test_pk_idx primary key,--(�÷��̸�idx ���ڷ��ϰڴܾ�� CONSTRAINT:�̸�����
    name varchar2(20) CONSTRAINT test_nn_name not null,
    age number(3),
    email varchar(20) CONSTRAINT test_uq_email unique);
    
--����Ÿ�߰��ϸ� ���� Ȯ���ϱ�
insert into test values (1,'aaa',11,'aaa@naver.com');
insert into test (idx,name) values (1,'bbb');--unique constraint (BITCAMP.TEST_PK_IDX) violated
insert into test(idx,name,email) values (2,'bbb','aaa@naver.com');--nique constraint (BITCAMP.TEST_UQ_EMAIL) violated
insert into test (idx,age,email) values (2,12,'bbb@naver.com');--cannot insert NULL into ("BITCAMP"."TEST"."NAME")

--email�� test_uq_email �������� ����
ALTER TABLE test DROP CONSTRAINT test_uq_email;--�����̸��ϳ����� ���������ȳ�, �����ʹ»���ְ� �������Ǹ�����

--�����̸��ϳ־��
insert into test(idx,name,email) values (2,'bbb','aaa@naver.com');--�����.

--���ο� �÷��߰��ϱ�
alter table test add blood varchar2(10); --���� null��

--���ο� �÷� �߰��� �ʱⰪ�����ϱ� - ���￪�ﵿ
alter table test add addr varchar2(50) default '���￪�ﵿ';

--�÷�Ÿ�Լ���
alter table test modify addr varchar2(100) ; --50���� 100���κ���

alter table test modify age varchar2(5);--"column to be modified must be empty to change datatype"
--Ÿ���̹ٲ���� �����ͺ���֤���߰��� 

--�÷����� drop ���� �÷��� --������ ����������
alter table test drop column blood;

--�÷����� : addr>address
alter table test rename COLUMN addr to address;

--age�� nai�� �÷�����
alter table test rename column age to nai;

--score ��� �÷� �߰� Ÿ���� number(5),�ʱⰪ 50����
alter table test add score number(5) DEFAULT 50;

--score �÷��� ���� jumsoo ��
alter table test rename column score to jumsoo;
--idx �÷����̸� 5>10���� ����
alter table test MODIFY idx number(10);

--��ü����ŸȮ��
select * from test;

--���̺���Ȯ��
desc test;
-----------------------����������------------------------------
create SEQUENCE seq1; --1���� 1�������Ǵ� ����������
create SEQUENCE seq2 start with 1 INCREMENT by 1; --���� ���� �� ���̾Ƚᵵ�ޤ�
create SEQUENCE seq3 start with 10 INCREMENT by 5; --10���� ���� 5������
create SEQUENCE seq4 nocache;--cache����� 0
create SEQUENCE seq5 maxvalue 5 cycle nocache; --5���� �����ϸ� �ٽ� 1��// �����̸Ӹ������־�

--����������
drop SEQUENCE seq4;

--�����������
select seq2.nextval from dual; --ctrl enter ������ 1��������
select seq3.nextval from dual; --5������
select seq5.nextval from dual; --1~5 ���ѹݺ�

--��ü ������ Ȯ��
select * from seq;

--���� ������ �������
drop SEQUENCE seq5;

--���̺�����

drop table test;
--------------------------------------------------
create table sawon(
    num number (5) CONSTRAINT sawon_pk_num PRIMARY key,
    name varchar2(20),
    buseo varchar2(20) default '������',
    age number(5),
    pay number(10),
    ipsaday date);
    
create SEQUENCE seq_sawon nocache;
--����Ÿ�߰�
insert into sawon values (seq_sawon.nextval, '��ȣ��','ȫ����',34,6700000,'2017-12-11');
insert into sawon (num,name,age,pay,ipsaday) values (seq_sawon.nextval,'������',28,3450000,sysdate);
insert into sawon values (seq_sawon.nextval, '���缮','�λ��',45,5600000,'2018-03-19');
insert into sawon values (seq_sawon.nextval, '������','������',26,2800000,'2021-10-12');
insert into sawon values (seq_sawon.nextval, '������','ȫ����',41,5500000,'2019-12-30');
insert into sawon values (seq_sawon.nextval, '����ȣ','�λ��',38,4780000,'2020-05-06');

commit; --Ŀ�ԿϷ����, ����������� (DML ��ɾ ���ؼ� insert ,delete, update)

--����
--��ȣ���� �μ��� ȫ��>�λ�� ���̸� 34>35�� ����
--update sawon set buseo='�λ��',age=35; --�̰͸� ���� �ߴ� �λ�ο� 35��

update sawon set buseo='�λ��',age=35 where name='��ȣ��';

--�������� �Ի����� �����ϰ������
update sawon set ipsaday='2020-12-29' where name='������';

--����
--num�� 3���� ���缮�� ����Ÿ ����
--delete from sawon --��������ָ� ��������
delete from sawon where num=3;

rollback;--��� Ŀ�Ծ��ϸ� ���𿥿���ɾ����ҵ�, ����// �̹� Ŀ���Ѱ� ��Ҿȵ�


--Ȯ��
select * from sawon order by num;
--------------------------------------------------
--�μ��� �ο����� ��� ���� ��տ��� ���ϱ� (������ �μ��� ��������)
select buseo �μ���,count(buseo)�ο���,floor(avg(age)) ��ճ���,to_char(avg(pay), 'L9,999,999') ��տ��� from sawon group by buseo
order by �μ���;
--floor:�����ǳ��� to_char(avg(pay), '9,999,999') : ���������// L :���޷�ǥ������

--������������
--�ִ� �޿��� �޴� ����� �̸��� ���̿� �μ��� ����Ͻÿ�
select name,age,buseo,pay from sawon where pay=(select max(pay) from sawon);

--��ձ޿����� ���� �޴»���� �̸��� ���� �μ��� ����Ͻÿ�
select name,age,buseo,pay from sawon where pay>(select avg(pay) from sawon);

--������ ��Ÿ�����Լ�
--�μ��� ȫ���θ� '���' , �����θ� '����', �λ�θ�'���ǵ�'
select name �����, buseo �μ���, 
decode( buseo,'ȫ����','���','������','����','�λ��','���ǵ�') �繫����ġ
from sawon;

--case when
select name �����,buseo �μ�, pay ���޿�,
case when pay>=6000000 then '�ʰ���'
     when pay>=5000000 then '����'
     when pay>=4000000 then '��տ���'
     else '�����ñ�'
end �з�
from sawon;

select name,
case when name in('��ȣ��','���缮','������') then '�׷�A'
     when name in('������','����ȣ') then '�׷�B'
     else '�׷�C'
end �׷�
from sawon;

--�������̺��� �����ػ��ο����̺����
create table sawon_a as select *from sawon where buseo='ȫ����'; --ȫ���ο����ؼ��� ����´�

--Ȯ��
select *from sawon_a;

--���̰� 35�� �̻����� ����� sawon_b���̺�� ����
create table sawon_b as select * from sawon where age>=35;
select *from sawon_b;

--------------------------------------------------------
--join ����
--shop ���̺����




create table shop(
idx number(5) CONSTRAINT shop_pk_idx PRIMARY key,
sangpum varchar2(20),
color varchar2(20),
price number(10),
ipgoday date);
--jumun ���̺����(shop ��idx�� �ܺ�Ű�λ��)
create table jumun(
num number(5)CONSTRAINT jumun_pk_num primary key,
name varchar2(20),
idx number(5) CONSTRAINT jumun_fk_idx references shop(idx),
cnt number(5)); ---���۷����� �ܺ�Ű��볪Ÿ����



--��ǰ������� ���� ����
create SEQUENCE seq_shop nocache;

--shop�� ��ǰ���


insert into shop values (seq_shop.nextval,'���콺','white',23000,sysdate);
insert into shop values (seq_shop.nextval,'û����','bule',47000,'2022-03-20');
insert into shop values (seq_shop.nextval,'���̳�Ƽ','white',16000,sysdate);
insert into shop values (seq_shop.nextval,'üũ����','red',17000,'2021-12-25');
insert into shop values (seq_shop.nextval,'���콺','yello',19500,'2021-03-29');
commit;

--��ǰ��ȸ
select * from shop;



--jumun ���̺� ����Ÿ �߰��ϱ�
--���� shop ��ǰ��Ͻ� ������� ��������Ȯ��
insert into jumun values (seq_shop.nextval,'�̿���',4,1);
insert into jumun values (seq_shop.nextval,'���缮',6,2); --6����ǰ������ 
--����:integrity constraint (BITCAMP.JUMUN_FK_IDX) violated - parent key not found >���°ɽ�ٶ�¶�
insert into jumun values (seq_shop.nextval,'���缮',5,3);
insert into jumun values (seq_shop.nextval,'�Ѱ���',1,2);
insert into jumun values (seq_shop.nextval,'������',3,1);
insert into jumun values (seq_shop.nextval,'������',4,3);
insert into jumun values (seq_shop.nextval,'������',2,1);
commit;
--�ֹ�Ȯ��
select * from jumun;

--join �ؼ� ��� (��ġ�ϴ� �� ���)
select
j.num,j.name,s.sangpum,s.color,s.price,j.cnt,s.ipgoday
from shop s,jumun j
where s.idx=j.idx;



--�÷���տ� ���̺���� ������ʸ� �����ϴ� ��� �����̰��ɹٷ����� j.num�� ��j���������վ num�̶��ص���

--��ǰ�� �ֹ��ѻ�����ִ� ���¿��� ��ǰ�� �����غ���
delete from shop where idx=1; --����:integrity constraint (BITCAMP.JUMUN_FK_IDX) violated - child record found>>�ֹ��ѻ�����ִٴ¸�

--������ ���������� view�������� ��ȸ���ʿ��Ҷ�����Ѵ�

--create �������:���λ��������� �����̸������� �����߻�
--create replace : ���λ����ϴµ� ���� �̸������� ����� 
create or replace view mycart
as
select
j.num,j.name,s.sangpum,s.color,s.price,j.cnt,s.ipgoday
from shop s,jumun j
where s.idx=j.idx; --�����߻� (������ ���,,,system������ bitcamp�� create view �� ���� ���� �߰��Ѵ�)

--view ��ȸ
select *from mycart;


