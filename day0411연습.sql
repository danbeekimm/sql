--연습용계정생성
--계정명이 엔젤 비번 a1234인 계정생성
create user angel identified by a1234;--cmd에 sqlplus 치고 비번치면 에러나옴, 기본권한줘야함

--angel계정에 connect,resource 권한주기
grant connect,resource to angel;  --grant는 권한주는거 : 커낵트와 리소스를 엔젤에게 권한주겠다.

--angel계정에 두가지 권한줬던걸 뺏기
revoke connect, resource from angel; --angel로부터 권한다시뺏기

--angel 계정 제거 (만약데이터있다면 모두 삭제)
drop user angel;  --시스템계정에서 아예 삭제해버림

--bitccamp /a1234 계정생성후 기본권한주세요
create user bitcamp identified by a1234;

grant connect,resource to bitcamp;

--bitcamp 계정에 권한 추가
grant create view to bitcamp;

