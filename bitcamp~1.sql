
--join������ ���̺����
--�θ����̺�:���ĸ��


create table food (
idx number(5) CONSTRAINT food_pk_idx primary key, --�̸�_�����̸Ӹ�Ű_idx
foodname varchar2(20) not null,
price number(7) not null);


--�ڽ����̺� :on delete cascade:�θ����̺��� ����Ÿ������� �ڽ����̺��� ����Ÿ�� �ڵ����� ��������.
create table foodjumun (
num number(5) CONSTRAINT foodjumun_fk_idx primary key,
name varchar2(20),
idx number(5),
foodtime date,
CONSTRAINT foodjumun_fk_idx FOREIGN key(idx) REFERENCES food(idx) on delete cascade);

--����� ����������
create sequence seq_food start with 1 increment by 1 nocache;

--food�� foodname�� �˳��� 50 ����Ʈ�� ����
alter table food modify foodname varchar2(50);

--food ���̺� ����Ÿ �ֱ�
insert into food values (10,'���񷹽��İ�Ƽ',17000);
insert into food values (20,'���캺����',11000);
insert into food values (30,'�����',8000);
insert into food values (40,'ũ�����İ�Ƽ',12000);
insert into food values (50,'¥���',8000);
insert into food values (60,'���κ��',9000);




