--�������������
--�������� ���� ��� a1234�� ��������
create user angel identified by a1234;--cmd�� sqlplus ġ�� ���ġ�� ��������, �⺻���������

--angel������ connect,resource �����ֱ�
grant connect,resource to angel;  --grant�� �����ִ°� : Ŀ��Ʈ�� ���ҽ��� �������� �����ְڴ�.

--angel������ �ΰ��� ��������� ����
revoke connect, resource from angel; --angel�κ��� ���Ѵٽû���

--angel ���� ���� (���൥�����ִٸ� ��� ����)
drop user angel;  --�ý��۰������� �ƿ� �����ع���

--bitccamp /a1234 ���������� �⺻�����ּ���
create user bitcamp identified by a1234;

grant connect,resource to bitcamp;

--bitcamp ������ ���� �߰�
grant create view to bitcamp;

