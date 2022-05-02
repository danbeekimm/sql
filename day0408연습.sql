--emp ���̺��� ��ü ����Ÿ Ȯ��
select * from employees;  --��ǥ�� ��ü����ǹ�--

--first_name�� last_name�� ��ȸ
select first_name,last_name from employees;

--emp�� ���̺�����Ȯ���ϰ�ʹ� >���̺��� ����Ȯ�ΰ���
desc employees;

--���������� �ѹ��������(�ߺ�����)
select DISTINCT job_id from employees; --DISTINCT:����������ִ���

--�̸��� �ٿ�������ϰ� ������'�̸�'����
select first_name||' '||last_name as "�̸�" from employees;
select first_name||' '||last_name "�� ��" from employees;  --""���� ������ ���̰��鰡��
select first_name||' '||last_name �̸� from employees; --�� �ѱۻ��̿� ������������ȵ�
--�۽�Ʈ���Ӱ� �̾���̴°� ������ĭ �� �̾��Ʈ���� ���''������ ����3���� ��������

--�������� �˻��� ��쿡 where�� ���
select first_name,job_id from employees where first_name='Steven'; --//�̸��̽�Ƽ���λ�� �������ٸ�

--A�ν����ϴ»���˻��� like ���
select first_name,job_id from employees where first_name like 'A%';

--A�� S�� �����ϴ»�� �˻�
select first_name,job_id from employees where first_name like 'A%' or first_name like 'S%';

--a��s�� �����ϰ��ִ»��
select first_name,job_id from employees where first_name like '%a%' or first_name like '%s%';

--��ҹ��ڻ������a��s�� �����ϰ��ִ»�� lower�� �ҹ��� upper�� �빮�ڷιٲ㼭�ϸ� �ٳ��� �빮�ڼҹ��ڰ����ִ»����
select first_name,job_id from employees where lower(first_name) like '%a%' or lower(first_name) like '%s%';
select first_name,job_id from employees where upper(first_name) like '%A%' or upper(first_name) like '%S%';

--lower,upperȮ��
select first_name ���̸�,upper(first_name) �빮��,lower(first_name) �ҹ��� from employees;

--first_name�� a�� �����»��
select first_name from employees where lower(first_name) like '%a';

--first_name ���� �ι�°���ڰ� a�λ�� _�̰��ѱ����� �ڿ�%�� �������»������������
select first_name from employees where first_name like '_a%'; 

--first_name ���� ����°���ڰ� a�λ�� _�̰��ѱ����� �ڿ�%�� �������»������������
select first_name from employees where first_name like '__a%'; 

--salary�� 5000�̻��ΰ�����
select first_name,salary from employees where salary>=5000;

--salary�� 5000�̻�~8000�ΰ�����
select first_name,salary from employees where salary>=5000 and salary<=8000;
select first_name,salary from employees where salary BETWEEN 5000 and 8000; --���2����

--salary �� 3000 �̸��̰ų� 10000�ʰ��ΰ�츸���
select first_name,salary from employees where salary<3000 or salary>10000;
select first_name,salary from employees where salary not BETWEEN 3000 and 10000; --���2����

--manager_id �� 100,103,120 �ΰ�����
SELECT first_name,manager_id from employees where manager_id=100 or manager_id=103 or manager_id=120;
SELECT first_name,manager_id from employees where manager_id in(100,103,120);--���2����

--first,salary,comm ���
SELECT first_name,salary,commission_pct from employees;

--first,salary,comm ����ϴµ� comm�� null�ΰ�츸 ����ρ�
SELECT first_name,salary,commission_pct from employees where commission_pct is null;

--first,salary,comm ����ϴµ� comm�� null�� �ƴѰ�� ����ρ�
SELECT first_name,salary,commission_pct from employees where commission_pct is not null;

--salary �� comm�� ���Ұ�� :comm�� null�̸� �����null
select salary+commission_pct from employees;

--NVL(�÷���:��):���ϰ�� �� ���� -mysql������ ifnull
select salary ����,NVL(commission_pct,0)Ŀ�̼�, salary+NVL(commission_pct,0)�ѿ��� from employees;

--comm �� ���� �ƴ� ����� salary�� 5000�̻��� �����ȸ(����� first_name ,salary, comm���)
select first_name,salary,commission_pct from employees where commission_pct is not null and salary>=5000;

--������it_prog�̰ų� pu_man�� ����� ��ȸ�ϱ�(first_name,job_id)
select first_name,job_id from employees where job_id = 'IT_PROG' or job_id = 'PU_MAN';
select first_name,job_id from employees where job_id in('IT_PROG','PU_MAN');--2������

--�׷��Լ� ����:min,max,sum,avg,count

--emp table�� �Ѱ��� ���ī��Ʈ:����
select count(*) count from employees;

--selary�� ���� ���
select sum (salary),avg(salary) from employees;  --��ռҼ����̳ʹ�����
select sum (salary),round(avg(salary),0) from employees;  --round:�ݿø�
select sum (salary),floor(avg(salary)) from employees;  --floor:�����ǳ���
select sum (salary),ceil(avg(salary)) from employees;  --ceil:�����ǿø�

--salary�� �ְ����� �������� �޴»��
select min(salary) ��������,max(salary) �ְ��� from employees;

--salary�� �������� ��������� �̸��� �������(��������)
select first_name,salary from employees where salary = (select min(salary) from employees);

--��տ������� ���̹޴»���� �̸�(first+last) �� �������
select first_name||' '||last_name name,salary from employees where salary > (select avg(salary) from employees);

--first_name�� bruce�� ���� ������ ������� ���(first_name,job_id ���)
select first_name,job_id from employees where job_id = (select job_id from employees where first_name='Bruce');

--�������ο����� ��տ������ϱ�
select job_id ����,count(*) �ο���,round(avg(salary),0) ��տ��� from employees group by job_id;
--���Ͱ����� ��տ����� ���� ������� ���(3����(��տ���) ����) desc:��������
select job_id ����,count(*) �ο���,round(avg(salary),0) ��տ��� from employees group by job_id order by 3 desc;
--���Ͱ����� �ο��������� �׷���� ���
select job_id ����,count(*) �ο���,round(avg(salary),0) ��տ��� from employees group by job_id order by 2 desc;

--���Ͱ����� �ο��� 5�� �̻��ΰ��� ���   count(job_id)>=5; ���⿡ ����̵� ���� *�� ����
select job_id ����,count(*) �ο���,round(avg(salary),0) ��տ��� from employees group by job_id having count(job_id)>=5;

--join�̿��ؼ� first_name�� department_id�� �̿��ؼ� �μ�����ȸ  �ݺ����ΰ� ���̺�����
SELECT e.first_name,d.department_name
from employees e,departments d
where e.department_id=d.department_id;

--���� sql������ �����ߺ��������� �÷����� �տ� ���̺�� ��������
SELECT first_name,department_name --�ϳ����������־ ��������
from employees e,departments d
where e.department_id=d.department_id; --��Ѵ� �̰ɰ������վ�ȵ�

--��¥�� ���� �Լ��鿬��(dual ����
select sysdate from dual; --��������
select sysdate+1 from dual;  --���� ��¥���ش�����
select sysdate+7 from dual;  --���� ��¥���������ϵ�

--���糯¥���� �⵵4�ڸ��� ����
select to_char(sysdate,'YYYY')from dual; --2022
select to_char(sysdate,'yyyy')from dual; --2022
select to_char(sysdate,'YY')from dual; --22
select to_char(sysdate,'YEAR')from dual; --���ڿ��γ���

--���糯¥���� ��2�ڸ��� ����
select to_char(sysdate,'MM') from dual; --04

--���糯¥�� ��¥�� �ð�����ǥ��
select to_char(sysdate,'yyyy-mm-dd HH24:MI') from dual; --2022-04-08 15:40
select to_char(sysdate,'yyyy-mm-dd am HH:MI') from dual; --2022-04-08 ���� 03:41

--emp ���̺��� first_name�� hire_date ����ϴµ� hire_date�� yyyy-mm-dd�����������
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date from employees ;

--hire_date ���� �⵵�� �����ؼ� 2006�⿡ �Ի��� �����ȸ(first_name,hire_date ���
select first_name,hire_date from employees where to_char(hire_date,'yyyy')='2006' ;
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date from employees where to_char(hire_date,'yyyy')='2006' ;

--hire_date ���� �⵵�� �����ؼ� 5���� �Ի��� �����ȸ(first_name,hire_date ���
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date from employees where to_char(hire_date,'mm')='05' ;

--�������÷��� �Ի�Ƚ�� ���(����⵵���� �Ի�⵵�� ����)
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date,
to_char(sysdate,'yyyy')-to_char(hire_date,'yyyy')�Ի�Ƚ�� from employees ;

--����Ŭ�� �����Լ�����
select abs(-5),abs(5) from dual; --������ ����� ���
select round(23.45,1) from dual; --23.5
select round(23.43,1) from dual; --23.4
select round(4567893,-1)from dual; --10������������ ��µ� �ݿø�
select round(4567893,-2)from dual; --100������������ ��µ� �ݿø�
select round(4567893,-3)from dual; --1000������������ ��µ� �ݿø�
select trunc(4567893,-3)from dual; --1000������������ ��µ� �ݳ���

select mod(10,3) from dual; --10�� 3���� ���� ������
select power(2,3) from dual; --2�� 3�� ,8

--�����Լ�
select concat('hello','kitty') from dual; --���ڿ����ϱ�
select 'hello'||'kitty' from dual; --���Ͱ���!
select initcap('hapPy DaY') from dual; --ù���ڸ� �빮�� �������ҹ��ڷιٲ���
select lower('hapPy DaY') from dual; --�ҹ��ڷ�
select upper('hapPy DaY') from dual; --�빮�ڷ�
select LPAD('3500',10,'*')from dual; --���ڸ��� �����ڸ�����ŭ �������� ��ǥ
select RPAD('3500',10,'*')from dual; --���ڸ��� �����ڸ�����ŭ ���������� ��ǥ
select substr('happy day',3,3) from dual; --3��°���ں���3������
select substr('happy day',-3,3) from dual; --�ڿ��� 3��°���ں���3������
select length('happy day')from dual; --���̱��� ��������
select replace('Have a Nice Day','a','*')from dual; --���a�� *�κ���
select replace('Have a Nice Day','Nice','Good')from dual; --nice�� good �κ���







