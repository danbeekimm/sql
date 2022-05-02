--emp 테이블의 전체 데이타 확인
select * from employees;  --별표는 전체라는의미--

--first_name과 last_name만 조회
select first_name,last_name from employees;

--emp의 테이블구조를확인하고싶다 >테이블명과 구조확인가능
desc employees;

--직업종류별 한번씩만출력(중복제거)
select DISTINCT job_id from employees; --DISTINCT:어떤직업군이있는지

--이름을 붙여서출력하고 제목을'이름'으로
select first_name||' '||last_name as "이름" from employees;
select first_name||' '||last_name "이 름" from employees;  --""제목에 있으니 사이공백가능
select first_name||' '||last_name 이름 from employees; --단 한글사이에 공백이있으면안돼
--퍼스트네임과 이어붙이는게 공백한칸 또 이어서라스트네임 가운덴''만가능 위에3개다 같은거임

--조건으로 검색할 경우에 where절 사용
select first_name,job_id from employees where first_name='Steven'; --//이름이스티븐인사람 직업은다름

--A로시작하는사람검색시 like 사용
select first_name,job_id from employees where first_name like 'A%';

--A나 S로 시작하는사람 검색
select first_name,job_id from employees where first_name like 'A%' or first_name like 'S%';

--a나s를 포함하고있는사람
select first_name,job_id from employees where first_name like '%a%' or first_name like '%s%';

--대소문자상관없이a나s를 포함하고있는사람 lower은 소문자 upper은 대문자로바꿔서하면 다나옴 대문자소문자갖고있는사람이
select first_name,job_id from employees where lower(first_name) like '%a%' or lower(first_name) like '%s%';
select first_name,job_id from employees where upper(first_name) like '%A%' or upper(first_name) like '%S%';

--lower,upper확인
select first_name 원이름,upper(first_name) 대문자,lower(first_name) 소문자 from employees;

--first_name이 a로 끝나는사람
select first_name from employees where lower(first_name) like '%a';

--first_name 에서 두번째글자가 a인사람 _이게한글자임 뒤에%는 나머지는상관없음을말함
select first_name from employees where first_name like '_a%'; 

--first_name 에서 세번째글자가 a인사람 _이게한글자임 뒤에%는 나머지는상관없음을말함
select first_name from employees where first_name like '__a%'; 

--salary가 5000이상인경우출력
select first_name,salary from employees where salary>=5000;

--salary가 5000이상~8000인경우출력
select first_name,salary from employees where salary>=5000 and salary<=8000;
select first_name,salary from employees where salary BETWEEN 5000 and 8000; --방법2가지

--salary 가 3000 미만이거나 10000초과인경우만출력
select first_name,salary from employees where salary<3000 or salary>10000;
select first_name,salary from employees where salary not BETWEEN 3000 and 10000; --방법2가지

--manager_id 가 100,103,120 인경우출력
SELECT first_name,manager_id from employees where manager_id=100 or manager_id=103 or manager_id=120;
SELECT first_name,manager_id from employees where manager_id in(100,103,120);--방법2가지

--first,salary,comm 출력
SELECT first_name,salary,commission_pct from employees;

--first,salary,comm 출력하는데 comm이 null인경우만 출력하곺
SELECT first_name,salary,commission_pct from employees where commission_pct is null;

--first,salary,comm 출력하는데 comm이 null이 아닌경우 출력하곺
SELECT first_name,salary,commission_pct from employees where commission_pct is not null;

--salary 와 comm을 더할경우 :comm이 null이면 결과도null
select salary+commission_pct from employees;

--NVL(컬럼명:값):널일경우 값 지정 -mysql에서는 ifnull
select salary 연봉,NVL(commission_pct,0)커미션, salary+NVL(commission_pct,0)총연봉 from employees;

--comm 이 널이 아닌 사람중 salary가 5000이상인 사람조회(출력은 first_name ,salary, comm출력)
select first_name,salary,commission_pct from employees where commission_pct is not null and salary>=5000;

--직업이it_prog이거나 pu_man인 사람을 조회하기(first_name,job_id)
select first_name,job_id from employees where job_id = 'IT_PROG' or job_id = 'PU_MAN';
select first_name,job_id from employees where job_id in('IT_PROG','PU_MAN');--2개동일

--그룹함수 연습:min,max,sum,avg,count

--emp table의 총갯수 노란카운트:제목
select count(*) count from employees;

--selary의 총합 평균
select sum (salary),avg(salary) from employees;  --평균소숫점이너무많음
select sum (salary),round(avg(salary),0) from employees;  --round:반올림
select sum (salary),floor(avg(salary)) from employees;  --floor:무조건내림
select sum (salary),ceil(avg(salary)) from employees;  --ceil:무조건올림

--salary의 최고연봉과 최저연봉 받는사람
select min(salary) 최저연봉,max(salary) 최고연봉 from employees;

--salary의 최저연봉 받은사람의 이름과 연봉출력(서브쿼리)
select first_name,salary from employees where salary = (select min(salary) from employees);

--평균연봉보다 많이받는사람의 이름(first+last) 과 연봉출력
select first_name||' '||last_name name,salary from employees where salary > (select avg(salary) from employees);

--first_name이 bruce와 같은 직업을 가진사람 출력(first_name,job_id 출력)
select first_name,job_id from employees where job_id = (select job_id from employees where first_name='Bruce');

--직업별인원수와 평균연봉구하기
select job_id 직업,count(*) 인원수,round(avg(salary),0) 평균연봉 from employees group by job_id;
--위와같은데 평균연봉이 높은 순서대로 출력(3번열(평균연봉) 기준) desc:내림차순
select job_id 직업,count(*) 인원수,round(avg(salary),0) 평균연봉 from employees group by job_id order by 3 desc;
--위와같은데 인원수가많은 그룹부터 출력
select job_id 직업,count(*) 인원수,round(avg(salary),0) 평균연봉 from employees group by job_id order by 2 desc;

--위와같은데 인원수 5인 이상인곳만 출력   count(job_id)>=5; 여기에 잡아이디 말고 *도 가능
select job_id 직업,count(*) 인원수,round(avg(salary),0) 평균연봉 from employees group by job_id having count(job_id)>=5;

--join이용해서 first_name과 department_id를 이용해서 부서명조회  반복적인거 테이블만들어서함
SELECT e.first_name,d.department_name
from employees e,departments d
where e.department_id=d.department_id;

--위의 sql문에서 서로중복되지않은 컬럼명은 앞에 테이블명 생략가능
SELECT first_name,department_name --하나만가지고있어서 생략가능
from employees e,departments d
where e.department_id=d.department_id; --얜둘다 이걸가지고잇어서안돼

--날짜에 관한 함수들연습(dual 연습
select sysdate from dual; --오늘현재
select sysdate+1 from dual;  --현재 날짜기준다음날
select sysdate+7 from dual;  --현재 날짜기준일주일뒤

--현재날짜에서 년도4자리만 추출
select to_char(sysdate,'YYYY')from dual; --2022
select to_char(sysdate,'yyyy')from dual; --2022
select to_char(sysdate,'YY')from dual; --22
select to_char(sysdate,'YEAR')from dual; --문자열로나옴

--현재날짜에서 월2자리만 추출
select to_char(sysdate,'MM') from dual; --04

--현재날짜를 날짜와 시간으로표시
select to_char(sysdate,'yyyy-mm-dd HH24:MI') from dual; --2022-04-08 15:40
select to_char(sysdate,'yyyy-mm-dd am HH:MI') from dual; --2022-04-08 오후 03:41

--emp 테이블에서 first_name과 hire_date 출력하는데 hire_date는 yyyy-mm-dd형식으로출력
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date from employees ;

--hire_date 에서 년도를 추출해서 2006년에 입사한 사람조회(first_name,hire_date 출력
select first_name,hire_date from employees where to_char(hire_date,'yyyy')='2006' ;
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date from employees where to_char(hire_date,'yyyy')='2006' ;

--hire_date 에서 년도를 추출해서 5월에 입사한 사람조회(first_name,hire_date 출력
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date from employees where to_char(hire_date,'mm')='05' ;

--마지막컬럼에 입사횟수 출력(현재년도에서 입사년도를 뺀값)
select first_name,to_char(hire_date,'yyyy-mm-dd') hire_date,
to_char(sysdate,'yyyy')-to_char(hire_date,'yyyy')입사횟수 from employees ;

--오라클의 숫자함수연습
select abs(-5),abs(5) from dual; --무조건 양수값 출력
select round(23.45,1) from dual; --23.5
select round(23.43,1) from dual; --23.4
select round(4567893,-1)from dual; --10원단위까지만 출력됨 반올림
select round(4567893,-2)from dual; --100원단위까지만 출력됨 반올림
select round(4567893,-3)from dual; --1000원단위까지만 출력됨 반올림
select trunc(4567893,-3)from dual; --1000원단위까지만 출력됨 반내림

select mod(10,3) from dual; --10을 3으로 나눈 나머지
select power(2,3) from dual; --2의 3승 ,8

--문자함수
select concat('hello','kitty') from dual; --문자열더하기
select 'hello'||'kitty' from dual; --위와같다!
select initcap('hapPy DaY') from dual; --첫글자만 대문자 나머지소문자로바꿔줌
select lower('hapPy DaY') from dual; --소문자로
select upper('hapPy DaY') from dual; --대문자로
select LPAD('3500',10,'*')from dual; --열자리중 남은자리수만큼 왼쪽으로 별표
select RPAD('3500',10,'*')from dual; --열자리중 남은자리수만큼 오른쪽으로 별표
select substr('happy day',3,3) from dual; --3번째글자부터3개추출
select substr('happy day',-3,3) from dual; --뒤에서 3번째글자부터3개추출
select length('happy day')from dual; --길이구함 공백포함
select replace('Have a Nice Day','a','*')from dual; --모든a를 *로변경
select replace('Have a Nice Day','Nice','Good')from dual; --nice를 good 로변경







