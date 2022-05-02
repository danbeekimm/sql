
--join������ ���̺����
--�θ����̺�:���ĸ��


create table food (
idx number(5) CONSTRAINT food_pk_idx primary key, --�̸�_�����̸Ӹ�Ű_idx
foodname varchar2(20) not null,
price number(7) not null);


--�ڽ����̺� :on delete cascade:�θ����̺��� ����Ÿ������� �ڽ����̺��� ����Ÿ�� �ڵ����� ��������.
create table foodjumun (
  num number(5) CONSTRAINT foodjumun_pk_num PRIMARY key,
  name varchar2(20),
  idx number(5),
  foodtime date,
  CONSTRAINT foodjumun_fk_idx FOREIGN key(idx) REFERENCES food(idx) on delete cascade);
  --�µ���Ʈ �������̵� :�������m�� ���İ�Ƽ �����ֹ��� �ֹ��� �ڵ����������� ����������� ����̴�������.
  


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

--Ȯ��
select * from food;

--�����ֹ����̺� ����Ÿ�ֱ�
insert into foodjumun values (seq_food.nextval,'���缮',20,'2022-04-15');
insert into foodjumun values (seq_food.nextval,'��ȣ��',10,'2022-05-10');
insert into foodjumun values (seq_food.nextval,'�̿���',50,sysdate);
insert into foodjumun values (seq_food.nextval,'����',60,'2022-04-10');
insert into foodjumun values (seq_food.nextval,'������',20,'2022-03-15');
commit;

--Ȯ��
select * from food;
select * from foodjumun;

--join
--���1
select name �ֹ���, foodname ���ĸ�, price ����, to_char(foodtime,'yyyy-mm-dd') ������
from food,foodjumun
where food.idx=foodjumun.idx;

--���2
select name �ֹ���, foodname ���ĸ�, price ����, to_char(foodtime,'yyyy-mm-dd') ������
from food inner join foodjumun
on food.idx=foodjumun.idx;  --����� �Ѵٰ���.

--outer join:foodjumun�� ���� food ������(null) ��� �ƹ��� �ֹ��������� ������ �˰�ʹ�.
select foodname �α��������
from food,foodjumun
where food.idx=foodjumun.idx(+) and num is null;

--null�� ������ ����Ÿ�� food���� �ִµ� foodjumun ���� ���� ������
select *
from food,foodjumun
where food.idx=foodjumun.idx(+);

--food���� idx�� 20�� ������ ������ foodjumun�� Ȯ���ϱ�
delete from food where idx=20;